<%@page import="com.dao.UserDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.ItemOperationDao"%>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.User"%>
<%
	User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "you are not login! Login first...");
	response.sendRedirect("login.jsp");
} else {
	if (user.getuType().equals("normal")) {
		session.setAttribute("message", "You are logged in as Normal User! You cannot access Admin Page");
		response.sendRedirect("login.jsp");
	}
}
%>

<%
	ItemOperationDao itemDao = new ItemOperationDao(FactoryProvider.getFactory());
List<Category> catList = itemDao.getCategories();
ProductDao prodDao = new ProductDao(FactoryProvider.getFactory());
List<Product> prodList = prodDao.getProduct();

UserDao userDao = new UserDao(FactoryProvider.getFactory());
List<User> userList = userDao.getUser();
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShopCart - Admin Page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container admin p-5">
		
		<div class="row mt-2">

			<!-- users card -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<img class="img-fluid" style="max-width: 80px;" alt="users"
							src="img/group.png">
						<h4><%=userList.size()%></h4>
						<h3>Users</h3>
					</div>
				</div>
			</div>

			<!-- categories card -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<img class="img-fluid" style="max-width: 80px;" alt="users"
							src="img/categories.png">
						<h4><%=catList.size() %></h4>
						<h3>Categories</h3>
					</div>
				</div>
			</div>

			<!-- products card -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<img class="img-fluid" style="max-width: 80px;" alt="users"
							src="img/box.png">
						<h4><%=prodList.size() %></h4>
						<h3>Products</h3>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-2">

			<!-- Add Category card -->
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#AddCategoryModal">
					<div class="card-body text-center">
						<img class="img-fluid" style="max-width: 80px;" alt="users"
							src="img/compare.png">
						<h5>Add New Category</h5>
						<h4><%=catList.size() %></h4>
						<h3>Add Category</h3>
					</div>
				</div>
			</div>

			<!-- Add Product card -->
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#AddProductModal">
					<div class="card-body text-center">
						<img class="img-fluid" style="max-width: 80px;" alt="users"
							src="img/add-product.png">
						<h5>Add New Product</h5>
						<h4><%=prodList.size() %></h4>
						<h3>Add Product</h3>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Add Category Modal Starts from here-->

	<!-- Modal -->
	<div class="modal fade" id="AddCategoryModal" tabindex="-1"
		aria-labelledby="addCategoryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addCategoryModalLabel">Add
						Category Modal</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="ItemOperationServlet" method="post">
					<div class="modal-body">
						<input type="hidden" name="operation" value="addCategory">
						<div class="mb-3">
							<label for="categoryName" class="form-label">Category
								Name</label> <input placeholder="Enter New Category Name"
								name="categoryName" type="text" class="form-control"
								id="categoryName">
						</div>
						<div class="mb-3">
							<label for="categoryDetails" class="form-label">Category
								Details</label>
							<textarea placeholder="Enter Category Details"
								name="categoryDetails" class="form-control" id="categoryDetails"
								style="height: 100px;"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<div class="container text-center">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Add
								Category</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Add Category Modal Ends from here-->

	<!-- Add Product Modal Starts from here-->
	<!-- Modal -->
	<div class="modal fade" id="AddProductModal" tabindex="-1"
		aria-labelledby="addProductModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addProductModalLabel">Add Product
						Modal</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="ItemOperationServlet" method="post"
					enctype="multipart/form-data">

					<div class="modal-body">
						<input type="hidden" name="operation" value="addProduct">
						<div class="form-group">
							<label for="productName" class="form-label">Product Name</label>
							<input placeholder="Enter New Product Name" name="productName"
								type="text" class="form-control" id="productName">
						</div>

						<div class="form-group">
							<label for="productPrice" class="form-label">Product
								Price</label> <input placeholder="Enter Actual Price"
								name="productPrice" type="number" class="form-control"
								id="productPrice">
						</div>

						<div class="form-group">
							<label for="productDiscount" class="form-label">Product
								Discount</label> <input placeholder="Enter Product Discount"
								name="productDiscount" type="number" class="form-control"
								id="productDiscount">
						</div>

						<div class="form-group">
							<label for="productQuantity" class="form-label">Product
								Quantity</label> <input placeholder="Enter Product Quantity"
								name="productQuantity" type="number" class="form-control"
								id="productQuantity">
						</div>


						<div class="form-group">
							<label for="productDetails" class="form-label">Product
								Details</label>
							<textarea placeholder="Enter Product Details"
								name="productDetails" class="form-control" id="productDetails"
								style="height: 100px;"></textarea>
						</div>
						<!-- Product Category -->


						<div class="form-group">
							<label for="product-category" class="form-label">Product
								Category</label> <br> <select id="product-category"
								class="form-control" name="productCat">
								<%
									for (Category c : catList) {
								%>
								<option value=<%=c.getcId()%>><%=c.getcTitle()%></option>
								<%
									}
								%>

							</select>

						</div>

						<div class="form-group">
							<label for="product-pic">Choose pic for your product</label> <input
								type="file" id="product-pic" name="productPic">
						</div>

					</div>
					<div class="modal-footer">
						<div class="container text-center">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="Submit" class="btn btn-primary">Add
								Product</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Add Category Modal Ends from here-->
</body>
</html>