<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import= "com.board.db.*" %>
<%
request.setCharacterEncoding("utf-8");
String userNum = session.getAttribute("userNum").toString();
String shareParty_num = request.getParameter("party");
int gauge = Integer.parseInt(request.getParameter("gauge"));
BoardDao dao = new BoardDao();
dao.deleteShare(userNum, shareParty_num);
dao.updateShare(shareParty_num, gauge);

response.sendRedirect("myPage_share.jsp");
return;
%>