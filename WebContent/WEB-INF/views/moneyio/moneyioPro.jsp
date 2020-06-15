<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script language="JavaScript">

	if (confirm("다른 지출/수입 내역을 기입하시겠습니까?") == true) { //확인
		window.location = "./moneyioForm.mw";
	
	} else { //취소
		window.location = "./moneyioList.mw";
	
	}
</script>

