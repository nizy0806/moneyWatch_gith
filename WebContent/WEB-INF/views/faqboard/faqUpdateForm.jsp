<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>update form</title>
<center><b>글수정</b>
<br>

<script language="JavaScript">
function writeSave(){
	
	if(document.writeform.writer.value==""){
	  alert("작성자를 입력하세요");
	  document.writeform.writer.focus();
	  return false;
	}
	if(document.writeform.subject.value==""){
	  alert("제목을 입력하세요");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){
	  alert("내용을 입력하세요");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(document.writeform.passwd.value==""){
	  alert(" 비밀번호를 작성하세요");
	  document.writeform.passwd.focus();
	  return false;
	}
 }    
</script>
<form method="post" name="writeform" action="/moneyWatch/faqUpdatePro.mw" onsubmit="return writeSave()">
<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td  width="70"   align="center">이 름</td>
    <td align="left" width="330">
       <input type="text" size="10" maxlength="10" name="writer" value="${dto1.getWriter()}"></td>
	   <input type="hidden" name="faq_num" value="${dto1.getFaq_num()}" />
  </tr>
  <tr>
    <td  width="70"  align="center" >제 목</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="subject" value="${dto1.getSubject()}"></td>
  </tr>
  <tr>
    <td  width="70"  align="center">Email</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="30" name="faq_email" value="${dto1.getFaq_email()}"></td>
  </tr>
  <tr>
    <td  width="70"   align="center" >내 용</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="40">${dto1.getContent()}</textarea></td>
  </tr>
  <tr>
    <td  width="70"   align="center" >비밀번호</td>
    <td align="left" width="330" >
     <input type="password" size="8" maxlength="12" name="pw">
     
	 </td>
  </tr>
  <tr>      
   <td colspan=2  align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="window.location='moneyWatch/faqList.mw'">
   </td>
 </tr>
 </table>
</form>

      
</body>
</html>      