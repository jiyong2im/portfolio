<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%
String search = request.getParameter("search");
request.setAttribute("search",search);

request.setAttribute("searchdata", new JsonDAO().getSearchData(search));
request.setAttribute("num", new JsonDAO().getSearchNumber(search));


String userId = (String)session.getAttribute("userId");
request.setAttribute("userId", userId);

String userNick = (String)session.getAttribute("userNick");
request.setAttribute("userNick", userNick);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/SearchData.css"/>
    <title>MOVIEVERSE</title>
</head>
<body>
    <header class="header">
        <section class="flex">
            <a href="index.jsp" class="logo"><img src="img/logo2.png" alt=""></a>
            <nav class="navbar">
                <a href="movie_mian.jsp">영화</a>
                <a href="tv_main.jsp">TV시리즈</a>
                <a href="share_main.jsp">계정공유</a>
            </nav>
			<div class="navbarRight">
					<form action="SearchData.jsp" method ="get" style="display: flex;">
					<input id="searchInput" type="text" placeholder="${search}" name="search" size="35" required="required" />
					<input class="serch_Img" name="button" type="image" src="img/searchBtn.png" />
					</form>
					<c:choose>
					<c:when test="${userId eq null}">
						<a class="login" href="login_main.jsp">로그인</a>
					</c:when>
					<c:otherwise>						
						<a class ="login" href="myPage.jsp">마이페이지</a>
						<a class ="login" href="logout.jsp">로그아웃</a>
					</c:otherwise>
					</c:choose>			
			</div>
		</section>
    </header>
    
    </br></br></br></br><div class ="text" >${search}(으)로 검색한 결과는 ${num}개 검색 되었습니다.</div></br></br>
  	<c:forEach var="release_date" begin="0" end="100" step="1" items="${searchdata}">
		<a href="content_main.jsp?id=${release_date.id}&type=${release_date.type}"><img class = "poster"src="https://image.tmdb.org/t/p/w300/${release_date.poster_path}">	       	
	</c:forEach>
</body>
</html>
<!-- <a href="content_main.jsp?id=${release_date.id}&type=${release_date.type}> -->