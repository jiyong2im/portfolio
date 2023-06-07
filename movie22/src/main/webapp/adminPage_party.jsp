<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/admin_other.css"/>
<title>MOVIEVERSE</title>
</head>
<body>
    <header class="header">
        <section class="flex">
            <a href="index.jsp" class="logo"><img src="img/logo2.png" alt=""></a>
		</section>
    </header>
    <div class="main">
        <div class="left">
            <div class="photo">

            </div>
            <div class="page">
               
                <a href="adminPage.jsp">회원정보</a>
                <a href="adminPage_review.jsp">리뷰정보</a>
                <a href="adminPage_party.jsp">파티정보</a>
            </div>
            </div>
        
        <div class="right">
            <div class="id">
				<h2>파티+파티장 정보</h2> <a href="adminPage_party_mem.jsp"><h2>파티원정보</h2></a>
            </div>
			<div>
			<p>결제처리</p>
				<form action="fee_process.jsp" method="post">
					<select name="ott">
							<option value="넷플릭스">넷플릭스</option>
							<option value="티빙">티빙</option>
							<option value="디즈니플러스">디즈니플러스</option>
							<option value="웨이브">웨이브</option>
							<option value="왓챠">왓챠</option>
						</select>
					<div class="login"><input type="submit" value="결제처리 버튼"></div>
					
			<!-- <div class="join"><input type="button" value="회원 가입"
				onclick="window.open('member_join_form.jsp', 'popup', 'width=500, height=200')"> </div> -->
		</form>
			</div>
              <table>
                  <tr>
					  <th>파티번호</th>
                      <th>파티개설일</th>
                      <th>파티등록 인원</th>
                      <th>ott이름</th>
                      <th>ott가격</th>
                      <th>파티장 회원번호</th>
                      <th>등록은행</th>
                      <th>등록계좌</th>
                      <th>ott_id</th>
					  <th>ott_pw</th>
                  </tr>
                  <%


                      Class.forName("org.mariadb.jdbc.Driver");
                       try (
                           Connection conn = DriverManager.getConnection(
                                  "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
                  			Statement stmt = conn.createStatement();
                  			ResultSet rs = stmt.executeQuery("select * from shareParty;");



                  ) {
                      while (rs.next()) {
                   %>
                  <tr>
					<td><%=rs.getInt("shareParty_num")%></td>
					<td><%=rs.getString("shareParty_time")%></td>
					<td><%=rs.getInt("shareParty_gauge")%></td>
                    <td><%=rs.getString("ott_name")%></td>
                    <td><%=rs.getInt("ott_price")%></td>
                    <td><%=rs.getInt("header_num")%></td>
                    <td><%=rs.getString("shareHeader_bankName")%></td>
                    <td><%=rs.getString("shareHeader_accountNum")%></td>
                    <td><%=rs.getString("ott_id")%></td>
					<td><%=rs.getString("ott_pw")%></td>
                    
                  </tr>
                  <%
                          }

                      } catch(Exception e) {
                          e.printStackTrace();
                      }
                  %>
              </table>

            

        </div>
    </div>
</body>
</html>
