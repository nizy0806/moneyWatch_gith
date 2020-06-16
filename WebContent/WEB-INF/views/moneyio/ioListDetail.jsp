<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="1" width=100%>
	<tr>
		<td width="100" >
			${dto.io_category}
		</td>
		<td width="300"  colspan="3">
			${dto.io_detail}
		</td>
		<td width="100" >
			<c:if test="${dto.io_set==1}">
				지출
			</c:if>
			<c:if test="${dto.io_set==0}">
				수입
			</c:if>
		</td>
	</tr>
	<tr>
		<td width="300"  colspan="3">
			${dto.io_bank}
		</td>
		<td width="200" align="center" colspan="2">
			<input type="button" value="N빵 내역" />			
		</td>
	</tr>
	<tr>
		<td width="300"  colspan="3">
			${dto.io_account}
		</td>
		<td width="100" align="center">
			<input type="button" value="수정" />
		</td>	
		<td width="100" align="center">
			<input type="button" value="삭제" />
		</td>
	</tr>
</table>