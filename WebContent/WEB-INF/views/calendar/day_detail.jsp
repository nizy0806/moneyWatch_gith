<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<h1>일정</h1>
<c:forEach var="detail" items="${detail}">
	<table>
		<tr>
			<td>일정</td><td>${detail.title}</td>
		</tr>
		
		<tr>
			<td>메모</td><td>${datail.memo}</td>
		</tr>
		
		<tr>
			<td>장소</td><td>${detail.place}</td>
		</tr>
	
	</table>



</c:forEach>