<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/sense/sense.js"></script>
 
</head>
<body>
<!-- 센스 디테일 페이지 / 메인 리스트 클릭 시 작동-->
	<table>
		<tr>
			<td>${ detail.sense_content }</td>
		</tr>
		<tr>	
			<td>
				<input type="button" value="수정" class="btn btn-info" onclick="location.href='/moneyWatch/senseModify.mw?num=${detail.num}'"/>
			</td>	
			<td>
				<input type="button" value="삭제" class="btn btn-info" onclick="senseDelete(${detail.num})">      
			</td>
		</tr>
	</table>
</body>
</html>