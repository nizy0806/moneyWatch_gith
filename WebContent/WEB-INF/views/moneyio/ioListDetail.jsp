<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="1" width=100%>
	<tr>
		<td width="100" align="center">
			${dto.io_category}
		</td>
		<td width="300" align="center" colspan="3">
			${dto.io_detail}
		</td>
		<td width="100" align="center">
			<c:if test="${dto.io_set==1}">
				지출
			</c:if>
			<c:if test="${dto.io_set==0}">
				수입
			</c:if>
		</td>
	</tr>
	<tr>
		<td width="300" align="center" colspan="3">
			${dto.io_bank}
		</td>
		<td width="200" align="center" colspan="2">
			<button onclick="window.open('/moneyWatch/nbreadList?ioNum=${dto.io_num}')">N빵 내역</button>			
		</td>
	</tr>
	<tr>
		<td width="300" align="center" colspan="3">
			${dto.io_account}
		</td>
		<td width="100" align="center">
			<button onclick="window.location.href='/moneyWatch/ioUpdateForm.mw?ioNum=${dto.io_num}'">수정</button>
		</td>	
		<td width="100" align="center">
			<button onclick="window.location.href='/moneyWatch/moneyioDelete?ioNum=${dto.io_num}'">삭제</button>
		</td>
	</tr>
</table>