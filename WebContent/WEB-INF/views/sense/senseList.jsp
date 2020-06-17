<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금융 SenseUp Page</title>
</head>
<body>
	<div>
		<h1>금융 SenseUp!!</h1> <!-- a태그넣기  -->
		
		<form action="category_select.mw" method="post">
		<table>
			<tr>
				<td><input type="button" id="category" name="category" value="이자"/></td>
				<td><input type="button" id="category" name="category" value="환율"/></td>
				<td><input type="button" id="category" name="category" value="채권"/></td>
				<td><input type="button" id="category" name="category" value="펀드"/></td>
			</tr>
			<tr>
				<td><input type="button" id="category" name="category" value="금융상품"/></td>
				<td><input type="button" id="category" name="category" value="자산배분"/></td>
				<td><input type="button" id="category" name="category" value="부동산"/></td>
				<td><input type="button" id="category" name="category" value="재테크"/></td>
			</tr>
		</table>
		</form>		

	</div>
	<div>
		<div>
			<h2>오늘의 영상</h2>
				<video></video>
		</div>
		<div>
			<h2>SenseUp List</h2>
			<table>
				<c:forEach items="${ select_list }" var="list">
				<tr>
					<td><img src="" alt="Page Not Found" width="100" height="110" name="default_image"/></td>
<%-- 					<td>${ list.sense_thumbnail }</td> <!-- 썸네일이미지> --> --%>
					<td>
						<a href="${ list.sense_url }">${ list.sense_title }</a> <!-- 타이틀 -->
					</td>
<%-- 					<td>${ list.sense_content }</td> <!-- 내용 --> --%>
				</tr>
				</c:forEach>
			</table>
	
		</div>
	
	
	</div>
	

</body>
</html>