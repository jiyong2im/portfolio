<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    String userId = (String)session.getAttribute("userId");
    request.setAttribute("userId", userId);
	if(userId != null){
		response.sendRedirect("share_main.jsp");
		return;
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <script>
	 		alert("로그인이 필요한 기능입니다.");
 			history.back();
  	</script>
</body>
</html>