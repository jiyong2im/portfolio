<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import ="java.time.*" %>    
<%@ page import= "com.board.json.*" %>
<%@ page import= "com.board.db.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String userId = ""; 
	String userName = ""; 
	int userNum = 0;
	
	int shareParty_gauge =Integer.parseInt(request.getParameter("send_gauge"));
	
	int shareParty_num =Integer.parseInt(request.getParameter("shareParty_num"));

	userId = (String)session.getAttribute("userId"); 
	userName = (String)session.getAttribute("userName"); 
	userNum = (Integer)session.getAttribute("userNum");


	 Class.forName("org.mariadb.jdbc.Driver");
	  try (
             Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
                Statement stmt = conn.createStatement();
				Statement stmt2 = conn.createStatement();
              ) {
               
                  stmt.executeQuery(String.format(
                 "insert into shareMember (member_num, shareParty_num) values (%d,%d);",
                userNum, shareParty_num));
				
				stmt2.executeUpdate(String.format(
                 "update shareParty set shareParty_gauge =%d where shareParty_num = %d",
                             shareParty_gauge, shareParty_num));
              } catch(Exception e){
                 e.printStackTrace();
              }

%>
<script>
	alert('가입이 완료되었습니다.');
	<!--response.sendRedirect("login_main.jsp"); -->
	location.href = "accountSharing.jsp";
</script>	




</body>
</html>