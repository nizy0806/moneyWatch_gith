<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<option value="none">--계좌/번호--</option>
<c:forEach items="${bankAccount}" var="account">
	<option value="${account.ca_name}">${account.ca_name}</option>
	
</c:forEach>
