<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>FAQ 게시판</title>
</head>
<body>
<center><b>*FAQ*</b>

 <tr>
 	<td align="right">
	<c:if test="${sessionScope.memId =='aaa'}">
	<button><a href="/moneyWatch/faqQwriteForm.mw">글쓰기</a></button>
	</c:if>
 	</td>
 </tr>

<c:if test="${qcount>0}">
<table  width="500" border="1" cellpadding="0" cellspacing="0">
 
 
 
 
 <tr>
		<td align="center" width="50">번호</td>
		<td align="center" width="250">제목</td>
		<td align="center" width="250">작성자 ID</td>
		<td align="center" width="100">닉네임</td>
		<td align="center" width="400">작성일</td>
		<td align="center" width="50">조회</td>
 </tr>
 
 <tr>
 	
 
	<c:forEach var="qlist" items="${qList}" >
	  <tr height="30">
	  	<td align="center" width="40">${qlist.qnum}</td>
	  	
		<td align="center" width="40">
		<a href = "/moneyWatch/faqContent.mw?qnum=${qlist.qnum}">${qlist.qsubject}</a></td>
		<td align="center" width="40">${qlist.q_id}</td>
		<td align="center" width="40">${qlist.nickname}</td>
		<td align="center" width="40">${qlist.reg}</td>
		<td align="center" width="40">${qlist.qreadcount}</td>
	  </tr>
	</c:forEach>
</c:if>
</table>
</center>
</body>




<body>
<center><b>전체글 [${count}]</b>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
<tr>
	<td align="right">
	<c:if test="${sessionScope.memId != null}">
	<button><a href="/moneyWatch/myList.mw">내가쓴글</a></button>
	<button><a href="/moneyWatch/faqWriteForm.mw">글쓰기</a></button>
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
</tr>
</table>
</c:if>

<c:if test="${count != 0}">
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
	<tr height="30">
		<td align="center" width="20">   </td>
		<td align="center" width="50">번호</td>
		<td align="center" width="250">제목</td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="400">작성일</td>
		<td align="center" width="50">조회</td>
	</tr>
	
	
	
	
	
	<c:forEach var="article" items="${articleList}">

	<tr height="30">
	
		<td align="center" width="60">
			<c:if test="${article.readcount >= 20}">
			<img src="/moneyWatch/image/hot.gif" border="0" height="16" ></c:if></td>
			
	
		<td align="center" width="50">${number} 
			<c:set var="number" value="${number-1}" /></td>
			
		<td align="center" width="100">
			<a href="/moneyWatch/content.mw?faq_num=${article.faq_num}&pageNum=${currentPage}&number=${number}">
			${article.subject}</a></td>
			
		<td align="center" width="100">${article.id}</td>
		
		
		<td align="center" width="150">${article.reg}</td>
		
		
		<td align="center" width="70">${article.readcount}</td>
	</tr>
		
</c:forEach>
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
























