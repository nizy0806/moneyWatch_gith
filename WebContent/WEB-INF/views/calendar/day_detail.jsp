<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<h1>세부일정</h1>
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
		<tr>
			<input type="button" value="일정삭제" onclick="window.location='day_delete.mw?title=${detail.title}&start_time=${detail.start_time}'">
			
		</tr>
	</table>
