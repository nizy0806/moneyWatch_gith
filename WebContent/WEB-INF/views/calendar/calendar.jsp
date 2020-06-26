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
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>

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
  
   // 날짜 포맷 yyyy-mm-dd
   function formatDate(date) { 
  		var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
  		if (month.length < 2) month = '0' + month; if (day.length < 2) day = '0' + day; 
  		return [year, month, day].join('-'); 
  	}
   
  document.addEventListener('DOMContentLoaded', function() {
	
	var modal = document.getElementById('myModal');
  	var span = document.getElementsByClassName("close")[0];   

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
    	  let s_day = s_date_obj.getDate(); // 선택된날짜 일
    	 
    	  if(s_month < 10) s_month = '0' + s_month;
    	  if(s_day < 10) s_day = '0' + s_day;
    	  
    	  /* var url = "C_popUp.mw?year="+s_year+"&month="+s_month+"&date="+s_day;
          var name = "C_insert";
          var option = "width = 500, height = 500, top = 100, left = 200, location = no";
    	  window.open(url,name,option); */
    	  
    	  $.ajax({
	    		type : "post", //송신 데이터타입
	    		url : "day_popUp.mw",
	    		data : {year:s_year, month:s_month, day:s_day},
	    		success : function(data){
	    			$("#content").html(data);
	    		}
	    	});
    	  
    	  modal.style.display = "block"; 
    	  
      },
      
    events : dataset,
    // 레이어팝업으로 만들기
    eventClick:function(info) {
    
    	info.jsEvent.preventDefault();
    	
    	var title = info.event.title;
    	var start_time = formatDate(info.event.start);
    	var url = info.event.url;
    
    	
    	if(url.indexOf('day') != -1){ // 세부일정
	    	$.ajax({
	    		type : "post", //송신 데이터타입
	    		url : "day_detail.mw",
	    		data : {title:title, start_time:start_time},
	    		success : function(data){
	    			$("#content").html(data);
	    		}
	    	});
    	}
    	
    	if(url.indexOf('out') != -1){ // 지출세부일정
	    	$.ajax({
	    		type : "post", //송신 데이터타입
	    		url : "out_detail.mw",
	    		data : {title:title, start_time:start_time},
	    		//dataType : "JSON", //수신 데이터타입
	    		success : function(data){
	    			//modal.style.display = "block"; 
	    			$("#content").html(data);
	    		}
	    	});
    	}
    	
    	if(url.indexOf('in') != -1){ // 수입세부일정
	    	$.ajax({
	    		type : "post", //송신 데이터타입
	    		url : "in_detail.mw",
	    		data : {title:title, start_time:start_time},
	    		success : function(data){
	    			//modal.style.display = "block"; 
	    			$("#content").html(data);
	    		}
	    	});
    	}
    	modal.style.display = "block";
     
    }
      
   });
    
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
/*     window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    } */

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

	/* The Modal (background) */
   .modal {
     display: none; /* Hidden by default */
     position: fixed; /* Stay in place */
     z-index: 1; /* Sit on top */
     left: 0;
     top: 0;
     width: 100%; /* Full width */
     height: 100%; /* Full height */
     overflow: auto; /* Enable scroll if needed */
     background-color: rgb(0,0,0); /* Fallback color */
     background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
    /* Modal Content/Box */
     .modal-content {
     	background-color: #fefefe;
     	margin:  15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 50%; /* Could be more or less, depending on screen size */                          
     }
     
     /* The Close Button */
      .close {
         color: #aaa;
         float: right;
         font-size: 28px;
         font-weight: bold;
       }
      .close:hover,
      .close:focus {
         color: black;
         text-decoration: none;
         cursor: pointer;
     }

</style>

</head>

<body>

  <div id='calendar'></div>
  
  <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span> 
        <div id="content">
        </div>
                                                                     
      </div>
 
    </div>
</body>
</html>
