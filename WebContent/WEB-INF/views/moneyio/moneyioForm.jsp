<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입출력 내역 기입하기</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css" >
</head>
<body>
<h1>OOO님 안녕하세요!</h1>
  
<form action="/moneyioPro.mw" method="post">

<table border="1" align ="center" width="60%">

  <fieldset>
 
    <tr>
    <div class="form-group">
       <td><label for="exampleSelect1">&nbsp&nbsp&nbsp&nbsp카테고리</label></td>
      <td><select class="form-control" id="exampleSelect1">
      	<option value="none">--선택--</option>
      	<option value="카페/간식">카페/간식</option>
      	<option value="교통비">교통비</option>
        <option value="생활비">생활비</option>
        <option value="교육">교육</option>
        <option value="쇼핑">쇼핑</option>
        <option>유흥비</option>
        <option>n빵비</option>
        <option>식비</option>
        <option>미용</option>
        <option>교육</option>
        <option>급여</option>
        <option>의료/건강</option>
        <option>주거/통신</option>
        <option>취미/여가</option>
        <option>여행</option>
        <option>용돈</option>
        <option>국가장학금</option>
        <option>보험/세금</option>
        <option>기부/후원</option>
        <option>저축/투자</option>
        <option>국비지원 교육비</option>
        <option>예금이자</option>
        <option>기타</option>
      </select>
      </td>
      <td><label for="exampleInputEmail1">&nbsp&nbsp&nbsp&nbsp수입/지출 선택</label></td>
      <td>
    <div class="custom-control custom-radio">
      <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" checked="">
      &nbsp&nbsp<label class="custom-control-label" for="customRadio1">&nbsp&nbsp수입</label>
    </div></td>
    <td>
    <div class="custom-control custom-radio">
      <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
      &nbsp&nbsp<label class="custom-control-label" for="customRadio2">&nbsp&nbsp지출</label>
    </div></td>

   
    </tr>
     <tr>
    <div class="form-group">
      <td><label for="exampleInputPassword1">&nbsp&nbsp&nbsp&nbsp거래 금액</label></td>
      <td><input type="text" class="form-control" id="exampleInputPassword1" placeholder="won"></td>
     <td><label for="exampleInputPassword1">&nbsp&nbsp&nbsp&nbsp거래 잔액</label></td>
      <td colspan="2"><input type="text" class="form-control" id="exampleInputPassword1" placeholder="won"></td>
    </div>
    </tr>
    <tr>
    <div class="form-group">
      <td><label for="exampleTextarea">&nbsp&nbsp&nbsp&nbsp세부내역</label></td>
      <td colspan="2"><textarea class="form-control" id="exampleTextarea" rows="3"></textarea></td>
      <td><label for="exampleSelect1">&nbsp&nbsp&nbsp&nbsp날짜</label>
     <input type="date" class="form-control" ></td>
      <td><div class="custom-control custom-switch">
      <input type="checkbox" class="custom-control-input" id="customSwitch1" >
      &nbsp&nbsp&nbsp&nbsp<label class="custom-control-label" for="customSwitch1">&nbsp&nbspN빵 Check</label>
    </div></td>
    </div>
    </tr>
    <tr>
    <tr>
    <div class="form-group">
      <td><label for="exampleSelect1">&nbsp&nbsp&nbsp&nbsp대상(은행/카드)</label></td>
      <td><select class="form-control" id="exampleSelect1">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
      </td>
      <td><label for="exampleSelect1">&nbsp&nbsp&nbsp&nbsp거래번호(계좌/카드번호)</label></td>
      <td><select class="form-control" id="exampleSelect1">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
      </td>
        <td><center><button style="" type="submit" class="btn btn-primary">&nbsp&nbspSubmit&nbsp&nbsp</button></center></td>
    </div>
    </tr>
  </fieldset>

  </table>
</form>
</body>
</html>