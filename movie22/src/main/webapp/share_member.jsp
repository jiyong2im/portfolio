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
    <link rel="stylesheet" href="css/share_member.css"/>
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
            <div class="choice"  >
                <div class="leader" OnClick="location.href ='http://movieverse17.cafe24.com/share_main.jsp'">
                    <h2>파티장</h2>
                </div>
                <div class="member" OnClick="location.href ='http://movieverse17.cafe24.com/share_member.jsp'">
                    <h2>파티원</h2>
                </div>
            </div>
            <div class="card">
                <img src="img/mastercard.png">
                <img src="img/visa.png">
                <img src="img/american.png">
                <img src="img/kb.png">
                <img src="img/union.png">
            </div>
            <div class="in">
                <form action="accountSharing.jsp">

                    <div class="number">
                        <h2>이용 약관</h2>
						<p>
							무비버스의 계정공유는 사용자들간의 파티매칭을 목적으로 합니다.<br>
							결제는 "마이페이지 > 포인트 충전"에서 당사에 결제하신 포인트로<br>
							진행되고 수수료를 제외한 정산된 포인트가 파티장에게 입금되며 <br>
							매달 13일에 정산이 됩니다. <br>
							 해당 계정공유는 각 사용자가 이미 만들어진 파티에 가입함으로 <br>
							이용서비스 가격에서 공유인원을 나눈 금액을 각 사용자가 지불 <br>
							하게 됩니다. <br>
							 본 서비스는 사용자간 매칭 서비스기 때문에 사용자들간의 분쟁이 <br>
							 발생 할수 있으며 무비버스는 최선을 다해 분쟁을 해결 하겠습니다.<br>
						</p>
                    </div>
                    
                     <div class="btn">
                        <input type="submit" value="시작하기">
                    </div>
                    
                    
                </form>

            </div>
        </div>

    </section>
    
</body>
</html>