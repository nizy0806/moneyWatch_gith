<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file=""%> --%>

<html>
<head>

<title>회원가입 form</title>
<link href="" rel="" type="text/css">

<script language="JavaScript">
	function checkInfor(){
		var userinput = eval("document.userinput");
		if(!userinput.id.value){
			alert("ID를 입력하세요...");
			return false;
			
		}
		if(!userinput.pw.value){
			alert("비밀번호를 입력하세요...");
			return false;
		}
		if(userinput.pw.value != userinput.pw2.value)
		{
			alert("비밀번호가 같지 않습니다...");
			return false;
		}
	}
	function confirmId(userinput){
		if(userinput.id.value==""){
			alert("아이디를 입력하세요 ...");
			return;
		}
		url = "/moneyWatch/member/confirmId.mw?id="+userinput.id.value;
		
		open(url,"confirm","toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200")
	} 
</script>

	<body bgcolor="">
	
	<form method="post" action="registerPro.jsp" name="userinput" onSubmit="return checkinfor()"></form>
	<table width="700" border="2" cellspacing="1" cellpadding="3" align="center">
		<tr>
		<td colspan="3" height="40" align="center" bgcolor="">
			<font size="+1" ><b>회원가입</b></font></td>
		</tr>
		<tr>
			<td width="300" bgcolor=""><b>아이디 입력</b></td>
			<td width="300" bgcolor="">&nbsp;</td>	
		</tr>
		
		<tr>
			<td width="300"> ID </td>
			<td width="300">
				<input type="text" name="id" size="10" maxlength="12">
			    <input type="button" name="confirm_id" value="ID중복확인"
					onclick="confirmId(this.form)">
			</td>
		
		
		
		</tr>
			<td width="300"> PW </td>
			<td width="300">
				<input type="pw" name="pw" size="15" maxlength="12">
			</td>
		<tr>
		
		
		
		
		</tr>
			<td width="300"> PW 확인 </td>
			<td width="300">
				<input type="pw" name="pw2" size="15" maxlength="12">
			</td>
		<tr>
			<td width="300" bgcolor=""><b>개인정보 입력</b></td>
			<td width="300" bgcolor="">&nbsp;</td>
		</tr>
		<tr>
			<td width="300">사용자 이름</td>
			<td width="300">
				<input type="text" name="name" size="15" maxlength="10">
			</td>
		</tr>
		<tr>
			<td width="300" >성별</td>
			<td width="300">
				<select name="gender">
				<option value="men">남 자</option>
				<option value="woman">여 자</option>
				</select>
		</td>
		</tr>
 		<tr>
 			<td width="300">생년월일</td>
 			<td width="300">
 			<script language="javascript">
				var today = new Date();
				var toyear = parseInt(today.getFullYear());
				var start = toyear;
				var end = toyear - 70;
				
				document.write("<font size=2><select name=birth_y>");
				document.write("<option value='' selected>");
				for (i=start;i>=end;i--) document.write("<option>"+i);
				document.write("</select>년  ");
				
				document.write("<select name=birth_m>");
				document.write("<option value='' selected>");
				for (i=1;i<=12;i++) document.write("<option>"+i);
				document.write("</select>월  ");
				
				document.write("<select name=birth_d>");
				document.write("<option value='' selected>");
				for (i=1;i<=31;i++) document.write("<option>"+i);
				document.write("</select>일  </font>");
			</script>
		</td>
		</tr>
			<input type="submit" name="confirm" value="등록">
			<input type="reset" name="reset" value="다시입력">
			
	</table>
	</body>
	</head>
</html>