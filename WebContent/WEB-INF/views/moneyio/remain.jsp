<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<td><fmt:setLocale value="ko"/>
<fmt:formatNumber type="text" value="${io_remain}" pattern="#,###" var="remain" />
<input type="text" class="form-control" pattern="#,###" value="${remain}" disabled/>
<input type="hidden" value="${io_remain}" name="io_old_remain"/></td>    


 	
 	