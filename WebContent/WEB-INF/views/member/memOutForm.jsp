<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>회원탈퇴 페이지</title>


<script language="javaScript">
	function begin(){
		document.myform.pw.focus();
	}
	
	function checkIt(){
		if(!document.myform.pw.value){
			alert("비밀번호를 입력해주세요");
			document.myform.pw.focus();
			return false;	
			}
		}
</script>


<body onload="begin()" >
<form name="myform" action="/moneyWatch/memOutPro.mw" method="post" onSubmit="return checkIt()">
<table cellSpacing="1" cellPadding="1" width="260" border="1" align="center" >
	<tr height="30">
	  <td colspan="2" align="middle" >
	  <input type="password" name="pw" size="15" maxlength="12"></td></tr>
	 
	<td width="300">탈퇴사유</td>
	<td width="300">
	  <select name="reason">
	  <option value="그냥">그냥</option>
	  <option value="질려서">질려서</option>
	  </select>
	  </td></tr>
	 

	  
	<tr height="30">
	  <td colspan="2" align="middle">
	  <input type="submit" value="회원 탈퇴">
	  <input type="button" value="취 소" onclick="javascript:window.location='/moneyWatch/main.mw'">
	  </td></tr>
</table>
</form>
</head>
</body>
</html>