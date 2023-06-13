<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%
	double Latitude = Double.parseDouble(request.getParameter("Latitude"));
	double Longitude = Double.parseDouble(request.getParameter("Longitude"));
	
	String gu = "";
	String dong = "";
	String bus_name = "";
	String permit_date = "";
	String addr_new = "";
	String addr_old = "";
	String phone = "";
	
	

	
     Class.forName("org.mariadb.jdbc.Driver");
     try (
         Connection conn = DriverManager.getConnection(
                 "jdbc:mariadb://localhost:3306/movieverse17", "root", "1234");
			Statement stmt = conn.createStatement();
     
		 ResultSet rs = stmt.executeQuery("select * from animal2_20210624 WHERE Latitude="+Latitude+" and Longitude= "+Longitude+";");
     ) {
         if (rs.next()) {
			
			gu = rs.getString("gu");
        	 dong = rs.getString("dong");
        	 bus_name = rs.getString("bus_name");
        	 permit_date = rs.getString("permit_date");
			 addr_new = rs.getString("addr_new");
			 addr_old = rs.getString("addr_old");
        	 phone = rs.getString("phone");
			
			 
                 
         }
         
     } catch(Exception e) {
         e.printStackTrace();
     }
 %>

 
 <!DOCTYPE html>
 <html>
 <head>
     <meta charset="UTF-8">
     <style>
         table { width:680px; text-align:center; }
         th    { width:100px; background-color:silver; }
         td    { text-align:left; border:1px solid gray; }
     </style>
	
 </head>
 
 <body>
 
 
 <table>
	<tr>
         <th>구별</th>
         <td><%=gu%></td>
     </tr>
     <tr>
         <th>동별</th>
         <td><%=dong%></td>
     </tr>
     <tr>
         <th>사업장명</th>
         <td><%=bus_name%></td>
     </tr>
     <tr>
         <th>도로명주소</th>
         <td><%=addr_new%></td>
     </tr>
     <tr>
         <th>지번주소</th>
         <td><%=addr_old%></td>
     </tr>
     <tr>
         <th>전화번호</th>
         <td><%=phone%></td>
     </tr>
	 <tr>
         <th>인허가일자</th>
         <td><%=permit_date%></td>
     </tr>
     <tr>
         <th>위도</th>
         <td><%=Latitude%></td>
     </tr>
	   <tr>
         <th>경도</th>
         <td><%=Longitude%></td>
     </tr>
	
	      
 </table>
 <br>
 <div id="map" style="width:100%;height:350px;"></div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c1d13945c550396e55d8ed3d630efaf"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
				center: new kakao.maps.LatLng(<%=Latitude%>, <%=Longitude%>), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(<%=Latitude%>, <%=Longitude%>); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
</script>
 <br>
 <input type="button" value="목록보기" onclick="location.href='sewonfile.jsp'">


 </body>
 </html>
