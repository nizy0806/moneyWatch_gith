<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script language="javascript">

	function selectCard(){
		$.ajax({
			type : "POST",
			url : "card.mw",
			data : {card_num:$("#ca_set1").val()},
			success : function(data){
				$("#select").html(data);
			}
		});
		
	}
	
	function selectBank(){
		$.ajax({
			type : "POST",
			url : "bank.mw",
			data : {bank_num:$("#ca_set2").val()},
			success : function(data){
				$("#select").html(data);
				
			}
		});
		
	}
	
	

</script>

<h1>카드/계좌 등록</h1>
<form name = "card_info" method="post" action="account_cardPro.mw">
	<table align="center" border="1">
		<tr>
			<td>회원id</td>
			<td><input type="hidden" name="id" value="${memId}">${memId}</td>
		</tr>
		
		<tr>
			<td>카드/계좌</td>
			<td>
				<input type="radio" name="ca_set" id = "ca_set1" value="0" onclick="selectCard()">카드
				<input type="radio" name="ca_set" id = "ca_set2" value="1" onclick="selectBank()">계좌				
			</td>
		</tr>
		
		<tr id="select"></tr>

		
		<tr >
			<td align="center" colspan="3"><input type="submit" value="등록" /></td>
		</tr>
		
	</table>

</form>
