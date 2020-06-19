<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<title>senseModifyPro</title>

<!-- 입력확인 -->
<c:choose>
	<!-- 입력에 성공했을 경우ㅡ  -->
	<c:when test="${ check == 1 }">
		<script>
			alert("정상적으로 수정되었습니다.");
			location.href("sense.mw");	
		</script>
	</c:when>
	
	<!-- 입력에 실패했을 경우 -->
	<c:when test="${ check == 0 }">
		<script>
			alert("입력에 실패하였습니다.");
			history.go(-1);
		</script>	
	</c:when>
</c:choose>
</head>
<body>

</body>
</html>