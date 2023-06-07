<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String userId = (String)session.getAttribute("userId");
    request.setAttribute("userId", userId);
	if(userId != null){
	    int shareParty_num= Integer.parseInt(request.getParameter("shareParty_num"));
	    String ott_name= request.getParameter("ott_name");
		response.sendRedirect("share_party.jsp?shareParty_num=shareParty_num&ott_name=ott_name");
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
 <script> alert("로그인이 필요합니다.");
  history.back();
  </script>
</body>
</html>