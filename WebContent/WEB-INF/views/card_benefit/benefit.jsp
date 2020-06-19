<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<table>
<c:forEach var="cdto" items="${benefitList}">
	<tr><td>${cdto.all_benefit_name}</td></tr>
	<tr><td>${cdto.benefit_text_all}</td></tr>
</c:forEach>
</table>