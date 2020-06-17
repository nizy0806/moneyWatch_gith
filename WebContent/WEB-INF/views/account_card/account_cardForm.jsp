<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="post" action="account_cardPro.mw">
	<table>
		<tr>
			<td>회원id : <input type="text" name="id" /><td>
		</tr>
		
		<tr>
			<td>카드/통장</td>
			<td>
				<select name="ca_set">
					<option value=""></option>
					<option value="0">카드</option>
					<option value="1">통장</option>
				</select>
			</td>
		</tr>
	
		<tr>
			<td>은행/카드 기업명</td>
			<td>
				<select name="ca_company">
					<option value="">카드사</option>
					<c:forEach var="cdto" items="${card_company_list}">
						<option value="${cdto.company}">${cdto.company}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>통장/카드 이름</td>
			<td>
				<select name="ca_name">
					<option value="">카드이름</option>
					<c:forEach var="cdto" items="${card_name_list}">
						<c:if test=""></c:if>
						<option value="${cdto.card_name}">${cdto.card_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>통장/카드 별칭</td>
			<td><input type="text" name="ca_nickname"></td>
		</tr>
		
		<tr>
			<input type="submit" value="등록" />
		</tr>	
	</table>


</form>
