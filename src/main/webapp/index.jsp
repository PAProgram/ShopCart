<%@page import="com.helper.Helper"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.helper.FactoryProvider"%>
<html>
<head>
<title>ShopCart - Home</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<%
		ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
	String cat = request.getParameter("category");
	List<Product> pList = null;
	if( cat == null || cat.equals("all"))
	{
		pList = pDao.getProduct();		
	}
	else
	{
		int	catId = Integer.parseInt(cat.trim());
		pList = pDao.getProductByCategory(catId);	
	}
	
	

	CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
	List<Category> cList = cDao.getCategories();
	%>

	<div class="row mt-2 mx-2">
		<!-- Category data -->
		<div class="col-md-2">

			<ul class="list-group m-1">
			<a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
			All Products</a>

				<%
					for (Category c : cList) {
				%>
				<a href="index.jsp?category=<%=c.getcId()%>" class="list-group-item list-group-item-action"><%=c.getcTitle()%></a>
				<%
					}
				%>
			</ul>
		</div>

		<!-- product data -->
		<div class="col-md-10">
			<div class="row" data-masonry='{"percentPosition": true }'>


				<%
					for (Product p : pList) {
				%>
				<div class="col-4">
					<div class="card m-2">
						<div class="card-columns">
							<div class="card-body">
								<div class="container text-center">
									<img alt="" src="img/products/<%=p.getpPic()%>"
										class="card-img-top"
										style="max-height: 160px; width: auto; max-width: 100%;">
								</div>
								<h5 class="card-titile"><%=p.getpTitle()%></h5>
								<p class="card-text">
									<%=Helper.getFirst10Words(p.getpDesc())%>
								</p>
							</div>
							
								<div class="card-footer">
									<button type="button" class="btn btn-primary" onclick="add_to_cart(<%=p.getpId()%>, '<%=p.getpTitle()%>', <%=p.getPriceAfterDiscount()%>)">Add to Cart</button>
									<button type="button" class="btn btn-outline-success">
										&#8377;
										<%=p.getPriceAfterDiscount()%> <span class="text-secondary discount-label">&#8377; <%=p.getpPrice()%>/- <%=p.getpDiscount()%>%-off</span> </button>
								</div>
							
						</div>
					</div>
				</div>
				<%
					}
				if(pList.size() == 0)
				{
					out.println("<h5>No product is present in the selected Category</h5>");
				}

				%>


			</div>
		</div>
	</div>
	
</body>
</html>
