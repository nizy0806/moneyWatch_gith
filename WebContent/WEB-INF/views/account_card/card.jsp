<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>	
<script language="javascript">

	function setSelectBox(){
		$.ajax({
			type: "POST",
			url: "select_card.mw", // 데이터를 넘겨줄 url
			data: {cardCompany:$("#company").val()}, // 설정한 url에 넘겨줄 데이터
			success: function(data){
				$("#select_card").html(data); // 다시 받아온 데이터를 넣어줄 곳
			}			
		});
	}
	
</script>
		
		<td>카드사</td>
		<td>
			<select name="ca_company" id="company" onchange="setSelectBox()">
				<option value="카드사">카드사</option>
				<c:forEach var = "cdto" items="${card_company_list}" >
					<option value="${cdto.company}">${cdto.company}</option>
				</c:forEach>
			</select>				
		</td>
		
		<label id="select_card" ></label>