<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N빵 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
  <h2>Modal Example</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">N빵 리스트</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
	    	<div class="form-group">
		    	<label class="control-label">카테고리  [${category}]</label>
		    	<div class="form-group">
		    	<div class="input-group mb-3">
		    	<table>
		    	<c:forEach items="${nlist}" var="n">
		    	<tr>
		 			<td>
				        <div class="input-group-prepend">
				        	<span class="input-group-text">이름</span>
				      	</div>
				      	</td>
				      	<td>
				     
			      	<input type="text" class="form-control" value="${n.n_debtor}"aria-label="Amount (to the nearest dollar)" disabled />
			      	</td>
			      	<td>
				      	<div class="input-group-prepend">
				       	 	<span class="input-group-text">금액</span>
				      	</div></td>
				    <td>
				    	<fmt:setLocale value="ko"/>
				    	<fmt:formatNumber type="text" value="${n.n_price}" pattern="#,###" var="n_price"/>
				      	<input type="text" class="form-control" pattern="#,###" value="${n_price}" aria-label="Amount (to the nearest dollar)" disabled /> 
				    </td>
			    </tr>
			    </c:forEach>
			    <tr>
			    	<td colspan="3"></td>
			    	<th style="text-align:right;">합계 :
			    	
			    		<fmt:setLocale value="ko"/>
			    		<fmt:formatNumber type="text" value="${nSum}" pattern="#,###"/>
			    		 
			    	</th>
			    </tr>
			    </table>
			    </div>
		   		</div>
	  		 </div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
</body>
</html>