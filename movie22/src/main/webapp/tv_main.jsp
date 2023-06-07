<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%
request.setAttribute("msgList1", new JsonDAO().getTvPasingData("","&with_genres=10759"));
request.setAttribute("msgList3", new JsonDAO().getTvPasingData("","&with_genres=16"));
request.setAttribute("msgList4", new JsonDAO().getTvPasingData("","&with_genres=35"));
request.setAttribute("msgList5", new JsonDAO().getTvPasingData("","&with_genres=80"));
request.setAttribute("msgList6", new JsonDAO().getTvPasingData("","&with_genres=99"));
request.setAttribute("msgList7", new JsonDAO().getTvPasingData("","&with_genres=18"));
request.setAttribute("msgList8", new JsonDAO().getTvPasingData("","&with_genres=10765"));
request.setAttribute("msgList9", new JsonDAO().getTvPasingData("","&with_genres=36"));
request.setAttribute("msgList10", new JsonDAO().getTvPasingData("","&with_genres=10762"));

String userId = (String)session.getAttribute("userId");
request.setAttribute("userId", userId);

String userNick = (String)session.getAttribute("userNick");
request.setAttribute("userNick", userNick);

//with_genres=27
//&with_watch_providers="+aaa+"
//&with_watch_providers=337
//&with_genres=27
%>


<!DOCTYPE html>
<html lang="en">
<head>
<!-- Swiper -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {

    var mySwiper = new Swiper('.swiper-container', {
        slidesPerView: 6,
        slidesPerGroup: 6,
        observer: true,
        observeParents: true,
        spaceBetween: 24,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        breakpoints: {
            1280: {
                slidesPerView: 6,
                slidesPerGroup: 6,
            },
            720: {
                slidesPerView: 1,
                slidesPerGroup: 1,
            }
        }
    });

});
</script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css"/>
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


    <section class="home">
        <div class="banner">
            <img src="img/walkingdead.png" alt="walkingdead"/>
    		<iframe class ="iframe" width="550" height="400" src="https://www.youtube.com/embed/xHvgi1om0tA" title="YouTube video player"
 frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		
      		
            <p class="iframetext">‘베놈’과 완벽한 파트너가 된 ‘에디 브록’(톰 하디) 앞에 ‘클리터스 캐서디’<br>
            (우디 해럴슨)가 ‘카니지’로 등장, 앞으로 닥칠 대혼돈의 세상을 예고한다.<br>
             대혼돈의 시대가 시작되고, 악을 악으로 처단할 것인가?</p>
    		
            <img class =iframeimg src = "img/netflix_sss.png">
            <img class =iframeimg2 src = "img/watcha_sss.png">
            
			</div>
             
     </section>
     
    <div class="down">
        <section class="main">
			<h3>액션&어드밴처</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList1}">
				        <a href="content_main.jsp?id=${release_date.id}&type=tv"><div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.tvName}</h2></a>
				        </div>
            			</c:forEach>
				    </div>

				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
				    </section>

		<section class="main">
			<h3>애니메이션</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList3}">
				        <a href="content_main.jsp?id=${release_date.id}&type=tv"> <div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.tvName}</h2></a>
				        </div>
            			</c:forEach>
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
				    </section>
				    		<section class="main">
			<h3>코미디</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList4}">
				        <a href="content_main.jsp?id=${release_date.id}&type=tv"> <div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.tvName}</h2></a>
				        </div>
            			</c:forEach>
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
				    </section>

		<section class="main">
			<h3>범죄</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList5}">
				        <a href="content_main.jsp?id=${release_date.id}&type=tv"><div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.tvName}</h2></a>
				        </div>
            			</c:forEach>
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
		</section>
		<section class="main">
			<h3>다큐멘터리</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList6}">
				        <a href="content_main.jsp?id=${release_date.id}&type=tv"><div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.tvName}</h2></a>
				        </div>
            			</c:forEach>
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
		</section>
		<section class="main">
			<h3>드라마</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList7}">
				        <a href="content_main.jsp?id=${release_date.id}&type=tv"><div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.tvName}</h2></a>
				        </div>
            			</c:forEach>
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
		</section>
		<section class="main">
			<h3>공상과학&판타지</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList8}">
				        <a href="content_main.jsp?id=${release_date.id}&type=tv"><div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.tvName}</h2></a>
				        </div>
            			</c:forEach>
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
		</section>
		<section class="main">
			<h3>역사</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList9}">
				        <a href="content_main.jsp?id=${release_date.id}&type=tv"><div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.tvName}</h2></a>
				        </div>
            			</c:forEach>
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
		</section>
		<section class="main">
			<h3>키즈</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList10}">
				        <a href="content_main.jsp?id=${release_date.id}&type=tv"><div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.tvName}</h2></a>
				        </div>
            			</c:forEach>
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
		</section>
	</div>

</body>
</html>