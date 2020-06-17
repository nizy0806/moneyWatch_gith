<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원정보수정</title>

<script language="JavaScript">
    <!-- 
    function checkIt(){
    	var userinput = eval("document.userinput");
    	
    	if(!userinput.pw.value){
    		alert("비밀번호를 입력하세요");
    		return false;
     	}
    	if(!userinput.name.value){
    		alert("사용자 이름을 입력하세요");
    		return false;
    	}   		
    }
    -->
</script>
<body>
  <form method="post" action="/moneyWatch/modifyPro.mw" name="userinput" onsubmit="return checkIt()">

   <table width="400" border="1" cellspacing="0" cellpadding="2" align="center">
    <tr>
     <td colspan="2" heigth="35" align="center">
      <font size="+1"><b>회원 정보 수정</b></font></td>
    </tr>
    
    <tr>
     <td width="150">사용자 ID</td>
      <input type="hidden" name="id" value="${dto.getId()}">
     <td width="350">${dto.getId()}</td>
    </tr>
    
    <tr>
     <td width="150">이름</td>
     <td width="350">
      <input type="text" name="name" size="9" maxlength="9" value="${dto.getName()}"></td>
    </tr>
       
    <tr>
     <td width="150">비밀번호</td>
     <td width="350">
      <input type="password" name="pw" size="9" maxlength="9" value="${dto.getPw()}"></td>
    </tr>
    
    <tr>		
		<td width="300"> 휴대폰 번호 </td>
		<td width="300">
				<select name="tel" value="${dto.getTel()}">
				<option value="SKT">SKT</option>
				<option value="KT">KT</option>
				<option value="LGU+">LGU+</option>
				<option value="알뜰폰">알뜰폰</option>			
				</select>
				
				<select name="phone1" value="${dto.getPhone1()}">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="019">019</option>
				</select>
				
				
				<input type="text" name="phone2" size="10" maxlength="4" value="${dto.getPhone2()}">
				<input type="text" name="phone3" size="10" maxlength="4" value="${dto.getPhone3()}">
		</td>
		</tr>

    <tr>
     <td wigth="150">우편번호</td>
     <td width="350">
      <input type="text" name="zon" size="9" maxlength="9" value="${dto.getZon()}"></td>
    </tr>
    
    <tr>
     <td wigth="150">주소</td>
     <td width="350">
      <input type="text" name="street" size="30" maxlength="30" value="${dto.getStreet()}"></td>
    </tr>
    
    <tr>
     <td wigth="150">상세주소</td>
     <td width="350">
      <input type="text" name="addr" size="9" maxlength="9" value="${dto.getAddr()}"></td>
    </tr>

    <tr>
		<td width="300">이메일 ID</td>
		<td width="300">
				<input type="text" name="email1" size="10" maxlength="12" value="${dto.getEmail1()}"><a>@</a>
				<input type="text" name="email2" size="10" maxlength="12" value="${dto.getEmail2()}">
		
		</td>
		</tr>
    
    <tr>
     <td colspan="1" align="center">
      <input type="submit" name="modify" value="수정">
      <input type="button" value="취소" onclick="javascript:window.location='main.mw'"></td>
    </tr>
   </table>
  </form> 
 </body>
</head>
</html>