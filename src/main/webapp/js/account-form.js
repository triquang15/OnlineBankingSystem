	$(document).ready(function() {
		$("#accountForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				fullname: "required",
				username: "required",
				password: "required",
				
				confirmPassword: {
					required: true,
					equalTo: "#password"
				},
				
				phone: "required",								
				balance: "required",
	
			},
			
			messages: {
				email: {
					required: "Please enter e-mail address",
					email: "Please enter a valid e-mail address"
				},
				
				fullname: "Please enter full name",
				username: "Please enter last name",
				password: "Please enter password",
				
				confirmPassword: {
					required: "Please confirm password",
					equalTo: "Confirm password does not match password"
				},
				
				phone: "Please enter phone number",								
				balance: "Please enter balance",
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});