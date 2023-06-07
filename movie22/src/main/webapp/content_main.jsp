<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%@ page import= "com.board.db.*" %>

<%
String id = request.getParameter("id");
String type = request.getParameter("type");

request.setAttribute("data", new JsonDAO().getClickItem(id, type)); 
request.setAttribute("dataCredits", new JsonDAO().getCredits(id, type)); 
request.setAttribute("dataCreditsCrew", new JsonDAO().getCreditsCrew(id, type)); 
request.setAttribute("id", id);
request.setAttribute("type", type);

String userId = (String)session.getAttribute("userId"); 
request.setAttribute("userId", userId);
String userNick = (String)session.getAttribute("userNick");
request.setAttribute("userNick", userNick);

int listSize = 5;
String tmp = request.getParameter("page");
int pageNo = (tmp != null && tmp.length() > 0) 
? Integer.parseInt(tmp) : 1;

if(type.equals("movie")){
	request.setAttribute("reviewList", new BoardDao().selectMovieReview(id, (pageNo-1)*listSize, listSize));
	request.setAttribute("pgnList",new BoardDao().getMoviePagination(pageNo, id));

}else{
	request.setAttribute("reviewList", new BoardDao().selectTvReview(id, (pageNo-1)*listSize, listSize));
	request.setAttribute("pgnList",new BoardDao().getTvPagination(pageNo, id));

}
//북마크관련해서... 세션읽고 사용자 db읽고 북마크 체크 됐었는지확인 요망 ... 

// 아이디값 타입값 pageNo값 가지고 db ㄲ 


%>

<c:set var="realnull" value=""/>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Swiper -->

<script type="text/javascript">
state = 0;
function changeImage() {
    if ( state == 0 ) {
        state = 1;
        var uid = '<%=(String)session.getAttribute("userId")%>';
        if(uid=="null"){
            alert("로그인이 필요합니다.");
        }else{
        document.getElementById('image').src = "img/bookmarkcheck.png";
        alert("북마크 등록");
        }
    }
    else {
        state = 0;
        var uid = '<%=(String)session.getAttribute("userId")%>';
        if(uid=="null"){
            alert("로그인이 필요합니다.");
        }else{
        document.getElementById('image').src = "img/bookmark.png";
        alert("북마크 등록 취소");
        }
    }
}

</script>

<link rel="stylesheet" type="text/css" href="css/content.css">
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

<div class ="backGradation"></div>

  <img class="backimg" src="https://image.tmdb.org/t/p/w400/${data.backdrop_path }"/>
  <div class="contentBox">
    <div class="movie_bookmark">
                <img class="content_poster" style="margin-left: 10px "  src="https://image.tmdb.org/t/p/w400/${data.poster_path }">
    <a class="content_bookmark" href="bookmark.jsp?id=${id}&type=${type}&poster_path=${data.poster_path}"> <img id="image" onclick="changeImage()" src="img/bookmark.png" /></a>


    </div>
				<div class ="infoBox">
					<div class ="name">
						<h2>${data.title}</h2>
					</div>
					<br>
					<br>
					<div class ="rating_star">
						<span>★</span>${data.vote_average}
					</div>
					<br>
					<div class ="date">
						<h4>개봉</h4>
						<p>${data.release_date}</p>
					</div>
					<br>
					<div class ="genre">
						<h4>장르</h4>
						<div style="display: flex;">
							<c:forEach var="release_date" begin="0" end="5" step="1" items="${data.genre}">
								<p style="  ">${release_date}&nbsp;&nbsp;</p>
							</c:forEach>
						</div>
					</div>
					<br>
					<div class ="Name">
						<h4>상영 OTT</h4>
						<p>
						<c:forEach var="release_date" begin="0" end="5" step="1" items="${data.logo_path}">
						<img class ="logo_size" src = "https://image.tmdb.org/t/p/w200/${release_date}">
						</c:forEach>
						</p>
					</div>
					<br>
					<div class ="info">
						<h4>개요</h4>
						<p>${data.overview}</p>
					</div>
					
				</div>
			
				<div class ="cast">
					<div class ="director">
						<h3>감독</h3>
						<div class ="img">
							<c:choose>
								<c:when test="${dataCreditsCrew.profile_path eq 'null'}">
									<img src="img/person_img.png">
								</c:when>
								<c:when test="${dataCreditsCrew.profile_path eq realnull}">
									<img src="img/person_img.png">
								</c:when>
								<c:otherwise>	
									<img src="https://image.tmdb.org/t/p/w200/${dataCreditsCrew.profile_path}">
								</c:otherwise>
							</c:choose>
						</div>
						<div class ="name">
							<p style="width:200px; margin:3px;" >${dataCreditsCrew.personName}</p>
						</div>
					</div>
					<div class ="actor">
						<h3>배우</h3>
	
						<c:forEach var="release_date" begin="0" end="3" step="1" items="${dataCredits}">
							<c:choose>
								<c:when test="${release_date.profile_path eq 'null' }">
									<img src="img/person_img.png">
								</c:when>
								<c:otherwise>	
									<img src="https://image.tmdb.org/t/p/w200/${ release_date.profile_path}">
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<div style="display: flex;">
							<c:forEach var="release_date" begin="0" end="3" step="1" items="${dataCredits}">
								<p style="width:200px; margin:3px; ">${release_date.personName }</p>
							</c:forEach>
						</div>
					</div>
				</div>			
			
				<div class = "myReview">
					<ul class="ul-text" >
						<li><b>평가하기</b></li>
						
							<form action = "insertReview.jsp?id=${id}&type=${type}&poster_path=${data.poster_path}" accept-charset="utf-8" class="mb-3" name="myform" id="myform" method ="post">
								<fieldset>
									<span class="text-bold">별점을 선택해주세요</span>
									<input type="radio" name="reviewStar" value="5" id="rate1"><label
										for="rate1">★</label>
									<input type="radio" name="reviewStar" value="4" id="rate2"><label
										for="rate2">★</label>
									<input type="radio" name="reviewStar" value="3" id="rate3"><label
										for="rate3">★</label>
									<input type="radio" name="reviewStar" value="2" id="rate4"><label
										for="rate4">★</label>
									<input type="radio" name="reviewStar" value="1" id="rate5"><label
										for="rate5">★</label>
								</fieldset>
								<div>
									<textarea name ="review" rows="10"  placeholder="리뷰를 작성해주세요!" ></textarea>
									<input type="submit" value="등록하기">
								</div>
							</form>
					</ul>
				</div>
<!-- 
엄청난 데이터 마다 리뷰를 생성해야 한다. 먼저테이블을 만들 수는 없다. 그렇다면 리뷰는 쓰는 곳에서만 테이블을 만들어 주면 된다. 
아이디 값으로 여지껏 리뷰가 있었는지 확인하고, 있다면 그 위에 업데이트 없다면 새로 생성 후 데이터 업데이트
무비인지 티비 인지도 확인 해야함. 
 -->				
<div class = "otherReviewBox">
         <table>

            <c:forEach var="release_date" begin="0" end="5" step="1" items="${reviewList}">
            <tr>
               <td>별점 : 
			<c:forEach  begin="0" end="${release_date.review_star -1}" step="1" >
                      <span>★</span>  </c:forEach> 
                  <br>
                  닉네임 : ${release_date.member_nick}
                  <br>
                  ${release_date.review_time}
               </td>
               <td>${release_date.review_content}</td>
            </tr>
            </c:forEach> 
   
         </table>
	<div style="width:680px; text-align:center;">
	<c:forEach var="pgn" items="${pgnList}">
   	    <a class="pgn" href="content_main.jsp?id=${id}&type=${type}&page=${pgn.pageNo}">
             <c:choose>
                <c:when test="${pgn.curPage}">
				<u>${pgn.display}</u>
              </c:when>
              <c:otherwise>
					  ${pgn.display}
               </c:otherwise>
               </c:choose>
          </a>&nbsp;
      </c:forEach>
  </div>
      
      </div>



</body>
</html>
