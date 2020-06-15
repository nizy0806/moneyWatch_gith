<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>일정추가</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script scr="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- custom -->
<script src="js/fullcalendar/calendar.js" type="text/javascript"></script>

<script>
	function schedule_insert(){
		var scheduleDB = {
				id : $("#id").val(), 
				title : $("#title").val(), 
				place : $("#place").val(), 
				start_time : $("#start_time").val(), 
				end_time : $("#end_time").val(), 
				memo : $("#memo").val()
		}
		$.ajax({
			type : "post",
			url : "C_insert.mw",
			data : scheduleDB,
			success : function(data){
				//opener.parent.loaction.reload();
				console.log(data);
				//$("").html(data);
				//window.close();
			}
		})
	}
</script>

</head>

<body>
<div class="group" id="popupGroup">
	<div class= "group-head">
		<h1 class="xTree-h1">일정추가</h1>
	</div>
	<div class="group-body">
	<form id="scheculeData" method="post">
		<input type="hidden" id="id" name="id" value="tempid"/>
	
		<div class="domain">
			<h3 class="zTree-h3">일정</h3>
		</div>
		<div class="domain">
			<input class="title" id="title" type="text" name="title" placeholder="일정을 입력해주세요">
		</div>
		<div class="domain">
			<h3 class="zTree-h3">시작일</h3>
		</div>
		<div class="domain">
			<input class="date" id="start_time" type="text" name="start_time" placeholder="">
		</div>
		<div class="domain">
			<h3 class="zTree-h3">종료일</h3>
		</div>
		<div class="domain">
			<input class="date" id="end_time" type="text" name="end_time" placeholder="">
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
		</div>		
	</form>
		<button class="insert" type="button" id= "save">저장</button>
		<!-- <button class="insert" type="button" onclick="schedule_insert();">저장</button> -->
		
	</div>
</div>
</body>

</html>