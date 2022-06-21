<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link href="css/font-awesome.css" rel="stylesheet">
<!-- font-awesome icons -->
<!-- //Custom Theme files -->
<!-- js -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
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
<title>Account Profile - Online Banking</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<br />
		<h2>Account Information</h2>
		<br />
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Username</th>
					<th scope="col">Email</th>			
					<th scope="col">Full Name</th>
					<th scope="col">Phone</th>
					<th scope="col">Balance</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>${loggedAccount.username}</td>
					<td>${loggedAccount.email}</td>				
					<td>${loggedAccount.fullname}</td>
					<td>${loggedAccount.phone}</td>
					<td>${loggedAccount.balance}</td>
					<td><b><a href="edit_profile">Edit My Profile</a></b></td>
					
				</tr>
			
				
			</tbody>
		</table>
	</div>

	<jsp:directive.include file="footer.jsp" />


</body>
</html>