<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--<link rel="stylesheet" href="css/style.css"/>-->
	<link rel="stylesheet" href="css/login.css">
    <title>movieverse login</title>
</head>
<body>
     <header class="header">
        <section class="flex">
            <a href="index.jsp" class="logo"><img src="img/logo2.png" alt=""></a>
            <nav class="navbar">
                <a href="movie_main.jsp">영화</a>
                <a href="tv_main.jsp">TV시리즈</a>
                <a href="accountSharing.jsp">계정공유</a>
            </nav>
            <div class="navbarRight">
					<form action="SearchData.jsp" method ="get" style="display: flex;">
						<input id="searchInput" type="text" placeholder="드라마/시리즈, 영화 제목 검색해주세요" name="search" size="35" required="required" />
						<input class="serch_Img" name="button" type="image" src="img/searchBtn.png" />
					</form>



			</div>
		</section>
    </header>



		<article class="container">
			<div class = "oh">

	<%

		String userId = (String)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
    int userNum = (Integer)session.getAttribute("userNum");
    

		if(userId == null){

	%>
		<h1 style="color:white; font-size: 25px;">로그인</h1>
		<form action="login.jsp" method="post">
			<div class="id"><input type="text" placeholder="ID"     name="id"></div>
			<div class="pw"><input type="password" placeholder="Password" name="pw"></div>
			<div class="login"><input type="submit" value="로그인"></div>
			<div class="join">
				<a class= "sex"href="member_join_form.jsp">회원가입</a>
			</div>
			<!-- <div class="join"><input type="button" value="회원 가입"
				onclick="window.open('member_join_form.jsp', 'popup', 'width=500, height=200')"> </div> -->
		</form>
						<br>

	<%
		}else{ //로그인된상태
	%>
		<form action="logout.jsp" method="post">
			<%=userId%>님 로그인
			<input type="submit" value="로그아웃">

		<!-- <input type="button" value="회원정보 수정"
			onclick="window.open('member_update_form.jsp', 'popup', 'width=500, height=200')"> -->
		</form>
	<%
		}
	%>
			</div>

		</article>





	<!--<script src="js/script.js"></script>-->
</body>
</html>
