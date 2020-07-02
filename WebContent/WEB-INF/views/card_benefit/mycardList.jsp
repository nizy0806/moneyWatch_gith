<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<style>
		ul, li {list-style: none; margin: 0; padding: 0;}
		img {border: 0;}
		img a {border: 0; text-decoration: none;}
		a {border: 0; text-decoration: none;}
		a:link {color: #000; text-decoration: none;}
		a:hover {text-decoration: underline;}
		
		#all{
			width: 100%;
			height: 2300px;
			background-color: #f1f3f5;
			padding: 40px;
		}
		
		#list{
			width: 1240px;
			height: 400px;
			margin-bottom: 50px;
		}
		#list ul{
			width: 270px;
			height: 400px;
			float: left;
			background-color: #fff;
			margin: 0 40px 40px 0;
		}
		#list img{
			width: 270px;
			height: 190px;
			background-color: #ddd;
			float: left;
			margin-bottom: 20px;
		}
		#list li{text-align: center;}
</style>
<br>
<center><h1>나의 카드 목록</h1>
<br>

<div id="list">	
<c:forEach var="mycard" items="${mycard}">
	<ul>
		<li><a href="mycardBenefit.mw?card_name=${mycard.card_name}"><img src="/moneyWatch/image/${mycard.path}"></a></li>
	
		<li>${mycard.card_name}</li>
	</ul>
</c:forEach>
</div>
</center>  