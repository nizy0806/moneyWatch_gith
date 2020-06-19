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
<!-- 센스 디테일 페이지 / 메인 리스트 클릭 시 작동-->
	<table align="center">
		<tr>
			<td align="center">${ sense_content }내용</td>
		</tr>
		<tr>	
			<td width="100" align="center">
				<button onClick="senseModify(${sense_num})">수정${sense_num}</button>
			</td>	
			<td width="100" align="center">
				<button onClick="senseDelete(${sense_num})">삭제${sense_num}</button>
			</td>
		</tr>

	</table>
</body>
</html>