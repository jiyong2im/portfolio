<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import ="java.time.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

  int member_num= Integer.parseInt(request.getParameter("member_num"));
  String user_pw= request.getParameter("user_pw");


	if (user_pw != null && user_pw.length() > 0 )  {



	 Class.forName("org.mariadb.jdbc.Driver");
	  try (
             Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
                Statement stmt = conn.createStatement();
              ) {
                
                 stmt.executeUpdate(String.format(
                 "update member set member_pw= '%s' where member_num=%d ;",
                user_pw,member_num));
		
				
              } catch(Exception e){
                 e.printStackTrace();
              }

%>
<script>
	alert('수정이 완료되었습니다.');
	<!--response.sendRedirect("login_main.jsp"); -->
	location.href = "myPage.jsp";
</script>
<%
		}else {
%>
<script>
	alert('빈칸없이 입력하세요.');
	history.back();
</script>
<%
}

%>



</body>
</html>
