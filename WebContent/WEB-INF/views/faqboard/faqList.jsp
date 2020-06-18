<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>F&A 게시판</title>
</head>

<body>
<center><b>글목록(전체 글:${count})</b>
<table width="700">
<tr>
	<td align="right">
	<c:if test="${sessionScope.memId != null}"></td>
	<td align="right" >
	<a href="/moneyWatch/myList.mw">내가쓴글</a>
	<a href="/moneyWatch/faqWriteForm.mw">글쓰기</a>
	<a href="/moneyWatch/logout.mw">로그아웃</a>
	</c:if>
	
	<c:if test="${sessionScope.memId == null}">
	<a href="/moneyWatch/loginForm.mw">로그인</a>
	</c:if>
	</td>
</tr>
</table>

<c:if test="${count==0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td align="center">
	게시판에 저장된 글이 없습니다.
	</td>
</table>
</c:if>

<c:if test="${count != 0}">
<table boarder="1" width="700" cellpadding="0" cellspacing="0" align="center">
	<tr height="30">
		<td align="center" width="50">번호</td>
		<td align="center" width="250">제목</td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조회</td>
	</tr>
<c:forEach var="article" items="${articleList}" >	
</c:forEach>
</table>
</c:if>



</center>
</body>
</html>