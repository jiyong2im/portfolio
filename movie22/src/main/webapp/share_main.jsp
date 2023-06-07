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
    <title>Document</title>
    <link rel="stylesheet" href="css/share_main.css"/>
</head>
<body>
    <header class="header">
        <section class="flex">
            <a href="index.jsp" class="logo"><img src="img/logo2.png" alt=""></a>
            <nav class="navbar">
                 <a href="movie_main.jsp">영화</a>
                <a href="tv_main.jsp">TV시리즈</a>
                <a href="share_main.jsp">계정공유</a>
            </nav>
		</section>
    </header>

    <section class="main">
        <div class="layer">
            <div class="choice">
                <div class="leader" OnClick="location.href ='http://movieverse17.cafe24.com/share_main.jsp'">
                    <h2>파티장</h2>
                </div>
                <div class="member" OnClick="location.href ='http://movieverse17.cafe24.com/share_member.jsp'">
                    <h2>파티원</h2>
                </div>
            </div>
            <div class="card">
                <img src="img/tving2.png">
                <img src="img/watcha2.png">
                <img src="img/wavve2.png">
                <img src="img/netflix2.png">
                <img src="img/disney2.png">
            </div>
            <div class="in">
                <form action="party_make.jsp" method="post">
                    <div class="bank">
                        <h2>은행</h2>
                        <select name="bank">
							<option value="국민">국민</option>
							<option value="카카오뱅크">카카오뱅크</option>
							<option value="농협">농협</option>
							<option value="신한">신한</option>
							<option value="씨티">씨티</option>
							<option value="sc제일">sc제일</option>
							<option value="우리">우리</option>
							<option value="IBK기업">IBK기업</option>
							<option value="케이뱅크">케이뱅크</option>
							<option value="토스뱅크">토스뱅크</option>
							<option value="하나">하나</option>
							<option value="경남">경남</option>
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="부산">부산</option>
							<option value="산업">산업</option>
							<option value="수협">수협</option>
							<option value="우체국">우체국</option>
							<option value="전북">전북</option>
							<option value="제주">제주</option>
							<option value="새마을금고">새마을금고</option>
							<option value="신협">신협</option>
							<option value="SBI저축">SBI저축</option>
							<option value="저축">저축</option>
						</select>
                    </div>
					<div class="">
                        <h2>OTT 아이디</h2>
                        <input type="text" name="ott_id">
                    </div>
					<div class="">
                        <h2>OTT 비밀번호</h2>
                        <input type="text" name="ott_pw">
                    </div>
                   <div class="accountNum">
                        <h2>계좌 번호</h2>
                        <input type="text" name="account">
                    </div>
                     <div class="ottOption">
                        <h2>OTT 옵션</h2>
                        <select name="selectOption">
							<option value="넷플릭스">넷플릭스</option>

							<option value="웨이브">웨이브</option>

							<option value="티빙">티빙</option>

							<option value="왓챠">왓챠</option>
							<option value="디즈니플러스">디즈니플러스</option>
						</select>
                    </div>

                    <div class="btn">
                        <input type="submit" value="파티 만들기">
                    </div>

                </form>

            </div>
        </div>

    </section>

</body>
</html>
