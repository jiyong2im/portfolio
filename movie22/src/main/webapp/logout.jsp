<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	session.removeAttribute("userId"); 
	session.removeAttribute("userName"); 
    session.removeAttribute("userId");
    session.removeAttribute("userName");
	session.removeAttribute("userNum");
	session.removeAttribute("userNick");
	
	response.sendRedirect("index.jsp");

%>
    
