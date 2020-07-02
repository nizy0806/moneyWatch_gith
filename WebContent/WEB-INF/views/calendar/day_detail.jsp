<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<center><h3>세부일정</h3></center>
<br>
	<table style="width:80%; text-align:center;" align="center">
		<tr>
			<td>일정</td><td>${detail.title}</td>
		</tr>
		
		<tr>
			<td>메모</td><td>${detail.memo}</td>
		</tr>
		
		<tr>
			<td>장소</td><td>${detail.place}</td>
		</tr>

	</table>
	<br>
<center><button type="button" class="btn btn-outline-primary" onclick="window.location='day_delete.mw?title=${detail.title}&start_time=${detail.start_time}'">일정삭제</button></center>