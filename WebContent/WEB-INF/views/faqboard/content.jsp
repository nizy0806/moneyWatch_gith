<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>유저 게시판 Content</title>

</head>





<body>
<table width="50%" border="1" cellspacing="0" cellpadding="0" >
	<tr height="30">
		<td align="center" width="125">글번호</td>
		<td align="center" width="125">${number+1}
		<input type="hidden" value="${article.faq_num}"/> </td>
		
		<td align="center" width="125">조회수</td>
		<td align="center" width="125">${article.readcount}</td>
	</tr>
		
		
	<tr height="30">	
		<td align="center" width="125">제 목</td>
		<td align="center" width="125">${article.subject}</td>
	</tr>
	
	<tr height="30">	
		<td align="center" width="125">작성자</td>
		<td align="center" width="125">${article.id}</td>
		<td align="center" width="125">작성일</td>
		<td align="center" width="125">${article.reg}</td>
	</tr>
	
	<tr height="30">	
		<td align="center" width="125">글내용</td>
		<td align="left" width="380" colspan="3">${article.content}</td>
	</tr>
	

	<tr height="30">
		<td colspan="4" align="right">
	
		
		<input type="button" value="글수정" onclick="document.location.href='/moneyWatch/faqUpdateForm.mw?faq_num=${faq_num}&pageNum=${pageNum}'" />
		
		<input type="button" value="글삭제" onclick="document.location.href='/moneyWatch/faqDeleteForm.mw?faq_num=${faq_num}&pageNum=${pageNum}'" />
		
		<%-- <input type="button" value="답글쓰기" onclick="document.location.href='/moneyWatch/faqWriteForm.mw?faq_num=${faq_num}&ref=${ref}&re_step=${re_step}&re_level=${re_level}'" />
		 --%>
		<input type="button" value="목록보기" onclick="document.location.href='/moneyWatch/faqList.mw?pageNum=${pageNum}'" />
		</td>
	</tr>
	
	<form action="replyPro.mw">
		<table border="1" width="400" cellspacing="0" cellpadding="0" align="left">
		
		<tr>
			<td align="center" width="125">${SessionScope.memId}
			<input type="hidden" name="rname" value="${writer}"></td>
		</tr>
			<br />
			<td><textarea rows="5" cols="50" name="replytext" placeholder="댓글을 작성하세요" ></textarea></td>
		
		</table>
		
		
		<tr height="30">
		<td colspan="4" align="right">
			<input type="hidden" name="qno" value="${dto.getQno()}" />
			<input type="hidden" name="step" value="${dto.getStep()}" />
			<input type="hidden" name="id" value="${SessionScope.memId}" />
			<input type="submit" value="댓글작성" />
		</td>
		</tr>
	</form>
	
</table>
</body>
</html>