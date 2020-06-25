<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

   var dataset = [
	<c:forEach var="listview" items="${listview}" varStatus="status">
	    <c:if test="${listview.start_time != ''}">
	        {"id":'<c:out value="${listview.id}" />'
	        ,"url":'day_detail.mw?id='+'<c:out value="${listview.id}"/>'+'&title='+'<c:out value="${listview.title}" />'+'&start_time='+'<c:out value="${listview.start_time}" />'
	        ,"title":'<c:out value="${listview.title}" />'
	        ,"start":'<c:out value="${listview.start_time}" />'
	        <c:if test="${listview.end_time != ''}">
	            ,"end":'<c:out value="${listview.end_time}" />'
	            ,"color":'<c:out value="${listview.sc_color}" />'
	        </c:if>
	        },
	    </c:if>
	</c:forEach>
	
		<c:forEach var="olist" items="${olist}" varStatus="status">
	    {"id":'<c:out value="${olist.id}" />'
	    ,"url":'out_detail.mw?io_reg_date='+'<c:out value="${olist.io_reg_date}" />'
	    ,"title":'<fmt:formatNumber value="${olist.io_price}" pattern="#,###"/>'
	    ,"start":'<c:out value="${olist.io_reg_date}" />'
	    ,"color":'#FF9696'
	    },
	
	</c:forEach> 
	
	<c:forEach var="ilist" items="${ilist}" varStatus="status">
    {"id":'<c:out value="${ilist.id}" />'
    ,"url":'in_detail.mw?io_reg_date='+'<c:out value="${ilist.io_reg_date}" />'
    ,"title":'<fmt:formatNumber value="${ilist.io_price}" pattern="#,###"/>'
    ,"start":'<c:out value="${ilist.io_reg_date}" />'
    ,"color":'#91D8FA'
    }<c:if test="${!status.last}">,</c:if>

	</c:forEach> 
 ];
  
  document.addEventListener('DOMContentLoaded', function() {
	  
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listMonth'
      },
      defaultDate: new Date(),
      locale : "ko",
      selectable: true,
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      //editable: true,
    
      //날짜 클릭 시 팝업창 오픈
      dateClick: function(info){
    	  
    	  let str2arr = info.dateStr.split("-");
    	  let s_date_obj = new Date(str2arr[0], str2arr[1] - 1, str2arr[2]);

    	  let s_year = s_date_obj.getFullYear(); // 선택된날짜 연도
    	  let s_month = s_date_obj.getMonth() + 1; // 선택된날짜 월
    	  let s_date = s_date_obj.getDate(); // 선택된날짜 일
    	 
    	  if(s_month < 10) s_month = '0' + s_month;
    	  if(s_date < 10) s_date = '0' + s_date;
    	  
    	  var url = "C_popUp.mw?year="+s_year+"&month="+s_month+"&date="+s_date;
          var name = "C_insert";
          var option = "width = 500, height = 500, top = 100, left = 200, location = no";
    	  window.open(url,name,option);
      },
      
    events : dataset,
    eventClick:function(info) {
    	
    	info.jsEvent.preventDefault();
    	
    	var name = "aaa";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no";
    	window.open(info.event.url,name,option);
		
       return false;
        
    }
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

</html>