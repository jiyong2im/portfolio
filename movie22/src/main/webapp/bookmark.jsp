<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%@ page import= "com.board.db.*" %>

<%
// 타입, 포스터, 아이디 회원정보 디비 입력 후 마이페이지에서 다시 꺼낼 떈 아이디타입으로 다시 검색. 
// <a href="content_main.jsp?id=${release_date.id}&type=tv">
String id = request.getParameter("id");
String type = request.getParameter("type");
String poster_path = request.getParameter("poster_path");
String userId ="";
if((String)session.getAttribute("userId") == null){
	
}else{
	userId = (String)session.getAttribute("userId"); 
	new BoardDao().checkBookmark(id, userId, poster_path, type);
}/* else{xxx
	userId = (String)session.getAttribute("userId"); 
	new BoardDao().setTvBookmark(id, userId, poster_path, type);
}
 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
history.back();
 </script>

</body>
</html>