<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%@ page import= "com.board.db.*" %>
    <%
    String userNum = session.getAttribute("userNum").toString();

    BoardDao dd = new BoardDao();
    if(dd.selectMyOttCheck(userNum)!=null){
        request.setAttribute("myOtt", dd.selectMyOtt(dd.selectMyOttCheck(userNum)));
        request.setAttribute("myOttLeader", dd.selectMyOttLeader(userNum));

    }
   	
    String userId = (String)session.getAttribute("userId");
    request.setAttribute("userId", userId);    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/myPage_share.css"/>
<title>MOVIEVERSE</title>
</head>
<body>
      <header class="header">
        <section class="flex">
            <a href="index.jsp" class="logo"><img src="img/logo2.png" alt=""></a>
            <nav class="navbar">
                <a href="movie_main.jsp">영화</a>
                <a href="tv_main.jsp">TV시리즈</a>
                <a href="error5.jsp">계정공유</a>

            </nav>
            <div class="navbarRight">
					<form action="SearchData.jsp" method ="get" style="display: flex;">
						<input id="searchInput" type="text" placeholder="드라마/시리즈, 영화 제목 검색해주세요" name="search" size="35" required="required" />
						<input class="serch_Img" name="button" type="image" src="img/searchBtn.png" />
					</form>

  					<c:choose>
					<c:when test="${userId eq null}">
						<a class="login" href="login_main.jsp">로그인</a>
					</c:when>
					<c:when test="${userId eq 'Admin'}">
						<a class="login" href="adminPage.jsp">관리자페이지</a>
						<a class ="login" href="logout.jsp">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a class ="login" href="myPage.jsp">마이페이지</a>
						<a class ="login" href="logout.jsp">로그아웃</a>
					</c:otherwise>
					</c:choose>

			</div>
		</section>
    </header>
    <div class="main">
        <div class="left">
            <div class="photo">
<!--                 <img src="img/act.png">
 -->            </div>
            <div class="page">
                <a href="myPage.jsp">내 프로필</a>
                <a href="myPage_myact_movie.jsp">내 활동</a>
                <a href="myPage_share.jsp">계정 공유</a>
            </div>
        </div>
        <div class="right">
            <div class="id">
                <p>계정 공유</p>				       
                <c:forEach var="hype" items="${myOttLeader}">
                
                <div class="content">
                    <div class="pos">
                        <img src="img/mynet.png" alt="">
                    </div>
                    <div class="state">
                       	<h2>파티역활</h2>
                        <h2>플랫폼</h2>
						<h2>파티원 상태</h2>
                        <h2>파티 아이디</h2>
						<h2>파티 비밀번호</h2>
                        <h2>월 사용료</h2>
                    </div>
                    <div class="col">
                        <h2>:</h2>
                        <h2>:</h2>
                        <h2>:</h2>
                                                <h2>:</h2>
                                                <h2>:</h2>
                                                <h2>:</h2>
                        
                    </div>
                    
                    <div class="anw">
						<h2>파티장</h2>
                        <h2>${hype.ott_name}</h2>
                        <h2>${hype.shareParty_gauge} 명  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="delete_share_leader.jsp?party=${hype.shareParty_num}">X</a></h2>
                        <h2>${hype.ott_id}</h2>
                        <h2>${hype.ott_pw}</h2>
                        <h2>${hype.ott_price} 원</h2>
                    </div>
                </div>
                </c:forEach>				       
                <c:forEach var="hype" items="${myOtt}">
                
                <div class="content">
                    <div class="pos">
                        <img src="img/mynet.png" alt="">
                    </div>
                    <div class="state">
                      	<h2>파티역활</h2>
                        <h2>플랫폼</h2>
                        <h2>파티원 상태</h2>
						<h2>파티 아이디</h2>
						<h2>파티 비밀번호</h2>
                        <h2>월 사용료</h2>
                    </div>
                    <div class="col">
                        <h2>:</h2>
                        <h2>:</h2>
                        <h2>:</h2>
                                                <h2>:</h2>
                                                <h2>:</h2>
                                                <h2>:</h2>
                    </div>
                    
                    <div class="anw">
                    	<h2>파티원</h2>
                        <h2>${hype.ott_name}</h2>
                        <h2>${hype.shareParty_gauge} 명   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="delete_share.jsp?party=${hype.shareParty_num}&gauge=${hype.shareParty_gauge}">X</a></h2>
						<h2>${hype.ott_id}</h2>
                        <h2>${hype.ott_pw}</h2>
                        <h2>${hype.ott_price} 원</h2>
                    </div>
                </div>
                </c:forEach>
            </div>

        </div>
    </div>
</body>
</html>