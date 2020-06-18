<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Chatting</title>
<script src="/moneyWatch/js/jquery-1.10.2.min.js"></script>
<script src="/moneyWatch/js/socket.io.js"></script>
<script>
	$(document).ready(function() { // 계속 실행
		var socket = io.connect("http://192.168.44.1:12345");  //서버연결
		
		$('#msgs').append('<table width="100%"><tr><td bgcolor="yellowgreen" align="left" style="width:300px">'
						+ '안녕하세요. 무엇이 궁금하신가요?'
						+ '</td><td style="width:1000px"></td></tr><tr><td></td></tr></table>');
		
		$("#chat").focus();
		
		
		socket.on('response', function(msg){// 서버로부터 채팅메세지를 계속 받고있다. .. 

			$('#msgs').append('<table width="100%"><tr><td style="width:1000px"></td><td bgcolor="yellow" align="right" style="width:300px">' + msg.msg
							+ '</td></tr><tr><td></td></tr></table>');

			$('#msgs').append('<table width="100%"><tr><td bgcolor="yellowgreen" align="left" style="width:300px">' + msg.adminRe
					+ '</td><td style="width:1000px"></td></tr><tr><td></td></tr></table>');

		
		
			$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
			
			
			
			
			
			
			
/* 			
			if(msg.toUser == ""){ // 귓속말 사용안할 때
				if(msg.targetMsg == "toAll"){ // 모든 사람에게
					if('${sessionScope.memId}' == msg.id){ // 자기 자신이 쓴 글
						$('#msgs').append('<tr><td align="right" style="width:1300px">'+"<< 모든 사람에게 >> " + msg.msg+'</td></tr>');		// 채팅 메세지 받아 출력 부분..
						$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
					}else{ // 다른 사람이 쓴 글
						$('#msgs').append('<tr><td>'+"<< 모든 사람에게 >> " + msg.msg+'</td></tr>');
						$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
					}
				}
				if(msg.targetMsg == "toAdmin" && ('${sessionScope.memId}' == "admin" || '${sessionScope.memId}' == msg.id)){
					// 관리자에게 쓰는 글 (관리자와 본인에게 글 출력)
					if('${sessionScope.memId}' == msg.id){ // 자기 자신이 쓴 글
						$('#msgs').append('<tr><td align="right" style="width:1300px">'+"<< 관리자에게 >> " + msg.msg+'</td></tr>');
						$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
					}else{ // 다른 사람이 쓴 글 (관리자에게)
						$('#msgs').append('<tr><td>'+"<< 관리자에게 >> " + msg.msg+'</td></tr>');
						$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
					}
				}
			}else{ // 귓속말 사용
				if('${sessionScope.memId}' == msg.toUser){ // 클라이언트가 귓속말 받는 유저일 때
					$('#msgs').append('<tr><td>'+"## " + msg.toUser + " 에게## " + msg.msg+'</td></tr>');
					$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
				}else if('${sessionScope.memId}' == msg.id){ // 귓속말 보내는 유저
					$('#msgs').append('<tr><td align="right" style="width:1300px">'+"## " + msg.toUser + " 에게## " + msg.msg+'</td></tr>');
					$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
				}else{ // 그외 출력 X
					
				} 
			}
 */			
		
		
		
		
		
		
		});
		
		// 텍스트박스내부의 채팅 내용 보내기
		$("#sendBtn").bind("click", function() {	// bind() : 이벤트 추가동작("click" : 클릭했을 때 메소드 실행)		
			var msg = $("#chat").val();
			socket.emit('msg', {msg:msg});
		
/* 		
			var msg = "[ " + '${id}' + " ] : " + $("#chat").val();
			//var msg = $("input[name=chat]").val();
			socket.emit('msg', {msg:msg, targetMsg:$("select[name=targetMsg]").val(), 
								id:'${id}', toUser:$("input[name=toUser]").val()
								}
					);
			
 */			
			
			
			$("#chat").focus();
			$("#chat").val('');
			//socket.emit('msg', {msg:msg});	// {key(파라미터명):value(채팅내용)}
					// 채팅 내용을 소켓에 보내기 (VertxSample.java의 socket.on("msg",)으로)
		});
			
			
	});

</script>
</head>
<body align="center">
	
	<h1>Chatting Room</h1>
	<button onclick="window.location='/moneyWatch/main.mw'">메인으로</button>	
	
	<br /><hr /><br />
	
	
	<!-- 채팅박스 -->
		
	<div id="chatScroll" style="width:40%; height:600px; overflow:auto; border:1px solid; margin: 0 30% 0 30%;" >
		<table id="msgs" width="100%" cellspacing="0" cellpadding="0"	>
			<!-- <tr><td></td></tr>
			<span id="msgs" style="width:500px"></span>
			<tr><td></td></tr> -->
		</table>
	</div>
	
	<div style="width:100%; margin: 0 0 0 5%">
	<br />
		<input type="text" id="chat" size="40" tabindex="2 placeholder="채팅내용 작성 (Tab키 입력)" />
		
		<input type="button" value="send" id="sendBtn" tabindex="3" /><br />
	</div>
	

	<br /><br />	

</body>
</html>