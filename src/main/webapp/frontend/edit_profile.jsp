<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/font-awesome.css" rel="stylesheet">   <!-- font-awesome icons --> 
<!-- //Custom Theme files -->  
<!-- js --> 
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Secular+One" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- //web-fonts --> 
<meta charset="ISO-8859-1">
<title>Update Account Profile - Online Banking</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
		<div align="center">
		<br />
		<h2>Update Account Information</h2>
		<br />
		<form action="update_profile" method="post" id="accountForm">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">Username</th>
						<th scope="col">Password</th>
						<th scope="col">Confirm Password</th>
						<th scope="col">Email</th>		
						<th scope="col">Phone</th>	
						<th scope="col">Full Name</th>				
						<th scope="col">Balance</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" id="username" name="username" value="${loggedAccount.username}" /></td>
						<td><input type="password" id="password" name="password" placeholder="********"/></td>
						<td><input type="password" id="confirmPassword" name="confirmPassword" placeholder="********"/></td>
						<td>${loggedAccount.email}</td>
						<td><input type="text" id="phone" name="phone" value="${loggedAccount.phone}" /></td>			
						<td><input type="text" id="fullname" name="fullname" value="${loggedAccount.fullname}" /></td>
						<td><input type="text" id="balance" name="balance" value="${loggedAccount.balance}" /></td>
						<td >
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
		$("#accountForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				username: "required",
				fullname: "required",
				
				confirmPassword: {
					equalTo: "#password"
				},
				
				phone: "required",								

			},
			
			messages: {
				email: {
					required: "Please enter e-mail address",
					email: "Please enter a valid e-mail address"
				},
				
				username: "Please enter username",
				fullname: "Please enter fullname",
				
				confirmPassword: {
					equalTo: "Confirm password does not match password"
				},
				
				phone: "Please enter phone number",								
			
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});	
</script>
</html>