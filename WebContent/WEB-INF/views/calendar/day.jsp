<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>일정추가</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- <link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css"> -->
<!-- custom -->
<!-- <script src="js/fullcalendar/calendar.js" type="text/javascript"></script> -->


<script>

	$('#day_submit').click(function(){
		
		theForm = document.scheduleDate;
		
		if($("input[name=title]").val() == ''){
			alert("일정명은 필수입력입니다.확인해주세요");
			$("input[name=title]").focus();
			return;
		}

	//var sc_color = $('input[name=sc_color]:checked').val();
/* 		var scheduleDB = { //일정 입력 데이터 객체변수
			id : $("#id").val(), //id - session값 이용 필요
			title : $("#title").val(), //일정명
			place : $("#place").val(), //장소
			start_time : $("#start_time").val(), //시작일 
			end_time : $("#end_time").val(), //종료일
			memo : $("#memo").val(), //메모
			sc_color : $("#sc_color").val()
		//sc_color : sc_color
		} */
	
/* 		var scheduleDB = {
			id : $("input[name=id]").val(), //id - session값 이용 필요
			title : $("input[name=title]").val(), //일정명
			place : $("input[name=place]").val(), //장소
			start_time : $("input[name=start_time]").val(), //시작일 
			end_time : $("input[name=end_time]").val(), //종료일
			memo : 'aaa', //$("input[name=memo]").val(), //메모
			sc_color : $("input[name=sc_color]").val()
	
		} */
		
		$.ajax({
			type : "post", //송신 데이터타입
			url : "day_insert.mw",
			data : {
				id : $("input[name=id]").val(), //id - session값 이용 필요
				title : $("input[name=title]").val(), //일정명
				place : $("input[name=place]").val(), //장소
				start_time : $("input[name=start_time]").val(), //시작일 
				end_time : $("input[name=end_time]").val(), //종료일
				memo : $("#exampleTextarea").val(), //메모
				sc_color : $("#sc_color").val()	
			},
			//dataType : "JSON", //수신 데이터타입
			success : function(data) {
				alert("일정이 등록되었습니다.");
				$('#myModal').hide();
				window.location.reload();

			}
		});
		
		
	});
</script>

</head>

<body>
<button onclick="window.open('/moneyWatch/moneyioForm.mw')">입/출금 등록하기</button>
	
<center><h5>일정추가</h5></center>
	<table width=100%>
	<form name="scheduleDate" method="post" onsubmit="test()">
		<input type="hidden" id="id" name="id" value="tempid"/>
	
<!-- 		<div class="domain">
			<h3 class="zTree-h3">일정</h3>
		</div>
		
		<div class="domain">
			<input class="title" id="title" type="text" name="title" required>
		</div> -->
		
		<tr><td>
		<div class="form-group" style="width:100%;">
	
		<label class="col-form-label col-form-label-sm" for="inputSmall">일정</label>
  		<input type="text" name="title" class="form-control form-control-sm" id="inputSmall" required>
		
		</div>
		</td>
		
<!-- 		<div class="domain">
			<h3 class="zTree-h3">색상</h3>
		</div>	 -->
		
<!-- 	  <div class="form-group">
	      <label for="exampleSelect2">Example multiple select</label>
	      <select class="form-control" id="sc_color" name="sc_color">
				<option value="#FFEB5A" style="color:#FFEB5A;"> 노랑색</option>
				<option value="#C45FDD" style="color:#C45FDD;"> 보라색</option>
				<option value="#5AD18F" style="color:#5AD18F;"> 초록색</option>
				<option value="#5CEEE6" style="color:#5CEEE6;"> 민트색</option>
	      </select>
       </div> -->
       <td>
       <div class="form-group" style="width:100%;">
		<label class="col-form-label col-form-label-sm" for="inputSmall">색상</label>
		<select class="custom-select" name="sc_color" id="sc_color">
			<!-- <select class="sc_color" name="sc_color" id="sc_color"> -->
			<option value="">색상
			<option value="#FFEB5A" style="color:#FFEB5A;"> 노랑색</option>
			<option value="#C45FDD" style="color:#C45FDD;"> 보라색</option>
			<option value="#5AD18F" style="color:#5AD18F;"> 초록색</option>
			<option value="#5CEEE6" style="color:#5CEEE6;"> 민트색</option>
		</select>
			<!-- 노랑 <input class="sc_color" type="radio" name="sc_color" value="#FFEB5A" style="color:#FFEB5A;">
			보라 <input class="sc_color" type="radio" name="sc_color" value="#C45FDD">
			초록 <input class="sc_color" type="radio" name="sc_color" value="#5AD18F">
			민트 <input class="sc_color" type="radio" name="sc_color" value="#5CEEE6"> -->
		</div>
		</td></tr>
		
		<tr><td>
		<div class="form-group" style="width:100%;">
		<label class="col-form-label col-form-label-sm" for="inputSmall">시작일</label>
  		<input type="date" name="start_time" class="form-control form-control-sm" id="inputSmall" value="${date}" size="10">
  		</div>
  		</td>
  		<td>
  		<div class="form-group" style="width:100%;">
  		<label class="col-form-label col-form-label-sm" for="inputSmall">종료일</label>
  		<input type="date" name="end_time" class="form-control form-control-sm" id="inputSmall" value="${date}" size="10">
  		</div>
  		</td></tr>
  		
  		<tr><td vlign="top">
  		<div class="form-group" style="width:100%;">
  		<label class="col-form-label col-form-label-sm" for="inputSmall">장소</label>
  		<input type="text" name="place" class="form-control form-control-sm" id="inputSmall">
  		</div>
  		</td>
  		
  		<td>
  		<div class="form-group" style="width:100%;">
      	<label for="exampleTextarea">메모</label>
      	<textarea class="form-control" name="memo" id="exampleTextarea" rows="5" cols="20" > </textarea>
    	</div>
  		</td></tr>
  		
		<%-- <div class="domain">
			<h3 class="zTree-h3">시작일</h3>
		</div> 
		<div class="domain">
			<input class="date" id="start_time" type="date" name="start_time" value="${date}">
		</div>
		<div class="domain">
			<h3 class="zTree-h3">종료일</h3>
		</div>
		<div class="domain">
			<input class="date" id="end_time" type="date" name="end_time" value="${date}">
		</div>
		<div class="domain">
			<h3 class="zTree-h3">장소</h3>
		</div>
		<div class="domain">
			<input class="place" id="place" type="text" name="place">
		</div>
		<div class="domain">
			<h3 class="zTree-h3">메모</h3>
		</div>
		<div class="domain">
			<textarea class="memo" id="memo" type="text" name="memo" row="5" cols="20" placeholder="100글자까지 입력 가능합니다"></textarea>
		</div> --%>
		
		<!-- <button type="submit" id = "day_submit" name="day_submit" class="day_submit">등록</button> -->
	<tr><td colspan=2>
	<center><button type="button" class="btn btn-outline-primary" id ="day_submit" name="day_submit" >등록</button></center>		
	</td></tr>
	</form>	
	
	</table>
</body>

</html>