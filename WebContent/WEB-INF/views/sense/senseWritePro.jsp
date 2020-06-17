<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<title>senseWritePro</title>

<!-- 입력확인 -->
<c:choose>
	<!-- 입력에 성공했을 경우ㅡ  -->
	<c:when test="${ check == 1 }">
		<script>
			alert("정상적으로 입력되었습니다.");
			opener.parent.location.reload();
		</script>
	</c:when>
	
	<!-- 입력에 실패했을 경우 -->
	<c:when test="${ check == 0 }">
		<script>
			alert("입력에 실패하였습니다.");
			opener.parent.location.reload();
		</script>	
	</c:when>
</c:choose>
</head>
<body>

</body>
</html>