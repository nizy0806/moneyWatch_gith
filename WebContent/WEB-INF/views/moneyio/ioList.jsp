<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<%
	String id = request.getParameter("id");
	String filter = request.getParameter("filter");
	System.out.println(id);
	System.out.println(filter);
	out.println(id);
	out.println(filter);
%>


<!-- 내역 출력 -->
<div id="ioList">
	<table border = "1" width="500">
		<c:forEach var="ioList" items="${moneyioList}">
			<tr>
				<td align = center>
					${ioList.io_reg_date}
				</td>
				<td align = right>
					거래 금액
				</td>
				<td align = right>
					${ioList.io_price} 원
				</td>
			</tr>
			<tr>
				<td align = center>
					${ioList.io_detail}
				</td>
				<td align = right>
					남은 잔액
				</td>
				<td align = right>
					${ioList.io_remain} 원
				</td>
			</tr>
		</c:forEach>
	</table>
</div>