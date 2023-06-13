<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import ="java.time.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%@ page import= "com.board.db.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
  String userId = "";
  String userName = "";
  int userNum = 0;
  String ott_id = request.getParameter("ott_id");
  String ott_pw = request.getParameter("ott_pw");
	String bank = request.getParameter("bank");
	String account = request.getParameter("account");
	String selectOption = request.getParameter("selectOption");
	int ottprice= 17000;

  userId = (String)session.getAttribute("userId");
  userName = (String)session.getAttribute("userName");
  userNum = (Integer)session.getAttribute("userNum");


	switch(selectOption){
		case "넷플릭스":
			ottprice=17000;
			break;
		case "웨이브":
			ottprice=13900;
			break;
		case "티빙":
			ottprice=13900;
			break;
		case "왓챠":
			ottprice=12900;
			break;
		case "디즈니플러스":
			ottprice=9900;
			break;
			
		default:
			ottprice= 17000;
			break;
	}


	if (bank != null && bank.length() > 0 &&
		account != null && account.length() > 0 &&
		selectOption != null && selectOption.length() > 0)  {



	 Class.forName("org.mariadb.jdbc.Driver");
	  try (
             Connection conn = DriverManager.getConnection(
                     "jdbc:mariadb://localhost:3306/movieverse17", "root", "1234");
                Statement stmt = conn.createStatement();
              ) {
                 String curTime = LocalDate.now() +  LocalTime.now().toString().substring(0,8);
                 stmt.executeQuery(String.format(
                 "insert into shareParty (header_num, ott_price, ott_name,shareParty_time, shareParty_gauge, shareHeader_bankName, shareHeader_accountNum, member_id, ott_id, ott_pw) values (%d, %d,'%s', '%s', 1,'%s', '%s','%s','%s','%s');",
                userNum, ottprice, selectOption, curTime, bank, account, userId,ott_id,ott_pw));
              } catch(Exception e){
                 e.printStackTrace();
              }

%>
<script>
	alert('등록이 완료되었습니다.');
	<!--response.sendRedirect("login_main.jsp"); -->
	location.href = "accountSharing.jsp";
</script>
<%
		}else {
%>
<script>
	alert('빈칸없이 입력하세요.');
	history.back();
</script>
<%
}

%>



</body>
</html>
