var id = $('#id'); 
var title = $('#title');
var place = $('#place');
var start_time = $('#start_time');
var end_time = $('#end_time');
var memo = $('#memo');



//새로운 일정 저장버튼 클릭
$('#save').on('click', function schedule_insert(){
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
    	
        
    )
