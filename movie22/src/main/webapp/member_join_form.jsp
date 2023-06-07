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
	<link rel="stylesheet" href="css/join_form.css"> 
    <title>movieverse 회원가입</title>
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
	

		<h1 style="color:white; font-size: 25px;">회원가입</h1>
		<form action="member_join.jsp" method="post">
			<div class="id"><input type="text" placeholder="ID"     name="id"></div><br>
			<div class="pw"><input type="password" placeholder="비밀번호" name="pw"></div>	<br>
			<div class="repw"><input type="password" placeholder="비밀번호 확인" name="repw"></div><br>
			<div class="name"><input type="text" placeholder="이름"     name="name"></div><br>
			<div class="nick"><input type="text" placeholder="닉네임"     name="nick"></div><br>
			<div class="address"><input type="text" placeholder="주소입력"     name="address"></div><br>
			<div class="sex">
					<input type="radio" name="sex" checked="checked" value="남성" /> 남성
					<input type="radio" name="sex" value="여성" /> 여성
			</div><br>
			
			<div class="login"><input type="submit" value="가입하기"></div><br>
			
		</form>
						<br>
						

			</div>	
			
		</article>
		
	
	
	
	
	<!--<script src="js/script.js"></script>-->
</body>
</html>