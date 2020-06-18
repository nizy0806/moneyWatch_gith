<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>금융 SenseUp Page</title>
<script>
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
	
	function detail(num){
		var detail = "#detail"+num;
		$.ajax({
			type: "POST",
			url: "senseDetail.mw",
			data : {num: num},
			success: function(data){
				$(detail).html(data);
			}
		});
	}
</script>

</head>
<body>
	<h1>금융 SenseUp!!</h1> <!-- a태그넣기  -->
	<div>
		<table>
			<!-- 카테고리 리스트 -->
			<c:forEach var="category" items="${ category }">
			<tr>			
				<td align = center onclick="category(${ category.num })">
					${ category.sense_detail_category }
				</td>
			</tr>
			</c:forEach>
		</table>

	</div>
	<div>
		<h2>오늘의 영상</h2>
		<div>
			<iframe width="850" height="478" src="https://www.youtube.com/embed/Fm5iP0S1z9w" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			<b>${ video.sense_url }</b>
		</div>
		
		<h2>SenseUp List</h2>
		
		<div id="mainList">
			<table>
				<!-- 첫 페이지일 경우 : category=null -->
				<c:forEach items="${ list }" var="list">
					<tr>
						<td><img src="" alt="Page Not Found" width="100" height="110" name="default_image"/></td>
						<td>${ list.sense_thumbnail }</td> <!-- 썸네일이미지> --> 
						<td align = center onclick="detail(${ list.num })">${ list.sense_title }</td>
<%-- 						<td>${ list.sense_content }</td> <!-- 내용 -->  --%>
					</tr>

				</c:forEach>
			</table>
	
		</div>
	
	
	</div>
	

</body>
</html>