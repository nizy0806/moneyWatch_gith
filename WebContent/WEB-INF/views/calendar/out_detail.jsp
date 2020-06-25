<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<h1>세부지출내역</h1>

<table>
	<tr><th>카테고리</th><th>지출명</th><th>지출액</th></tr>
<c:forEach var="outlist" items="${outlist}">
	<tr>
		<td>${outlist.io_category}</td><td>${outlist.io_detail}</td>
		<td><fmt:formatNumber value="${outlist.io_price}" pattern="#,###"/></td>
	</tr>
</c:forEach>
</table>