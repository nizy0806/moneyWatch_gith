<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>${card_name}혜택</h1>

<c:forEach var="cdto" items="${myBenefit}">
	<table>
		<tr><td>${cdto.all_benefit_name}</td></tr>
		<tr><td>${cdto.benefit_text_all}</td></tr>
</c:forEach>
	<tr><td><input type="button" value="목록으로" onclick="window.location='/moneyWatch/myCard.mw'"></td></tr>
	</table>
