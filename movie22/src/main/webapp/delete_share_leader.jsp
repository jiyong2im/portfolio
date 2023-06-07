<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import= "com.board.db.*" %>
<%
request.setCharacterEncoding("utf-8");
String userNum = session.getAttribute("userNum").toString();
String shareParty_num = request.getParameter("party");
BoardDao dao = new BoardDao();
dao.deleteShareLeader(shareParty_num);
response.sendRedirect("myPage_share.jsp");
return;
%>