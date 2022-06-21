<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="headerw3-agile"> 
		<div class="header-w3mdl"><!-- header-two --> 
			<div class="container"> 
				<div class="agileits-logo navbar-left">
					<h1><a href="${pageContext.request.contextPath}/"><img src="images/e.png" alt="logo"/>Banking</a></h1> 
				</div> 
				<div class="agileits-hdright nav navbar-nav">
					<div class="header-w3top"><!-- header-top --> 
						<ul class="w3l-nav-top">
							<li><i class="fa fa-phone"></i><span> +01 222 111 444 </span></li> 
							<li><a href="mailto:example@mail.com"><i class="fa fa-envelope-o"></i><span>mail@example.com</span></a></li>
						</ul>
						<div class="clearfix"> </div> 	 
					</div>
					<div class="agile_social_banner">
						<ul class="agileits_social_list">
							<li><a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
							<li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
						</ul>
					</div>  

				</div>
				<div class="clearfix"> </div> 
			</div>	
		</div>	
	</div>	
	
		<!-- banner -->
	<div class="banner">
		<div class="header-nav"><!-- header-three --> 	
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						Menu 
					</button> 
				</div>
				<!-- top-nav -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath}/" class="active">Home</a></li>   
						<li><a href="new_transaction" class="scroll">Transaction</a></li>   
						
						<c:if test="${loggedAccount == null}"> 
							<li><a href="login" class="scroll">Sign In</a></li>
							<li><a href="register" class="scroll">Sign Up</a></li>
						</c:if>
						
						<c:if test="${loggedAccount != null}"> 			
							<li><a href="list_transaction" class="scroll">Transaction history</a></li>
							<li><a href="view_profile" class="scroll">Welcome, ${loggedAccount.fullname}</a></li>
							<li><a href="logout" class="scroll">Logout</a></li>
						</c:if>
						
						
					</ul>  
					<div class="clearfix"> </div>	
				</div>
			</nav>    
		</div>
	<!-- banner-text -->
		<!-- banner -->
	</div>