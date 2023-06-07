<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%@ page import="java.sql.*" %>  
    
	<%
    String userId = (String)session.getAttribute("userId"); 
    String userName = (String)session.getAttribute("userName");
    String userNick = (String)session.getAttribute("userNick");
    String userAddr = (String)session.getAttribute("userAddr");
    int userNum = (Integer)session.getAttribute("userNum");
    request.setAttribute("userId", userId);
    request.setAttribute("userName", userName);
    request.setAttribute("userNick", userNick);
    request.setAttribute("userAddr", userAddr);
    request.setAttribute("userNum", userNum);


  String member_id ="";
	String member_nick ="";
	String member_name ="";
	String member_pw ="";
	String member_sex ="";
	String member_address ="";
	int member_money =0;
     Class.forName("org.mariadb.jdbc.Driver");
     try ( 
         Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("select * from member where member_num=" + userNum);
     ) {
         if (rs.next()) {
			member_id = rs.getString("member_id");
			member_nick = rs.getString("member_nick");
        	member_name = rs.getString("member_name");
			member_pw = rs.getString("member_pw");
			member_address = rs.getString("member_address");
			member_money = rs.getInt("member_money");
			

         }
         
     } catch(Exception e) {
         e.printStackTrace();
     }
		
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/myPage.css"/>
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
                <p>계정</p>
                <div class="content">
                    <div class="nick">
                        <h2><%=member_nick%></h2>
                        <h2><%=member_id%></h2>
                        <h2>********</h2>
                        <h2><%=member_address%></h2>

                    </div>
                    <div class="change">
                        <a class="top-menu" href="popup_nick.jsp" >닉네임 변경</a>
                        <a class="top-menu" href="popup_id.jsp">아이디 변경</a>
                            <a class="top-menu" href="popup_pw.jsp">비밀번호 변경</a>
                            <a class="top-menu" href="popup_addr.jsp">주소 변경</a>
                    </div>                   
                </div>
                <p>포인트</p>
                <div class="point">
                    <div class="mypoint">                       
                       <h2>내 포인트 : <%=member_money%></h2>                        
                    </div>
                    <div class="charge">
                        <a href="popup_money.jsp">충전하기</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>