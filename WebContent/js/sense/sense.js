	
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
				$(detail).html(data);
				$("#video_url").html(data);
			}
		});
	}
	
	//sense detail에서 수정 버튼 선택시 작동
	function senseModify(num){
		alert(num);
        var url = "senseModify.mw";
        var name = "senseModify";
  	 
        open(url,name,num);
	}
	
	//sense detail에서 삭제 버튼 선택시 작동
	function senseDelete(num){
		$.ajax({
			type: "POST",
			url: "senseDelete.mw",
			data : {num: num},
			success: function(data){
				$(detail).html(data);
				$("#video_url").html(data);
			}
		});
	}