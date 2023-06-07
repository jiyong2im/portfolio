<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ page import= "com.board.db.*" %>
    
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
String userId = ""; 
String userName = ""; 
int userNum = 0;
String review = request.getParameter("review");
String id = (String)request.getParameter("id");
String type = (String)request.getParameter("type");
String poster_path = (String)request.getParameter("poster_path");

if(review == ""){
	response.sendRedirect("error1.jsp");
	return;
}
if(request.getParameter("reviewStar") == null ){
	response.sendRedirect("error.jsp");
	return;
}
Integer reviewStar = Integer.parseInt(request.getParameter("reviewStar"));
if((String)session.getAttribute("userId") != null){
	if(type.equals("movie")){
		 userId = (String)session.getAttribute("userId"); 
		 userName = (String)session.getAttribute("userName"); 
		 userNum = (Integer)session.getAttribute("userNum");
		new BoardDao().insertReviewMovie(userName, userId, userNum, review, reviewStar, id, poster_path, type);

	}else {
		 userId = (String)session.getAttribute("userId"); 
		 userName = (String)session.getAttribute("userName"); 
		 userNum = (Integer)session.getAttribute("userNum");
		new BoardDao().insertReviewTv(userName, userId, userNum, review, reviewStar, id, poster_path, type);

	}
}else{
	response.sendRedirect("error2.jsp");
	return;
}

%>
 <html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <script type="text/javascript">

/*  window.opener.location.href = window.opener.document.URL;
 */ /* history.go(-1); */
</script> window.location = document.referre;

 <script type="text/javascript">
 opener.location.replace("contetn_main.jsp");
 window.close();</script>
 
 	 <script>
 			history.back();
  	</script>

</body>
</html>