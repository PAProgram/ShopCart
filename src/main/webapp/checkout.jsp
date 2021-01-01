<%
	User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "you are not login! Login first...");
	response.sendRedirect("login.jsp");
} else {
	
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShopCart- Checkout page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="card mt-4">
					<div class="card-head text-center mt-4">
						<h3>Your Selected Items</h3>
					</div>
					<div class="card-body">
						<div class="shop-cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mt-4">
					<div class="card-head text-center mt-4">
						<h3>Your details for order</h3>
					</div>
					<div class="card-body">
						<form action="#">
							<div class="mb-3">
								<label for="uname" class="form-label">User Name</label> <input
									name="uname" type="text" class="form-control" id="uname" value="<%=user.getuName() %>" >
							</div>

							<div class="mb-3">
								<label for="umail" class="form-label">Email address</label> <input
									name="umail" type="email" class="form-control" id="umail"
									aria-describedby="emailHelp" value="<%=user.getuMail()%>">
							</div>

							<div class="mb-3">
								<label for="uphone" class="form-label">Phone</label> <input
									name="uphone" type="number" class="form-control" id="uphone" value="<%=user.getuPhone()%>">
							</div>
							<div class="mb-3">
								<label for="uaddr" class="form-label">Address</label>
								<textarea name="uaddr" class="form-control" id="uaddr"
									style="height: 100px;" value="<%=user.getuAddress()%>"></textarea>
							</div>

							<div class="container text-center mt-2">
								<button type="submit" class="btn btn-primary">Order Now</button>
								<button type="reset" class="btn btn-primary">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>