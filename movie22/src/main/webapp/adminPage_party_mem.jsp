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
				<a href="adminPage_party.jsp"><h2>파티+파티장 정보</h2></a> <h2>파티원정보</h2>
            </div>
              <table>
                  <tr>
					  <th>파티가입자 개별번호</th>
                      <th>회원번호</th>
                      <th>가입파티번호</th>
                     
                  </tr>
                  <%


                      Class.forName("org.mariadb.jdbc.Driver");
                       try (
                           Connection conn = DriverManager.getConnection(
                                   "jdbc:mariadb://localhost:3306/movieverse17", "root", "1234");
                  			Statement stmt = conn.createStatement();
                  			ResultSet rs = stmt.executeQuery("select * from shareMember;");



                  ) {
                      while (rs.next()) {
                   %>
                  <tr>
					<td><%=rs.getInt("shareMember_num")%></td>
					<td><%=rs.getInt("member_num")%></td>
                    <td><%=rs.getInt("shareParty_num")%></td>
                    
                    
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
