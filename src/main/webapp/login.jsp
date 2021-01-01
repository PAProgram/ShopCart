
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShopCart - Login</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card mt-3">
				<div class="card-header custom-bg text-white">Login Page</div>
				<div class="card-body">
					<%@include file="components/message.jsp" %>
					<form action="LoginServlet" method="post">

						<div class="mb-3">
							<label for="umail" class="form-label">Email address</label> <input
								name="umail" type="email" class="form-control" id="umail"
								aria-describedby="emailHelp">
						</div>
						<div class="mb-3">
							<label for="upass" class="form-label">Password</label> <input
								name="upass" type="password" class="form-control" id="upass">
						</div>
						<div class="text-center">
						<a href="register.jsp">if not registered click here</a>
						</div>
						<div class=" container text-center mt-2">
						<button type="submit" class="btn btn-primary">Login</button>
						<button type="reset" class="btn btn-primary">Reset</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>