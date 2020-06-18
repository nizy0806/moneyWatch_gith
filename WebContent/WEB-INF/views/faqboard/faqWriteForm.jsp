<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
<script language="javaScript">
function writeSave(){
	
	
	
	
}
</script>
<center><b>글쓰기</b>
<br>
	<form action="post" name="writeform" action="/moneyWatch/faqWritePro.mw" onsubmit="return writeSave()" >
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="num" value="${ref}">
	<input type="hidden" name="num" value="${re_step}">
	<input type="hidden" name="num" value="${re_level}">
	
	<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr>
	<td align="right" colspan="2">
	</td>	
	</tr>
	
	<tr>
	<td width="70" align="center">이름</td>
	<td width="330">
	<input type="text" size="10" maxlength="10" name="writer"></td>
	</tr>
	
	<tr>
	<td width="70" align="center">제목</td>
	<td width="330">
	<input type="text" size="10" maxlength="10" name="subject"></td>
	<c:if test="${num==0}">
	
	<input type="text" size="40" maxlength="50" name="subject" value="답변">
	</c:if>
	</tr>
	
	
	<tr>
	<td width="70" >Email</td>
	<td width="330">
	<input type="text" size="40" maxlength="30" name="email"></td>
	</tr>
	
	<tr>
	<td width="70" align="center">비밀번호</td>
	<td width="330">
	<input type="text" size="8" maxlength="10" name="password"></td>
	</tr>
	
	<tr>
	<td colspan="2" align="center">
	<input type="submit" value="글쓰기">
	<input type="reset" value="새로작성">
	<input type="button" value="목록보기" onclick="window.location='/moneyWatch/faqList.mw'">
	
	
	
	</table>
	
	
	
	
	
	</form>
</head>
</html>