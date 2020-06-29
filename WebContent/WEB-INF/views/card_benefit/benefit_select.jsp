<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>	
<script language="javascript">

	function setSelectBox2(){
	 	$.ajax({
			type: "POST",
			url: "benefit.mw", // 데이터를 넘겨줄 url
			data: {cardName:$("#card_name").val()}, // 설정한 url에 넘겨줄 데이터
			success: function(data){
				$("#benefit").html(data); // 다시 받아온 데이터를 넣어줄 곳
			}			
		});
	}
	
</script>
	 <br>
  		<div class="form-group">
		<td>
			<select class="custom-select" name="ca_name" id="card_name" onchange="setSelectBox2()">
				<option value="카드명">카드명</option>
					<c:forEach var="cdto" items="${cardList}">
						
						<c:if test="${cardCompany == '국민카드'}">
							<option value="${cdto.card_name}">${cdto.card_name}</option>
		
						</c:if>
						
						<c:if test="${cardCompany == '현대카드'}">
							<option value="${cdto.card_name}">${cdto.card_name}</option>
						</c:if> 
						
						<c:if test="${cardCompany == '우리카드'}">
							<option value="${cdto.card_name}">${cdto.card_name}</option>
						</c:if>
						 
						<c:if test="${cardCompany == '기업카드'}">
							<option value="${cdto.card_name}">${cdto.card_name}</option>
						</c:if>
						
						<c:if test="${cardCompany == '신한카드'}">
							<option value="${cdto.card_name}">${cdto.card_name}</option>
						</c:if>
						
						<c:if test="${cardCompany == '롯데카드'}">
							<option value="${cdto.card_name}">${cdto.card_name}</option>
						</c:if>
						
						<c:if test="${cardCompany == '삼성카드'}">
							<option value="${cdto.card_name}">${cdto.card_name}</option>
						</c:if>
						</c:forEach>
				
			</select>
		</td>
		<label id="image"></label>
		<label id="benefit"></label>
	</div>