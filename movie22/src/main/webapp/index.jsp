<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%@ page import="java.sql.*" %>  
<%
request.setAttribute("msgList1", new JsonDAO().getMoviePasingData("","&with_genres=28"));
request.setAttribute("msgList2", new JsonDAO().getTvPasingData("", ""));
request.setAttribute("msgList3", new JsonDAO().getTvPasingData("&with_watch_providers=8", ""));
request.setAttribute("msgList4", new JsonDAO().getTvPasingData("&with_watch_providers=337", ""));
request.setAttribute("msgList5", new JsonDAO().getTvPasingData("&with_watch_providers=97", ""));
//with_genres=27
//&with_watch_providers="+aaa+"
//&with_watch_providers=337
//&with_genres=27
String userId = (String)session.getAttribute("userId");
request.setAttribute("userId", userId);
String userName = (String)session.getAttribute("userName");
int userNum = (Integer)session.getAttribute("userNum");
/* String userNick = (String)session.getAttribute("userNick");
request.setAttribute("userNick", userNick);
 */%>


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
            <img src="img/venom.png" alt="venom"/>
    		<iframe class ="iframe" width="550" height="400" src="https://www.youtube.com/embed/V6aWnlhH6ug" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


            <p class="iframetext">‘베놈’과 완벽한 파트너가 된 ‘에디 브록’(톰 하디) 앞에 ‘클리터스 캐서디’<br>
            (우디 해럴슨)가 ‘카니지’로 등장, 앞으로 닥칠 대혼돈의 세상을 예고한다.<br>
             대혼돈의 시대가 시작되고, 악을 악으로 처단할 것인가?</p>

            <img class =iframeimg src = "img/netflix_sss.png">
            <img class =iframeimg2 src = "img/watcha_sss.png">

			</div>

     </section>


      <section class="main">
			<h3>계정공유</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				    <!-- 여기 게시판 글 최신순 20개 불러와서 띄워야함 -->

<%
String ott_name = "";
String tmp = request.getParameter("bid");
String bid = (tmp != null && tmp.length() > 0) ? tmp : "";
					int a = 0;
								Class.forName("org.mariadb.jdbc.Driver");
						try( 
						Connection conn = DriverManager.getConnection(
				                "jdbc:mariadb://localhost:3306/movieverse17", "root", "1234");
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery(String.format("select * from shareParty%s where shareParty_gauge<4  order by shareParty_num desc ",bid));
						) {
						while (rs.next()) {  
							a++;
						switch(rs.getString("ott_name")){
							case "넷플릭스":
								ott_name = "netflix";
								break;
							case "왓챠":
								ott_name = "watcha";
								break;
							case "디즈니플러스":
								ott_name = "disnep";
								break;
							case "웨이브":
								ott_name = "wavve_box";
								break;
							case "티빙":
								ott_name = "share_tving";
								break;
						}
 %> 
				        <a href="share_party.jsp?shareParty_num=<%=rs.getInt("shareParty_num")%>&ott_name=<%=rs.getString("ott_name")%>"><div class="swiper-slide"><img src ="img/<%=ott_name%>.png" /><div class ="number"><p class ="number1"><%=rs.getInt("shareParty_gauge")%></p><p class ="number2">/4</p></div></a>
						</div>
<%
						}
						
     } catch(Exception e) {
         e.printStackTrace();
     }
 %>	
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
		</section>
    <div class="down">
        <section class="main">
			<h3>액션영화</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList1}">
				        <a href="content_main.jsp?id=${release_date.id}&type=movie"><div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.title}</h2></a>
				        </div>
            			</c:forEach>
				    </div>

				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
				    </section>

         <section class="main">
			<h3>TV 시리즈</h3>
				<div class="swiper-container">
				    <div class="swiper-wrapper">
				       	<c:forEach var="release_date" begin="0" end="23" step="1" items="${msgList2}">
				        <a href="content_main.jsp?id=${release_date.id}&type=tv"><div class="swiper-slide"><img class ="poster" src="https://image.tmdb.org/t/p/w300/${release_date.poster_path }"><h2>${release_date.tvName}</h2></a>
				        </div>
            			</c:forEach>
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				</div>
				    </section>

		<section class="main">
			<h3>NETFLIX</h3>
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
			<h3>DISNEY+</h3>
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
			<h3>WATCHA</h3>
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
	</div>

</body>
</html>
