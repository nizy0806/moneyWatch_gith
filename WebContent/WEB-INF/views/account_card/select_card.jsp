<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


		<td>통장/카드이름</td>
		<td>
			<select name="ca_name" id="card_name">
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
