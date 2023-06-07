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
<link rel="stylesheet" href="css/admin.css"/>
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
<!--                 <img src="img/act.png">
 -->            </div>
            <div class="page">
                <a href="adminPage.jsp">회원정보</a>
                <a href="adminPage_review.jsp">리뷰정보</a>
                <a href="adminPage_party.jsp">파티정보</a>
            </div>
        </div>
        <div class="right">
            <div class="id">

              <table>
                  <tr>
					  <th>회원번호</th>
                      <th>이름</th>
                      <th>아이디</th>
                      <th>비밀번호</th>
                      <th>닉네임</th>
                      <th>성별</th>
                      <th>주소</th>
                      <th>보유포인트</th>
                      <th>가입일</th>
                  </tr>
                  <%


                      Class.forName("org.mariadb.jdbc.Driver");
                       try (
                           Connection conn = DriverManager.getConnection(
                                  "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
                  			Statement stmt = conn.createStatement();
                  			ResultSet rs = stmt.executeQuery("select * from member;");



                  ) {
                      while (rs.next()) {
                   %>
                  <tr>
					<td><%=rs.getInt("member_num")%></td>
                    <td><%=rs.getString("member_name")%></td>
                    <td><%=rs.getString("member_id")%></td>
                    <td><%=rs.getString("member_pw")%></td>
                    <td><%=rs.getString("member_nick")%></td>
                    <td><%=rs.getString("member_sex")%></td>
                    <td><%=rs.getString("member_address")%></td>
                    <td><%=rs.getInt("member_money")%></td>
                    <td><%=rs.getString("member_regtime")%></td>
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
    </div>
</body>
</html>
