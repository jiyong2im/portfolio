<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import ="java.time.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String repw = request.getParameter("repw");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String address = request.getParameter("address");
	String sex = request.getParameter("sex");



	if (id != null && id.length() > 0 &&
		pw != null && pw.length() > 0 &&
		name != null && name.length() > 0 &&
		nick != null && nick.length() > 0 &&
		address != null && address.length() > 0 &&
		sex != null && sex.length() > 0 ) {



	 Class.forName("org.mariadb.jdbc.Driver");
     try (
         Connection conn = DriverManager.getConnection(
                 "jdbc:mariadb://localhost:3306/movieverse17", "root", "1234");
         Statement stmt = conn.createStatement();

     ) {
		String curTime = LocalDate.now() + " " + LocalTime.now().toString().substring(0,8);
		stmt.executeQuery(String.format(
        		 "insert into member (member_id, member_pw, member_name, member_nick, member_sex, member_address, member_regtime) values ('%s','%s','%s','%s','%s','%s','%s');",
				  id, pw, name, nick, sex, address,curTime));


     } catch(Exception e) {
         e.printStackTrace();
     }

%>
<script>
	alert('등록이 완료되었습니다.');
	<!--response.sendRedirect("login_main.jsp"); -->
	location.href = "login_main.jsp";
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
