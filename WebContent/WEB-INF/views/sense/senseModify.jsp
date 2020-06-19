<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>senseModify page</title>
</head>
<body>
<form action="senseModifyPro.mw" method="post" enctype="multipart/form-data">
<table>
	<div>
		<tr>
			${ sense_thumbnail }
			<input type="file">
		</tr>
		<tr>
			<td>번호</td>
			<td>${ num }</td>
				<input type="hidden" id="num" name="num" value="${ num }"/>
			<td colspan="2">
				<tr>
					메인
				</tr>
				<tr>
					<c:if test="${ main_set == 0 }">
						<input type="radio" id="main_set" name="main_set" value="1"/>${ main_set }
						<input type="radio" id="main_set" name="main_set" value="0" checked/>${ main_set }
					</c:if>
					<c:if test="${ main_set == 1 }">
						<input type="radio" id="main_set" name="main_set" value="1" checked/>${ main_set }
						<input type="radio" id="main_set" name="main_set" value="0" />${ main_set }
					</c:if>
				</tr>
			</td>
		</tr>
		<tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="sense_title" name="sense_title" placeholder="${ sense_title }"/></td>
				<td>카테고리</td>
				<td><input type="text" id="sense_category" name="sense_category" placeholder="${ sense_category }"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><input type="text" id="sense_content" name="sense_content" placeholder="${ sense_content }"/></td>
			</tr>
		</tr>
		<tr>
			<td>URL</td>
			<td><input type="text" id="sense_url" name="sense_url" placeholder="${ sense_url }"/></td>
			<td>날짜</td>
			<td>${ reg_date }</td>
		</tr>
	</div>
	<div>
		<input type="submit" value="수정"/>
		<input type="button" value="취소" onclick="sense.mw"/>
	</div>
</table>
</form>
</body>
</html>