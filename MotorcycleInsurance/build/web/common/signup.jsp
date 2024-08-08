
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Sign up</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- LINEARICONS -->
		<link rel="stylesheet" href="fonts/linearicons/style.css">
		
		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/style_1.css">
	</head>

	<body>

		<div class="wrapper">
			<div class="inner">
				<img src="images/image-1.png" alt="" class="image-1">
                                <form action="signup" method="post">
					<h3>New Account</h3>
					<div class="form-holder">
						<span class="lnr lnr-user"></span>
                                                <input type="text" class="form-control" placeholder="Username(6-30 characters)" name="name" value="${name}">
					</div>
					<div class="form-holder">
						<span class="lnr lnr-phone-handset"></span>
                                                <input type="text" class="form-control" placeholder="Phone Number(Has 10 digits)" name="phone" value="${phone}">
					</div>
                                        <div class="form-holder">
						<span class="lnr lnr-envelope"></span>
                                                <input type="text" class="form-control" placeholder="Full name" name="fname" value="${fname}">
					</div>
                                        <div class="form-holder">
						<span class="lnr lnr-envelope"></span>
                                                <input type="text" class="form-control" placeholder="Address" name="address" value="${address}">
					</div>
					<div class="form-holder">
						<span class="lnr lnr-envelope"></span>
                                                <input type="text" class="form-control" placeholder="Email( ***@gmail.com)" name="email" value="${email}">
					</div>
					<div class="form-holder">
						<span class="lnr lnr-lock"></span>
                                                <input type="password" class="form-control" placeholder="Password(6-30 characters)" name="pass" value="${pass}">
					</div>
					<div class="form-holder">
						<span class="lnr lnr-lock"></span>
                                                <input type="password" class="form-control" placeholder="Confirm Password(6-30 characters)" name="repass" value="${repass}">
					</div>
                                        <div style="color: red">${f}</div>
                                        
					<button>
						<span>Register</span>
					</button>
                                        <label>
                                            <a href="login" style="color: blue">Login?</a>
                                        </label>
				</form>
				<img src="images/image-2.png" alt="" class="image-2">
			</div>
			
		</div>
		
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/main.js"></script>
	</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>