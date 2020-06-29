<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제페이지</title>

<script language="javaScript">
	function deleteCheck(){
		if(document.checkForm.pw.value == ''){
			alert("비밀번호를 입력해주세요");
			document.checkForm.pw.focus();
			return false;
		
			}
		}
	
</script>
</head>
<body>
	
	<form mathod="post" name="checkForm" 
		  action="/moneyWatch/faqDeletePro.mw" onSubmit="deleteCheck()" >
		  
	<table boarder="1" align="center">
		<tr height="30">
		<td align="center">
			<input type="password" name="pw" size="8" maxlength="10" />
			<input type="hidden" value="${pw}"/>
			
			<input type="hidden" name="faq_num" value="${faq_num}" />
			<input type="hidden" name="pageNum" value="${pageNum}" />
			</td>
		</tr>
	
	
		<tr height="30">
		<td align="center">
			<input type="submit" value="글삭제" />
			<input type="button" value="글목록으로 돌아가기" onclick="document.location.href='/moneyWatch/faqList.mw?pageNum=${pageNum}'">
		</td>
		</tr>
	
	</table>
		
	</form>
</body>
</html>