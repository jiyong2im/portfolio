<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ page import= "com.board.db.*" %>
    
<%
//테이블은 2개 /멤버 테이블 개설된방 테이블(파티장소속)
// 두개의 테이블에서 파티장, 파티원 게이지와파티 갯수 이런 것들 가지고돈 계산해서 다신 찐 멤버테이블로 가서 돈 뺴준다. 
	BoardDao dao = new BoardDao();
	dao.adminSelect3();
	dao.adminSelect5();

	response.sendRedirect("adminPage_party.jsp");
	return;
%>