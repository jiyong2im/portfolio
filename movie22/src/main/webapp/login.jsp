<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");

    Class.forName("org.mariadb.jdbc.Driver");
     try (
         Connection conn = DriverManager.getConnection(
               "jdbc:mariadb://localhost/movieverse17", "movieverse17", "shingu1718!");
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(String.format(
               "select * from member where member_id='%s' and member_pw='%s'", id, pw));
     ) {
      if (rs.next()){
        session.setAttribute("userId", rs.getString("member_id"));
        session.setAttribute("userName", rs.getString("member_name"));
		session.setAttribute("userNum", rs.getInt("member_num"));
		session.setAttribute("userNick", rs.getString("member_nick"));
 		session.setAttribute("userAddr", rs.getString("member_address"));
		session.setAttribute("userMoney", rs.getInt("member_money"));
 
		/*  여기 마이페이지 띄울거 세션유지하자.
      
        session.setAttribute("userName", rs.getString("member_name"));
        session.setAttribute("userName", rs.getString("member_name"));
 */
		response.sendRedirect("index.jsp");
      //out.print("<script>parent.location.reload();</script>");

        return;
      // 아래꺼 실행한하고 바로 넘어가게해줌 안그러면 아래꺼 다할라고함
         }

     } catch(Exception e) {
         e.printStackTrace();
     }

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
   alert('id 또는 pw가 틀립니다. ');
   history.back();
</script>

</body>
</html>
