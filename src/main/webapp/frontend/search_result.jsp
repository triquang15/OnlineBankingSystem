<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<title>Results for ${keyword} - E-Banking</title>
</head>
<body>
	<!-- header -->
		<jsp:directive.include file="header.jsp" />
	<!-- //header -->  
	<br>
	<div class="center">
		<c:if test="${fn:length(result) == 0}">
			<h4 align="center">No Results for "${keyword}"</h4>
		</c:if>
		<c:if test="${fn:length(result) > 0}">
		
			<div>
				<center><h4>Results for "${keyword}":</h4></center>
				<c:forEach items="${result}" var="transaction">
					<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Username</th>
					<th scope="col">TransMoney</th>
					<th scope="col">TransType</th>
					<th scope="col">DateOfTrans</th>
				
				</tr>
				
			</thead>
			<tbody>
				<tr>
					<td>${transaction.transId}</td>
					<td>${transaction.account.username}</td>
					<td>${transaction.transMoney}</td>
					<td>${transaction.transType}</td>
					<td><fmt:formatDate pattern='MM/dd/yyyy' value='${transaction.dateOfTrans}' /></td>
				</tr>
			</tbody>
		</table>
				</c:forEach>
			</div>
		</c:if>
	</div>
	
	<br>
	<!--footer-->
	<jsp:directive.include file="footer.jsp" />
<!--//footer-->	

</body>
</html>