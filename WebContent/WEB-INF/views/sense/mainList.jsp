<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<!-- sense 메인 페이지에서 카테고리 선택시 ajax로 list를 불러옴  -->
			<table>
				<c:forEach items="${ list }" var="list">
					<tr>
						<td><img src="" alt="Page Not Found" width="100" height="110" name="default_image"/></td>
	<%-- 					<td>${ list.sense_thumbnail }</td> <!-- 썸네일이미지> --> --%>
						<td>
							<a href="" value="${ list.sense_url }">${ list.sense_title }</a> <!-- 타이틀 -->
						</td>
	<%-- 					<td>${ list.sense_content }</td> <!-- 내용 --> --%>
					</tr>
				</c:forEach>
			</table>
</body>
</html>