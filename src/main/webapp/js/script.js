function add_to_cart(pId, pName, pPrice)
{
	let cart = localStorage.getItem("cart");
	let products = [];
	
	if(cart == null)
	{
		let product;	
		product = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
	}
	
	else
	{
		let pcart = JSON.parse(cart);
		let oldProduct = pcart.find((item)=>item.productId == pId)
		if(oldProduct)
		{
			console.log("old product");
//			we have to add Quantity
			oldProduct.productQuantity = oldProduct.productQuantity + 1;
			pcart.map((item)=>{
				if(item.productId == oldProduct.productId)
				{
					item.productQuantity = oldProduct.productQuantity;
					
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
		}
		else
		{
			console.log("new product");
//			we hava to add the Product
			product = {productId: pId, productName: pName,productQuantity: 1, productPrice: pPrice};
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
		}
		
		
	}
	updateCart();
}

function updateCart()
{
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if(cart == null || cart.length == 0)
	{
		console.log("cart is empty!");
		$(".cart-items").html("( 0 )");
		$(".shop-cart-body").html("Your Cart does not contain any Item");
		$(".checkout-btn").attr("disabled", true);
		
	}
	else
	{
		console.log("item added!");
		$(".cart-items").html(`(${cart.length})`);
		let table = `
		<table class="table">
		<thead class="thead-light">
		<tr>
			<th> Item Name </th>
			<th> Price </th>
			<th> Quantity </th>
			<th> Total Price </th>
			<th> Action </th>
		</tr>
		
		`;
		let totalPrice = 0;
		cart.map((item) => {
			table +=`
			<tr>
				<td> ${item.productName} </td>
				<td>${item.productPrice}</td>
				<td>${item.productQuantity}</td>
				<td>${item.productPrice*item.productQuantity}</td>
				<td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button></td>
			</tr>`
			totalPrice += item.productPrice*item.productQuantity;
		})
		table = table + `<tr ><td colspan='5' style="text-align: right; font: bolder;">Total Price : ${totalPrice} </td></tr>` + `</table>`;
		
		$(".shop-cart-body").html(table);
		$(".checkout-btn").attr("disabled", false);
	}
	
}


function deleteItemFromCart(pid)
{
	let cart = JSON.parse(localStorage.getItem("cart"));
	let newCart = cart.filter((item)=>item.productId != pid)
	localStorage.setItem("cart", JSON.stringify(newCart));
	updateCart();
		
}


$(document).ready(function (){
	updateCart()
})
