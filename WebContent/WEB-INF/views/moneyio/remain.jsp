<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<td><div style="text-align:center;"><fmt:formatNumber value="${io_remain}" pattern="#,###" /></div>
<input type="hidden" value="${io_remain}" name="io_old_remain"/></td>    
<%-- <input type="text" class="form-control"
 	name="io_remain" value="${io_remain}" placeholder="won" disabled>  --%>
 	

 	
 	