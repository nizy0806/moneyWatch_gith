<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<center><h3>세부수입내역</h3></center>
<br>
	<table class="table table-hover" style="width:80%; text-align:center;" align="center">
		 <tr class="table-primary"><th scope="row">카테고리</th><th scope="row">수입명</th><th scope="row">수입액</th></tr>
			<c:forEach var="inlist" items="${inlist}">
		<tr>
			<td>${inlist.io_category}</td><td>${inlist.io_detail}</td>
			<td><fmt:formatNumber value="${inlist.io_price}" pattern="#,###"/></td>
		</tr>
			</c:forEach>
	</table>
	