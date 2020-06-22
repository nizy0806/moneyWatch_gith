<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function replace(url){
		url= encodeURIComponent(url);
	    return url;
	}
</script>


<h1>등록된 나의 카드 및 계좌</h1>

	 <c:if test="${empty myCardList}">

		<table>
			<tr>
				<td>등록된 카드 및 계좌가 없습니다.</td>
			<tr>
			<tr align="center">
				<td><input type="button" value="등록하기" onclick="window.location='/moneyWatch/account_cardForm.mw'"></td>
			</tr>
		</table>
		
	</c:if>
	
<h3>카드목록</h3>

<table border="1">
	<tr align="center"><th>카드사</th><th>카드명</th><th>카드별칭</th><th>삭제</th></tr>
	<c:forEach var="cdto" items="${myCardList}">
		<c:if test="${cdto.ca_set == '0'}">
			<tr align="center">
				<td>${cdto.ca_company}</td><td><a href="mycardBenefit.mw?ca_name=${cdto.ca_name}" onclick="replace(${cdto.ca_name});">${cdto.ca_name}</a></td></form>
				<td>${cdto.ca_nickname}</td><td><a href='myCardDel.mw?num=${cdto.num}'>삭제</a></td>
			</tr>	
		</c:if>
	</c:forEach>
</table>



<h3>계좌목록</h3>
<table border="1">
	<tr align="center"><th>은행명</th><th>계좌번호</th><th>계좌별칭</th><th>삭제</th></tr>
<c:forEach var="cdto" items="${myCardList}">
<c:if test="${cdto.ca_set == '1' }">
	<tr align="center">
		<td>${cdto.ca_company}</td><td>${cdto.ca_name}</td><td>${cdto.ca_nickname}</td>
		<td><a href='myCardDel.mw?num=${cdto.num}'>삭제</a></td>
	</tr>	
</c:if>
</c:forEach>
</table>

<br>
<div>
<input type="button" value="등록하기" onclick="window.location='/moneyWatch/account_cardForm.mw'">
</div>