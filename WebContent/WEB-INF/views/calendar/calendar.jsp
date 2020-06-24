<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='packages/core/main.css' rel='stylesheet' />
<link href='packages/daygrid/main.css' rel='stylesheet' />
<link href='packages/timegrid/main.css' rel='stylesheet' />
<link href='packages/list/main.css' rel='stylesheet' />
<script src='packages/core/main.js'></script>
<script src='packages/interaction/main.js'></script>
<script src='packages/daygrid/main.js'></script>
<script src='packages/timegrid/main.js'></script>
<script src='packages/list/main.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      defaultDate: new Date(),
      locale : "ko",
      selectable: true,
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
    
      //날짜 클릭 시 팝업창 오픈
     dateClick: function(info){
          var url = "C_popUp.mw";
          var name = "C_insert";
          var option = "width = 500, height = 500, top = 100, left = 200, location = no";
    	 
          window.open(url,name,option);
      }
      
      /* events: [
        {
          title: 'Business Lunch',
          start: '2020-05-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2020-05-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2020-05-18',
          end: '2020-05-20'
        },
        {
          title: 'Party',
          start: '2020-05-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2020-05-11T10:00:00',
          end: '2020-05-11T16:00:00',
          rendering: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2020-05-13T10:00:00',
          end: '2020-05-13T16:00:00',
          rendering: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2020-05-24',
          end: '2020-05-28',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        },
        {
          start: '2020-05-06',
          end: '2020-05-08',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        }
      ] */
    });

    calendar.render();
  });

</script>

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>


<%-- <!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link href='packages/core/main.css' rel='stylesheet' />
<link href='packages/daygrid/main.css' rel='stylesheet' />
<link href='packages/timegrid/main.css' rel='stylesheet' />
<link href='packages/list/main.css' rel='stylesheet' />
<script src='packages/core/main.js'></script>
<script src='packages/interaction/main.js'></script>
<script src='packages/daygrid/main.js'></script>
<script src='packages/timegrid/main.js'></script>
<script src='packages/list/main.js'></script>

<script>


<% List<MwScheduleDTO> list = (ArrayList<MwScheduleDTO>)request.getAttribute("showSchedule"); %>
  document.addEventListener('DOMContentLoaded', function() {
	
	var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      defaultDate: new Date(),
      locale : "ko",
      selectable: true,
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
    
      //날짜 클릭 시 팝업창 오픈
     dateClick: function(info){
    	  //var moment = $('.callender_area').fullCalendar('getDate');
          var url = "C_popUp.mw";
          var name = "C_insert";
          var option = "width = 500, height = 500, top = 100, left = 200, location = no";
    	 
          window.open(url,name,option);
      }
    
    });
    calendar.render();
  });
 --%>
<!--  events:function(start,end,callback){
    	$.ajax({
    		type : 'get',
    		url : 'eventAll.mw',
    		dataType : 'json',
    		success : function(map){
    			//var events = [];
    			//var keys = Object.keys(map);
    			
    			//$.each(map,function(){
    			//	events.push({
	
    					//for(var i in keys){
    						 title: 'Business Lunch',
          					start: '2020-05-03T13:00:00',
          					constraint: 'businessHours'
    					//}
    					
    	    			//start:map.get(i).getStart_time();
	                                                               
    					//end:$(this).attr('end_time')
    		//		});
    		//		console.log(plan);
    		//		callback(events);
    		//	});	
    		}
    	});
    }
   });
    calendar.render();
  });
    
     /*  eventSources:[
    	  {
    	  $.ajax({
              type: "get", 
              url: "Calendar.mw", // 클라이언트가 요청 보낼 서버의 url주소
              datyType: "JSON",
              success: function (data) {
              	console.log(data);
              },
              error: function(){
            	  alert("ajax error");
              }),
              
    	  title: 
    	  start:
    	  end:
    	  place:
    	  memo: */
            
     /* events: [
        {
          title: 'Business Lunch',
          start: '2020-05-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2020-05-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2020-05-18',
          end: '2020-05-20'
        },
        {
          title: 'Party',
          start: '2020-05-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2020-05-11T10:00:00',
          end: '2020-05-11T16:00:00',
          rendering: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2020-05-13T10:00:00',
          end: '2020-05-13T16:00:00',
          rendering: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2020-05-24',
          end: '2020-05-28',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        },
        {
          start: '2020-05-06',
          end: '2020-05-08',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        }
      ] -->
</script> 
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  
  .add-button {
  	position : absolute;
  	top : 1px;
  	right : 230px;
  	background : #2C#E50;
  	border:0;
  	color : white;
  	hight : 35px;
  	border-radius:3px;
  	width:157px;
  
  }

</style>
</head>
<body>
<div id=result></div>
  <div id='calendar' style="position : relative">
  	<!-- <div>
  		<button class="add-button" type="button"
  		onclick="click_add();">일정추가</button>
  	</div> -->
  </div>

</body>
</html>




<!-- <html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="image/favicon.ico">

    <link rel="stylesheet" href="vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='vendor/css/select2.min.css' />
    <link rel="stylesheet" href='vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="css/fullcalendar/main.css">
        

</head>

<body>
    <div class="container">

        일자 클릭시 메뉴오픈
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">일정등록</a></li>
                <li><a tabindex="-1" href="#">입/출금</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        일정 추가 MODAL
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-id">회원ID</label>
                                <input class="inputId" type="hidden" name="edit-id" id="edit-id"
                                    required="required" />
                            </div>
                        </div>
                        			
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-place">장소	</label>
                                <input class="inputPlace" type="text" name="edit-place" id="edit-place"/>
                            </div>
                        </div>     
                                           
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작일</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">종료일</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-memo">메모</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-memo"
                                    id="edit-memo"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div>/.modal-content
            </div>/.modal-dialog
        </div>/.modal

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

           <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="카테고리1">카테고리1</option>
                            <option value="카테고리2">카테고리2</option>
                            <option value="카테고리3">카테고리3</option>
                            <option value="카테고리4">카테고리4</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkb
                        ox" value="정연"
                                checked>정연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>다현</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>사나</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>나연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>지효</label>
                    </div>
                </div>

            </div>
        </div>
        /.filter panel
    </div>
    /.container

    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>
    <script src="vendor/js/moment.min.js"></script>
    <script src="vendor/js/fullcalendar.min.js"></script>
    <script src="vendor/js/ko.js"></script>
    <script src="vendor/js/select2.min.js"></script>
    <script src="vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/fullcalendar/main.js"></script>
    <script src="js/fullcalendar/addEvent.js"></script>
    <script src="js/fullcalendar/editEvent.js"></script>
    <script src="js/fullcalendar/etcSetting.js"></script>
</body>

</html> -->