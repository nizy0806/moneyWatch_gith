<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 캘린더 페이지 -->

<html>
<head>
	<link rel="stylesheet" href='css/fullcalendar/fullcalendar.css'/>
	<link rel="stylesheet" href='css/fullcalendar/daygrid.css'/>
	<link rel="stylesheet" href='css/fullcalendar/timegrid.css'/>


<script src='js/fullcalendar/fullcalendar.js'></script>
<script src='js/fullcalendar/daygrid.js'></script>
<script src='js/fullcalendar/timegrid.js'></script>
<script src='js/fullcalendar/interaction.js'></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
  		var calendarEl = document.getElementById('calendar');
  
 		var calendar = new FullCalendar.Calendar(calendarEl, {
   	 		plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
    		defaultView: 'dayGridMonth',
    		defaultDate: new Date(),
    		
    		header: { // 캘린더 헤더목록
      		left: 'prev,next today',
      		center: 'title',
      		right: 'dayGridMonth,timeGridWeek,timeGridDay'
    	}, 
  });
  calendar.render();
});
</script>

</head>

<body>
<div id='calendar' style="width:800px"></div>
</body>
</html>