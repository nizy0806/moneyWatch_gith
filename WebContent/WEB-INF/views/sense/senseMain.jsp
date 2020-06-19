<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/sense/sense.js"></script>


<title>금융 SenseUp Page</title>
</head>
<body>
	<h1 align="center">금융 SenseUp!!</h1> <!-- a태그넣기  -->
	<!-- 카테고리 리스트 -->	
	<div>
		<table border="1" align="center">
			<c:forEach var="tr" begin="1" end="2" step="1">
				<tr>
					<c:forEach var="category" items="${ category }">
						<c:forEach var="td" begin="1" end="8" step="1">
							<c:if test="${ tr==1 && category.num == td && td < 5 }">
								<td align = center onclick="category(${ category.num })">
									${ category.sense_detail_category }
								</td>
							</c:if>
							<c:if test="${ tr==2 && category.num == td && td >= 5}">
								<td align = center onclick="category(${ category.num })">
									${ category.sense_detail_category }
								</td>
							</c:if>
						</c:forEach>									
					</c:forEach>
				</tr>
			</c:forEach>			
		</table>
	</div>
	<div>
		<h2 align="center">오늘의 영상</h2>
		<div align="center">
			<iframe width="850" height="478" src="https://www.youtube.com/embed/KgXtSx8ublA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><br/>
			<b id="video_url" >${ video.sense_url }${ sense_url }</b>
		</div>
		
		<h2 align="center">SenseUp List</h2>
		
		<div id="mainList">
			<c:forEach items="${ list }" var="list">			
			<table align="center">
				<!-- 첫 페이지일 경우 : category=null -->
				<tr>
					<td align="center"><img src="" alt="Page Not Found" width="100" height="110" name="default_image"/></td>
					<td align="center">${ list.sense_thumbnail }</td> <!-- 썸네일이미지> --> 
					<td align="center" onclick="detail(${ list.num })">${ list.sense_title }</td>
				</tr>
			
				<!-- ajax를 통해 디테일한 내용을 가져옴  -->
				<tr>
					<table align="center" id="detail${ list.num }">
					</table>
				</tr>
			</table>
			</c:forEach>	
		</div>
	</div>
	

</body>
</html>