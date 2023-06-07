<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "com.board.json.*" %>
<%@ page import= "com.board.db.*" %>
    <%
    
    int listSize = 5;
    String tmp = request.getParameter("page");
    int pageNo = (tmp != null && tmp.length() > 0) 
    ? Integer.parseInt(tmp) : 1;
    
    String tmpNum = request.getParameter("pageNum");
    int pageNoNum = (tmpNum != null && tmpNum.length() > 0) 
    ? Integer.parseInt(tmpNum) : 1;
  
    String userId ="";
    if((String)session.getAttribute("userId") != null){
      	userId = (String)session.getAttribute("userId");
		request.setAttribute("bookMark", new BoardDao().selectBookmark(userId, (pageNo-1)*listSize, listSize));
		request.setAttribute("pgnList",new BoardDao().getBookmarkPagination(pageNo, userId));
		
		request.setAttribute("userReview", new BoardDao().selectUserMoiveReview(userId, (pageNoNum-1)*listSize, listSize));
		request.setAttribute("pgnList1",new BoardDao().getUserMovieReviewPagination(pageNoNum, userId));

		
    }

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:forEach var= "hype" begin="0" end="5" step="1"  items="${userReview}">
                    
				    <a href="content_main.jsp?id=${hype.review_content_id}&type=${hype.type}"><img src="https://image.tmdb.org/t/p/w200/${hype.poster_path}"></a>
							<c:forEach  begin="0" end="${hype.review_star -1}" step="1" >
                   			   <span>★</span>
                   			</c:forEach>                       
                            <h2>${hype.review_time }</h2>
               ${hype.review_content}
               1
               ${pgnList}
                </c:forEach>
<div style="width:680px; text-align:center;">
    <c:forEach var="pgn" items="${pgnList}">
        <a href="#"
            ${pgn.curPage ? "style=\"text-decoration:underline;\"" : ""}
            >${pgn.display}</a>
    </c:forEach> 
</div>
	<c:forEach var="pgn" items="${pgnLisst}">
   	    <a class="pgn" href="#">
             <c:choose>
                <c:when test="${pgn.curPage}">
				<u>${pgn.display}</u>
              </c:when>
              <c:otherwise>
					  ${pgn.display}
               </c:otherwise>
               </c:choose>
          </a>&nbsp;
      </c:forEach>
 </body>
</html>