<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link href="css/font-awesome.css" rel="stylesheet">
<!-- font-awesome icons -->
<!-- //Custom Theme files -->
<!-- js -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Secular+One"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- //web-fonts -->
<meta charset="ISO-8859-1">
<title>Online Banking</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<br />
		<h2>
			<c:if test="${transaction != null}">
				Edit Transaction
			</c:if>
			<c:if test="${transaction == null}">
				Create New Transaction
			</c:if>
		</h2>
		<br />
		
		<p>${result }</p>
		
		<c:if test="${transaction != null}">
			<form action="update_transaction" method="post" id="transactionForm">
				<input type="hidden" name="transId" value="${transaction.transId}">
		</c:if>
		<c:if test="${transaction == null}">
			<form action="create_transaction" method="post" id="transactionForm">

		</c:if>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">Username</th>
					<th scope="col">TransMoney</th>
					<th scope="col">TransType</th>
					<th scope="col">DateOfTrans</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><select name=account>
							<c:forEach items="${listAccount }" var="account">
								<option value="${account.accId }">
									${account.username }</option>
							</c:forEach>
					</select></td>
					<td><input type="text" id="transMoney" name="transMoney"
						value="${transaction.transMoney}" /></td>
					<td><select class="form-control form-control-lg" name="transType" id="transType" >					
						  		<option value="1">Deposits</option>
						  		<option value="2">Withdraw Money</option>					 
						</select></td>
					<td>
						<td><input type="text" id="dateOfTrans" name="dateOfTrans"
					value="<fmt:formatDate pattern='MM/dd/yyyy' value='${transaction.dateOfTrans}' />" /></td>
					<td>
						<button type="submit" class="btn btn-primary">Save</button>&nbsp;&nbsp;
						<button class="btn btn-danger" id="buttonCancel">Cancel</button>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />

</body>
<script type="text/javascript">
$(document).ready(function() {

	$('#dateOfTrans').datepicker();
	
	$("#transactionForm").validate({
		rules: {	
			transMoney: "required",
			dateOfTrans: "required"
		},
		
		messages: {
			dateOfTrans: "Please enter dateOfTrans of the transaction",
			transMoney: "Please select transMoney of the transaction"
		}
	});
	
	
	$("#buttonCancel").click(function() {
		history.go(-1);
	});	
});
</script>
</html>