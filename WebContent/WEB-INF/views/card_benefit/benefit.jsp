<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

<br><br>
<table class="table table-hover" width="50%" >

<%--<img src="<c:url value="${cardImg}"/>"/> --%>
<img src="/moneyWatch/image/image_ibk/1.jpg"/>

<c:forEach var="cdto" items="${benefitList}">
	<tr class="table-light"><th scope="row">${cdto.all_benefit_name}</th>
	<td>${cdto.benefit_text_all}</td>
	</tr>
</c:forEach>
</table>
