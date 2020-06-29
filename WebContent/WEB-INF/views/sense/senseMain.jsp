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

<style>
.left-box {
  float: left;
}
.right-box {
  float: right;
}
</style>
</head>
<body>
	<h1 align="center">금융 SenseUp!!</h1> <!-- a태그넣기  -->
	<div>
		<div class="left-box">
			<h2 align="center" >오늘의 영상</h2>
			<div align="center" id="video_url">
				<iframe width="850" height="478" src="https://www.youtube.com/embed/${video.sense_url}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><br/>
			</div>
		</div>
		
			<!-- 카테고리 리스트 -->	
		<div class="right-box">
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
				<div id="mainList" style="overflow:auto; width:800px; height:500px;"> <!-- 기본 메인에서 리스트를 가져오고/ 카테고리 선택 시 ajax를 통해 리스트를 가져옴 -->
					<c:forEach items="${ list }" var="list">	
						<table>
							<!-- 첫 페이지일 경우 : category=null -->
							<tr>
							<!-- 썸네일이미지> --> 
								<td onclick="detail(${ list.num })"><img src="https://img.youtube.com/vi/${ list.sense_thumbnail }/default.jpg" alt="Page Not Found"/></td>
								<td onclick="detail(${ list.num })">${ list.sense_title }</td>
							</tr>
							<!-- ajax를 통해 디테일한 내용을 가져옴  -->
							<tr>
								<table id="detail${ list.num }">
								</table>
							</tr>
						</table>
					</c:forEach>	
				</div>
			</div>		
		</div>
	</div>
</body>
</html>