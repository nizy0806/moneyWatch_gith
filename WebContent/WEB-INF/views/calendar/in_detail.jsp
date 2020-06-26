<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>세부수입내역</h1>
	<table>
		<tr><th>카테고리</th><th>수입명</th><th>수입액</th></tr>
			<c:forEach var="inlist" items="${inlist}">
		<tr>
			<td>${inlist.io_category}</td><td>${inlist.io_detail}</td>
			<td><fmt:formatNumber value="${inlist.io_price}" pattern="#,###"/></td>
		</tr>
			</c:forEach>
	</table>
	