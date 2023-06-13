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
   <script type="text/javascript" src="https://business.juso.go.kr/juso_support_center/js/addrlink/map/jusoro_map_api.min.js?confmKey=U01TX0FVVEgyMDIyMTIwODEwNTc1NDExMzMwNTI=&skinType="></script>
   <script type="text/javascript">
   	// 검색요청
   	// type1.좌표정보(GRS80, EPSG:5179)
   	function callJusoroMapApiType1(){
   		var frm = document.sampleForm;
   		window.postMessage({ functionName: 'callJusoroMapApi', params: [frm.pointX.value, frm.pointY.value] }, '*');
   	}
   	// type2.도로명주소 코드정보
   	function callJusoroMapApiType2(){
   		var frm = document.sampleForm;
   		window.postMessage({ functionName: 'callJusoroMapApi', params: [frm.admCd.value, frm.rnMgtSn.value, frm.udrtYn.value, frm.buldMnnm.value, frm.buldSlno.value] }, '*');
   	}
   	// type3.검색어
   	function callJusoroMapApiType3(){
   		var frm = document.sampleForm;
   		window.postMessage({ functionName: 'callJusoroMapApi', params: [frm.searchKeyword.value] }, '*');
   	}
   </script>

</head>
<body>
<%
request.setCharacterEncoding("utf-8");


    String catgo_r = request.getParameter("catgo");
	String search_r = request.getParameter("search");
	String catgo_name="";
	if( catgo_r.equals("gu")){
		catgo_name="구별";
	}else if(catgo_r.equals("dong")){
		catgo_name="동별";
	}else if(catgo_r.equals("bus_name")){
		catgo_name="사업장명";
	}else if(catgo_r.equals("phone")){
		catgo_name="전화번호";
	}else if(catgo_r.equals("addr_new")){
		catgo_name="소재지도로명주소";
	}else if(catgo_r.equals("addr_old")){
		catgo_name="소재지지번주소";
	}

%>
<div>
	<h2>성남시 동물병원/약국 api활용</h2>
	<div>
		<img src="http://redtiger08.dothome.co.kr/images/animal.png" alt="성남시동물약국api활용" >
	</div>
</div>
<div class="main" >
<h2><%=catgo_name%>에서 <%=search_r%>을(를) 검색한 결과입니다.</h2>


<form name="sampleForm" id="sampleForm" method="post">
  <div class="mapCoord_wrap">
    <div class="mapCoordinate" style="text-align: center;">
      <h2>주소입력창</h2>
    </div>
    <div class="mapCoordinate">
      <p><b>좌표정보 검색</b></p>
      <span>X좌표:</span>&nbsp;<input type="text" id="pointX" name="pointX" value="945959.0381341814" /><br/>
      <span>Y좌표:</span>&nbsp;<input type="text" id="pointY" name="pointY" value="1953851.7348996028" /><br/>
      <div><input type="button" onclick="javascript:callJusoroMapApiType1();" value="검색" /></div>
    </div>
    <div class="mapCoordinate">
      <p><b>도로명주소 코드검색</b></p>
      <span>행정구역코드:</span>&nbsp;<input type="text" id="admCd" name="admCd" value="1144012700" /><br/>
      <span>도로명코드:</span>&nbsp;<input type="text" id="rnMgtSn" name="rnMgtSn" value="114403113012" /><br/>
      <span>지하여부:</span>&nbsp;<input type="text" id="udrtYn" name="udrtYn" value="0" /><br/>
      <span>건물본번:</span>&nbsp;<input type="text" id="buldMnnm" name="buldMnnm" value="301" /><br/>
      <span>건물부번:</span>&nbsp;<input type="text" id="buldSlno" name="buldSlno" value="0" /><br/>
      <div><input type="button" onclick="javascript:callJusoroMapApiType2();" value="검색" /></div>
    </div>
    <div class="mapCoordinate">
      <p><b>주소 검색</b></p>
      <span>검색어:</span>&nbsp;<input type="text" id="searchKeyword" name="searchKeyword" value="<%=search_r%>" /><br/>
      <div><input type="button" onclick="javascript:callJusoroMapApiType3();" value="검색" /></div>
    </div>
  </div>
</form>

	<div id="mapWrap" class="mapWrap" style="position:absolute; left:400px; top:400px; width:calc(100% - 300px); height:400px; border-left: 1px solid #ddd;"></div>

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
	search_r= "%"+search_r+"%";



    Class.forName("org.mariadb.jdbc.Driver");
     try (
         Connection conn = DriverManager.getConnection(
                 "jdbc:mariadb://localhost:3306/movieverse17", "root", "1234");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from animal2_20210624 WHERE "+catgo_r+" LIKE '"+search_r+"';");



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


</body>
</html>
