<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/sense/sense.js"></script>
</head>
<body>
	<!-- sense 메인 페이지에서 카테고리 선택시 ajax로 list를 불러옴  -->
			<c:forEach items="${ list }" var="list">
			<table align="center">
				<tr>
					<td align="center"><img src="" alt="Page Not Found" width="100" height="110" name="default_image"/></td>
					<td align="center">${ list.sense_thumbnail }</td> <!-- 썸네일이미지> --> 
					<td align="center" onclick="detail(${ list.num })">${ list.sense_title }</td>
				</tr>
				
				<!-- ajax를 통해 디테일한 내용을 가져옴  -->
				<tr>
					<table align="center" id="detail${list.num }">
					</table>
				</tr>
			</table>
			</c:forEach>		
</body>
</html>