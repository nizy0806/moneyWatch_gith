<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script language="javascript">

	function selectCard(){
		$.ajax({
			type : "POST",
			url : "card.mw",
			data : {card_num:$("input[name=ca_set]").val()},
			success : function(data){
				$("#select").html(data);
			}
		});
		
	}
	
	function selectBank(){
		$.ajax({
			type : "POST",
			url : "bank.mw",
			data : {bank_num:$("input[name=ca_set]").val()},
			success : function(data){
				$("#select").html(data);
				
			}
		});
		
	}
	
</script>
<div class="jumbotron text-center" style="margin-bottom:0; background-color:#dfe9eb;">
  <h1>moneyWatch</h1>
  <p>통장이 텅장이 되지 말자!</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark"">
<div class="container">	
  <a class="navbar-brand" href="#"><i class="fas fa-bars"></i></a>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
        <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Member</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="#">회원정보 수정</a>
      <a class="dropdown-item" href="#">마이페이지</a>
      <a class="dropdown-item" href="#">회원 탈퇴</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Service</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="#">챗봇</a>
      <a class="dropdown-item" href="Calendar.mw">캘린더</a>
      <a class="dropdown-item" href="#">지출/수입 등록</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">나의 소비패턴 보기</a>
      <a class="dropdown-item" href="#">연령별 지출 비교</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">카드/계좌</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="account_cardForm.mw">등록</a>
      <a class="dropdown-item" href="card_benefit.mw">목록 및 혜택 보기</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">게시판</a>
     <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="faqList.mw">FAQ</a>
     </div>
     </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="sense.mw">금융 상식</a>
      <a class="dropdown-item" href="#">챌린지</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">관리자</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="#">회원 관리</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">연령별 지출 관리</a>
      <a class="dropdown-item" href="#">소비패턴 분석 관리</a>
      <a class="dropdown-item" href="#">카드 목록/혜택 관리</a>
      <a class="dropdown-item" href="#">챗봇 관리</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="sense.mw">게시판 관리</a>
    </div>
    </li>

    </ul>
  </div> 
  </div> 
</nav>

<br><br><br>
<div class="form-group">
<center><h1>카드/계좌 등록</h1></center>
<br>
<form name = "card_info" method="post" action="account_cardPro.mw">

	<input type="hidden" name="id" value="${memId}">
	<table align="center" width="50%">

		<tr>
  			<td><legend>카드/계좌</legend></td>
  			<td>
    		<div class="custom-control custom-radio">
      			<input type="radio" name="ca_set" id = "customRadio1" class="custom-control-input" value="0" onclick="selectCard()">
      			<label class="custom-control-label" for="customRadio1">카드</label>
    		</div>
   			</td>
   			
   			<td>
    		<div class="custom-control custom-radio">
      			<input type="radio" name="ca_set" id = "customRadio2" class="custom-control-input" value="1" onclick="selectBank()" >
      			<label class="custom-control-label" for="customRadio2">계좌</label>
    		</div>
    		</td>			
  		</tr>	
		
		<div class="form-group">
			<table align="center" width="80%" id="select">

			</table>
		</div>
		
		<tr>
			<td colspan="4" align="center"><center><input type="submit" value="등록" class="btn btn-outline-primary"></center></td>
		</tr>
		
</div>
</table>
</form>
