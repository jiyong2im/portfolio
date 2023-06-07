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
int shareParty_num= Integer.parseInt(request.getParameter("shareParty_num"));
String ott_name= request.getParameter("ott_name");

	String userId = ""; 
	String userName = ""; 
	int userNum = 0;
	
	//String ott_name = "";
	String shareParty_time = "";
	int shareParty_gauge = 0;
	int ott_price = 0;
	int header_num = 0;
	int send_gauge = 0;

	userId = (String)session.getAttribute("userId"); 
	userName = (String)session.getAttribute("userName"); 
	userNum = (Integer)session.getAttribute("userNum");
	
	
	

		
		
     Class.forName("org.mariadb.jdbc.Driver");
     try ( 
         Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("select * from shareParty where shareParty_num=" + shareParty_num);
     ) {
         if (rs.next()) {
			shareParty_num = rs.getInt("shareParty_num");
			
			
			shareParty_time = rs.getString("shareParty_time");
        	shareParty_gauge = rs.getInt("shareParty_gauge");
			ott_price = rs.getInt("ott_price");
			header_num = rs.getInt("header_num");
			 send_gauge= shareParty_gauge+1;
  
       
         }
         
     } catch(Exception e) {
         e.printStackTrace();
     }
		
%> 
    <header class="header">
        <section class="flex">
            <a href="#home" class="logo"><img src="img/logo2.png" alt=""></a>
            <nav class="navbar">
                <a href="#home">영화</a>
                <a href="#home">TV시리즈</a>
                <a href="#home">계정공유</a>
                <a href="#home">검색</a>
            </nav>
		</section>
    </header>
    
	<section class="main">
        <div class="layer">
            <div class="choice"  >

                <div class="member" OnClick="location.href =''">
                    <h2>OTT 가입하기</h2>
                </div>
                
            </div>
          
            <div class="in">
                <form action="join_party.jsp">


                    <div class="">
                        <h2>상세</h2><br>
						<p>가입 서비스: </p><input type="text" value="<%=ott_name%>" name="ott_name" readonly ><br>
						<!--<p>파티장: </p><input type="text" value="<%=header_num%>" name="header_num" readonly ><br>-->
                        <p>파티원 상태: </p><input type="number" value="<%=shareParty_gauge%>" name="shareParty_gauge" readonly ><br> 
						<p>가입할시 정원: </p><input type="number" value="<%=send_gauge%>"     name="send_gauge" readonly ><br>
						<p>파티 코드: </p><input type="number" value="<%=shareParty_num%>"     name="shareParty_num" readonly ><br>

                    </div>
	
                    
                     <div class="btn">
                        <input type="submit" value="가입하기">
                    </div>
                    
                    
                </form>

            </div>
        </div>

    </section>
    
</body>
</html>