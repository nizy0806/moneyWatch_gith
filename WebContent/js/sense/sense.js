	
	//sense main에서 카테고리 클릭시 해당 카테고리 리스트 출력
	function category(num){
		
		$.ajax({
			
			type: "POST",
			url: "senseSelect.mw",
			data : {num: num},
			success: function(data){
				$("#mainList").html(data);
				
			}		
		})
	}
	
	//sense main에서 리스트 클릭시 디테일 페이지 호출
	function detail(num){
		
		var detail = "#detail"+num;
		
		$.ajax({
			
			type: "POST",
			url: "senseDetail.mw",
			data : {num: num},
			success: function(data){
				$(detail).html(data); //리스트 변경			
				
			}
		});
		
		$.ajax({
			
			type: "POST",
			url: "senseDetailVideo.mw",
			data : {num: num},
			success: function(data){
				$("#video_url").html(data); //영상변경을 위한 url 호출
				
			}
		});
		
		$.ajax({
			
			type: "POST",
			url: "senseReadcount.mw",
			data: {num: num},
			success: function(data){
				$("#readcount").html(data); //조회수 변경
			}
			
		});
		
	}
	
	//sense detail에서 삭제 버튼 선택시 작동
	function senseDelete(num){
		
		var password = prompt("비밀번호를 입력하세요.","");
		
		$.ajax({
			
			type: "POST",
			url: "senseDeletePro.mw",
			data: password, num,
			success: function(data){
				html(data);
			}
		});
	}