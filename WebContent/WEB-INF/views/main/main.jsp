<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

        
<html>
<head>
<title>메인페이지</title>
<c:if test="${sessionScope.memId ==null}">
<script language="javaScript">

function focusIt(){
	document.inputForm.id.focus();
}

function checkIt(){
	inputForm=eval("document.inform");
		if(!inputForm.id.value){
		alert("아이디를 입력하세요");
		inputForm.id.focus();
		
		return false;
		}
		if(!inputForm.pw.value){
			alert("비밀번호를 입력하세요");
			inputForm.pw.focus();
			
			return false;
		}
	}
</script>
	<tr>
	<td width="300" height="20">&ndsp;</td>
	
	<form name="inputForm" method="post" action="/moneyWatch/loginPro.mw" onSubmit="return checkIt();">
	<td width="100" align="right">아이디</td>
	<td width="100">
		<input type="text" name="id" size="15" mexlength="10"></td>
		
	<td width="100" align="right">비밀번호</td>
	<td width="100">
		<input type="password" name="pw" size="15" mexlength="10"></td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<input type="submit" name="Submit" value="로그인">
			<input type="button" value="회원가입" onclick="javascript:window.location='/moneyWatch/registerForm.mw'">
	
	</td>		
	</form>
	</tr>
    </c:if>
    
    
	<td rowspan="3" align="center">${sessionScope.memId}님 환영합니다<br />
	<c:if test="${sessionScope.memId != null}"> 
	<form method="post" action="/moneyWatch/logout.mw">
	
	
	<input type="submit" value="로그아웃" >
	<input type="button" value="회원정보변경" onclick="javascript:window.location='/moneyWatch/modify.mw'">


</form>


</head>
</c:if>
</html>