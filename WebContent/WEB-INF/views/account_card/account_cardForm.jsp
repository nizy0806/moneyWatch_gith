<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script language="javascript">
	function setSelectBox(){

		$.ajax({
			type: "POST",
			url: "select_card.mw", // 데이터를 넘겨줄 url
			data: {cardCompany: $("#company").val()}, // 넘겨줄 데이터
			success: function(data){
				$("#select_card").html(data); // 다시 받아온 데이터를 넣어줄 곳
			}			
		});
		
		
	}
</script>

<form name = "card_info" method="post" action="account_cardPro.mw">
	<table>
		<tr>
			<td>회원id</td>
			<td><input type="hidden" name="id" value="${memId}">${memId}</td>
		</tr>
		
		<tr>
			<td>카드/통장</td>
			<td>
				<select name="ca_set" >
					<option value=""></option>
					<option value="0">카드</option>
					<option value="1">통장</option>
				</select>
			</td>
		</tr>
	
		<tr>
			<td>은행/카드 기업명</td>
			<td>
				<select name="ca_company" id="company" onchange="setSelectBox()">
					<option value="카드사">카드사</option>
					<c:forEach var = "cdto" items="${card_company_list}" varStatus="status">
						<option value="${cdto.company}">${cdto.company}</option>
					</c:forEach>
				</select>				
			</td>
		</tr>
		<tr id="select_card"></tr>
		
		<tr>
			<td>통장/카드 별칭</td>
			<td><input type="text" name="ca_nickname"></td>
		</tr>
		
		<tr>
			<td><input type="submit" value="등록" /></td>
		</tr>
		
	</table>
	



<%--
1. 카드회사 선택 (onChange())
2. script >> 카드이름선택할 select visible(block)
3. 선택한 카드에 대한 카드 종류들이 나오는 ... 


 --%>


</form>
