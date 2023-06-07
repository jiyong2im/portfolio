 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%@ page import="java.sql.*" %>  

<%

String userIdd = (String)session.getAttribute("userId");
if(userIdd == null){
	response.sendRedirect("error2.jsp");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/share_party.css"/>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");
String userId = ""; 
	String userName = ""; 
	int userNum = 0;

  String user_nick = request.getParameter("user_nick");
  userId = (String)session.getAttribute("userId");
  userName = (String)session.getAttribute("userName");
  userNum = (Integer)session.getAttribute("userNum");
	int member_num = 0;
	int member_money = 0;
	

		
		
     Class.forName("org.mariadb.jdbc.Driver");
     try ( 
         Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("select * from member where member_num=" + userNum);
     ) {
         if (rs.next()) {
			member_num = rs.getInt("member_num");
			member_money = rs.getInt("member_money");

       
         }
         
     } catch(Exception e) {
         e.printStackTrace();
     }
		
%> 
    <header class="header">
        <section class="flex">
            <a href="index.jsp" class="logo"><img src="img/logo2.png" alt=""></a>
            <nav class="navbar">
                
            </nav>
		</section>
    </header>
    
	<section class="main">
        <div class="layer">
            <div class="choice"  >

                <div class="member" OnClick="location.href =''">
                    <h2>포인트 충전</h2>
                </div>
                
            </div>
          
            <div class="in">
                <form action="update_money.jsp">


                    <div class="">
			
                        <p>보유잔액 : </p><input type="number"  name="user_money" value="<%=member_money%>" readonly><br> 
						<h2>충전금액</h2>
                        <select name="charge_money">
							<option value="오천원">5,000 원</option>
							<option value="만원">10,000 원</option>
							
						</select>
						<input type="hidden" value="<%=member_num%>"     name="member_num" readonly ><br>
						

                    </div>
	
                    
                     <div class="btn">
                        <input type="submit" value="충전하기">
                    </div>
                    
                    
                </form>

            </div>
        </div>

    </section>
    
</body>
</html>