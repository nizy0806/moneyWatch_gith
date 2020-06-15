<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	
	function detail(ioNum){
		$.ajax({
			url : "ioListDetail.mw",
			data : {ioNum: ioNum},
			success : function(data){
				$("#ioListDetail").html(data);
			}
		});
	}
</script>



<!-- 내역 출력 -->
<div id="ioList">
	
		<c:forEach var="ioListval" items="${moneyioList}">
		<table border = "1" width="500">
			<tr>
				<td align = center onclick="detail(${ioListval.io_num})">
					${ioListval.io_reg_date}
				</td>
				<td align = right onclick="detail(${ioListval.io_num})">
					거래 금액
				</td>
				<td align = right onclick="detail(${ioListval.io_num})">
					${ioListval.io_price} 원
				</td>
			</tr>
			<tr>
				<td align = center onclick="detail(${ioListval.io_num})">
					${ioListval.io_detail}
				</td>
				<td align = right onclick="detail(${ioListval.io_num})">
					남은 잔액
				</td>
				<td align = right onclick="detail(${ioListval.io_num})">
					${ioListval.io_remain} 원
				</td>
			</tr>
		</table>	
		</c:forEach>
	
</div>