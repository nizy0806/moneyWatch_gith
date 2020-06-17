<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==0}">
<script>
	alert("비밀번호가 일치하지 않습니다");
	history.go(-1);
</script>
</c:if>


<c:if test="${check==1}">
<script>
	alert("이용해주셔서 감사합니다");
	window.location="/moneyWatch/main.mw";
</script>
	
</c:if> 