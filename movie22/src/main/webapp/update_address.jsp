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
  String user_addr= request.getParameter("user_addr");


	if (user_addr != null && user_addr.length() > 0 )  {



	 Class.forName("org.mariadb.jdbc.Driver");
	  try (
             Connection conn = DriverManager.getConnection(
                     "jdbc:mariadb://localhost:3306/movieverse17", "root", "1234");
                Statement stmt = conn.createStatement();
              ) {
                
                 stmt.executeUpdate(String.format(
                 "update member set member_address= '%s' where member_num=%d ;",
                user_addr,member_num));
		
				
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
