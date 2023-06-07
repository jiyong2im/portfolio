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
  int user_money= Integer.parseInt(request.getParameter("user_money"));

  String charge_money = request.getParameter("charge_money");
  int point =0;

	switch(charge_money){
		case "오천원":
			point=5000;
			break;
		case "만원":
			point=10000;
			break;
		
		default:
			point= 0;
			break;
	}
	int update_money = point+user_money;
	
	if (charge_money != null && charge_money.length() > 0 )  {



	 Class.forName("org.mariadb.jdbc.Driver");
	  try (
             Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
                Statement stmt = conn.createStatement();
              ) {
                
                 stmt.executeUpdate(String.format(
                 "update member set member_money= '%s' where member_num=%d ;",
                update_money,member_num));
		
				
              } catch(Exception e){
                 e.printStackTrace();
              }

%>
<script>
	alert('충전이 완료되었습니다.');
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
