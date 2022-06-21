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
<title>Login - Online Banking</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
	<!-- contact -->
	<div class="w3ls-section contact">
		<div class="container"> 
			<div class="w3ls-title">
				<h2 class="h3-w3l">Sign in Online Banking</h2> 
				
			</div>  

			<div class="contact_wthreerow agileits-w3layouts">
				<div class="col-md-5 agileits_w3layouts_contact_gridl">
					<div class="agileits_mail_grid_right_grid">
						
						<p>Itaque earum rerum hic tenetur a sapiente delectus, 
							ut aut reiciendis voluptatibus maiores alias consequatur.</p>
					</div> 
					<div class="agileits_mail_grid_right_grid">
						<h4>Sign in as IAM user</h4>
	
						<ul class="contact_info">
							<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>1234k Avenue, 4th block,3FB,New Jersey.</li>
							<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">info@example.com</a></li>
							<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 567</li>
						</ul>
					</div>
				</div>
				<div class="col-md-7 w3l_contact_form">
					<h4>Sign in</h4> 
			<c:if test="${message != null}">
			<div align="center">
				<h5 class="message">${message}</h5>
			</div>
		</c:if>
					<form id="loginForm" action="login" name="loginForm" method="post">
  <!-- Email input -->
  <div class="form-outline mb-4">
    <input type="email" name="email" id="email" class="form-control" placeholder="Email" /> 
  </div>

  <!-- Password input -->
  <div class="form-outline mb-4">
    <input type="password" name="password" id="password" class="form-control" placeholder="Password" />
   
  </div>

	<br>
  <!-- Submit button -->
  <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>
</form>
				</div>
				
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //contact --> 
		<jsp:directive.include file="footer.jsp" />
		
<script type="text/javascript">

$(document).ready(function() {
	$("#loginForm").validate({
		rules: {
			email: {
				required: true,
				email: true
			},
	
			password: "required",
		},
		
		messages: {
			email: {
				required: "Please enter email",
				email: "Please enter an valid email address"
			},
			
			password: "Please enter password"
		}
	});

});
</script>	
	
</body>
</html>