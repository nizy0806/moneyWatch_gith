<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>FAQ 게시판</title>
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

	<tr height="30">
		<td align="center" width="50">${number} 
			<c:set var="number" value="${number-1}" />
			<c:if test="${article.readcount >= 20}">
			<img src="/moneyWatch/image/hot.gif" border="0" height="16" ></c:if></td>
			
			
			<c:set var="wid" value="0" />
			<c:if test="${article.re_level > 0}" >
			<img src="/moneyWatch/image/level.gif" width="${wid}" height="16" />
			<c:set var="wid" value="${5*article.re_level}" />
			</c:if>
		
			<c:if test="${article.re_level == 0}" >
			<img src="/moneyWatch/image/level.gif" width="${wid}" height="16">
			</c:if>
			
		<td align="center" width="100">
			<a href="/moneyWatch/content.mw?faq_num=${article.faq_num}&pageNum=${currentPage}&number=${number}">
			${article.subject}</a></td>
			
		<td align="center" width="100">
			<a>${article.writer}</a></td>
		
		
		<td align="center" width="150">${article.reg}</td>
		
		
		<td align="center" width="70">${article.readcount}</td>
		
		
	</c:forEach>
</tr>
</table>
</c:if>


	<c:if test="${count > 0}">
	
		<c:if test="${startPage > 10}">
		<a href="/moneyWatch/faqList.mw?pageNum=${startPage - 10}">이전</a>
		</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="/moneyWatch/faqList.mw?pageNum=${i}" >${i}</a>
			</c:forEach>
		
		<c:if test="${endPage < pageCount}" >
			<a href="/moneyWatch/faqList.mw?pageNum=${startPage + 10}">다음</a>
		</c:if>
	</c:if>
</center>
</body>
</html>
























