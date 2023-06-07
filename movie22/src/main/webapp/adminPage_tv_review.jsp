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
				<a href="adminPage_review.jsp"><h2>영화 리뷰</h2></a> <h2>티비시리즈 리뷰</h2>
            </div>
              <table>
                  <tr>
					  <th>리뷰번호</th>
                      <th>별점</th>
                      <th>회원번호</th>
                      <th>리뷰내용</th>
                      <th>리뷰작성시간</th>
                      <th>작성자닉네임</th>
                      <th>아이디</th>
                      <th>포스터패스</th>
                      <th>분류</th>
                  </tr>
                  <%


                      Class.forName("org.mariadb.jdbc.Driver");
                       try (
                           Connection conn = DriverManager.getConnection(
                                  "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
                  			Statement stmt = conn.createStatement();
                  			ResultSet rs = stmt.executeQuery("select * from tv_review;");



                  ) {
                      while (rs.next()) {
                   %>
                  <tr>
					<td><%=rs.getInt("t_review_num")%></td>
					<td><%=rs.getInt("t_review_star")%></td>
					<td><%=rs.getInt("member_num")%></td>
                    <td><%=rs.getString("t_review_content")%></td>
                    <td><%=rs.getString("t_review_time")%></td>
                    <td><%=rs.getString("t_review_content_id")%></td>
                    <td><%=rs.getString("member_nick")%></td>
                    <td><%=rs.getString("member_id")%></td>
                    <td><%=rs.getString("poster_path")%></td>
					<td><%=rs.getString("type")%></td>
                    
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
