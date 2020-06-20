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
	<table border="1">
		<div>
			<div>
				<tr>
					${ modify.sense_thumbnail }
					<input type="file">
				</tr>
			</div>
			<div>
				<tr>
					<td>번호</td>
					<td>${ modify.num }</td>
						<input type="hidden" id="num" name="num" value="${ modify.num }"/>
					<td colspan="2">
						<tr>
							메인
						</tr>
						<tr>
							<c:if test="${ modify.main_set == 0 }">
								<input type="radio" id="main_set" name="main_set" value="1"/>메인노출
								<input type="radio" id="main_set" name="main_set" value="0" checked/>메인안함
							</c:if>
							<c:if test="${ modify.main_set == 1 }">
								<input type="radio" id="main_set" name="main_set" value="1" checked/>메인노출
								<input type="radio" id="main_set" name="main_set" value="0" />메인안함
							</c:if>
						</tr>
					</td>
				</tr>
				<tr>
					<tr>
						<td>제목</td>
						<td><input type="text" id="sense_title" name="sense_title" placeholder="${ modify.sense_title }"/></td>
						<td>카테고리</td>
						<td><input type="text" id="sense_category" name="sense_category" placeholder="${ modify.sense_category }"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3"><input type="textbox" id="sense_content" name="sense_content" placeholder="${ modify.sense_content }"/></td>
					</tr>
				</tr>
				<tr>
					<td>URL</td>
					<td><input type="text" id="sense_url" name="sense_url" placeholder="${ modify.sense_url }"/></td>
					<td>날짜</td>
					<td>${ modify.reg_date }</td>
				</tr>
			</div>
			<div>
				<input type="submit" value="수정"/>
				<input type="button" value="취소" onclick="location.href='/moneyWatch/sense.mw'"/>
			</div>
		</div>
	</table>
</form>
</body>
</html>