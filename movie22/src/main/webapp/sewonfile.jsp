<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성남시 동물병원/ 약국 api활용</title>
   <!-- <link rel="stylesheet" href="css/share_party.css"/> -->
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

%>
<div>
	<h2>성남시 동물병원/약국 api활용</h2>
	<div>
		<img src="http://redtiger08.dothome.co.kr/images/animal.png" alt="성남시동물약국api활용" >
	</div>
</div>
<div class="main" >
<h2>기본테이블</h2>
<div id="search_box">
		<form action="animal_result.jsp" method ="get">
			<select name= "catgo">
				<option value="gu"> 구 별 </option>
				<option value="dong"> 동 별 </option>
				<option value="bus_name"> 사업장명 </option>
				<option value="phone"> 전화번호 </option>
				<option value="addr_new"> 소재지도로명주소 </option>
				<option value="addr_old"> 소재지지번주소 </option>
			</select>
			<input type="text" name="search" size="50" required= "required" /> <button>검색</button>
		</form>
	</div>
 <table style="background-image: url('http://movieverse17.cafe24.com/img/backimg.png');
			background-repeat: no-repeat;
			background-size: cover;">
     <tr class="menu" style=" position: sticky;
							  top: 0px;
						      background-color: gray !important;">
         <th style="width:100px;">구별</th>
         <th style="width:100px;">동별</th>
         <th style="width:200px;">사업자명</th>
		 <th style="width:200px;">인허가일자</th>
		 <th style="width:600px;">소재지도로명주소</th>
         <th style="width:600px;">소재지지번주소</th>
		 <th style="width:200px;">전화번호</th>
		 <th style="width:100px;">위도</th>
         <th style="width:100px;">경도</th>
     </tr>
<%


    Class.forName("org.mariadb.jdbc.Driver");
     try (
         Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from animal2_20210624 ;");


) {
    while (rs.next()) {
 %>
     <tr>
         <td><%=rs.getString("gu")%></td>
		 <td><%=rs.getString("dong")%></td>
         <td> <a href="animal_view.jsp?Latitude=<%=rs.getDouble("Latitude")%>&Longitude=<%=rs.getDouble("Longitude")%>"><%=rs.getString("bus_name")%></a></td>
		 <td><%=rs.getDate("permit_date")%></td>
		 <td><%=rs.getString("addr_new")%></td>
		 <td><%=rs.getString("addr_old")%></td>
         <td><%=rs.getString("phone")%></td>
		 <td><%=rs.getString("Latitude")%></td>
         <td><%=rs.getString("Longitude")%></td>

     </tr>
 <%
         }

     } catch(Exception e) {
         e.printStackTrace();
     }
 %>
 </table>


 <input type="button" value="메인페이지 이동" onclick="location.href='sewonfile.jsp'">


 </div>
 <br>
 <br>
 <br>


</body>
</html>
