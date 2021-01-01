<%@page import="com.entities.User"%>
<%
	User user1 = (User) session.getAttribute("current-user");
%>

<div class="container-fluid custom-bg">
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-dark ">
			<a class="navbar-brand" href="index.jsp">ShopCart</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="index.jsp"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> Categories </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>

				</ul>


				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active "
						aria-current="page" data-bs-toggle="modal"
						data-bs-target="#cartModal"><i class="fa fa-cart-plus"><span
								class="cart-items" style="font-size: 13px;"> ( 0 )</span></i></a></li>

					<%
						if (user1 == null) {
					%>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="login.jsp">Login</a></li>


					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="register.jsp">Register</a></li>
					<%
						} else if (user1.getuType().equals("admin")) {
					%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="admin.jsp"><%=user1.getuName()%></a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="LogoutServlet">Logout</a></li>
					<%
						}

					else {
					%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp"><%=user1.getuName()%></a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="LogoutServlet">Logout</a></li>
					<%
						}
					%>
				</ul>

			</div>



		</nav>
	</div>
</div>
<%@include file="common_modals.jsp"%>