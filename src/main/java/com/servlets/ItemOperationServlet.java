package com.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.ItemOperationDao;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class ItemOperationServlet
 */
@MultipartConfig
public class ItemOperationServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
	String operation = request.getParameter("operation");
	if(operation.trim().equals("addCategory"))
	{
		try {

			//add Category code
			
			String catName = request.getParameter("categoryName");
			String catDetails = request.getParameter("categoryDetails");
			Category category = new Category(catName, catDetails);
			
			ItemOperationDao itemDao = new ItemOperationDao(FactoryProvider.getFactory());
			int catId = itemDao.setCategory(category);
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Category Saved Successfully! Id " + catId);
			response.sendRedirect("admin.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	else if(operation.trim().equals("addProduct"))
	{
		try {
			String pName = request.getParameter("productName");
			int pPrice = Integer.parseInt(request.getParameter("productPrice"));
			int pDiscount = Integer.parseInt(request.getParameter("productDiscount"));
			int pQuantity = Integer.parseInt(request.getParameter("productQuantity"));
			String pDetails = request.getParameter("productDetails");
			Part pPic = request.getPart("productPic");
			int pCategoryId = Integer.parseInt(request.getParameter("productCat"));
			
			Product product = new Product();
			product.setpTitle(pName);
			product.setpDesc(pDetails);
			product.setpPrice(pPrice);
			product.setpDiscount(pDiscount);
			product.setpQuantity(pQuantity);
			product.setpPic(pPic.getSubmittedFileName());

			
			
			ItemOperationDao itemDao = new ItemOperationDao(FactoryProvider.getFactory());
			Category category = itemDao.getProductCategory(pCategoryId);
			
			product.setCategory(category);		
			int pId = itemDao.setProduct(product);
			
			//save image into a folder named "products"
			String path = request.getRealPath("img") + File.separator +"products" +File.separator+ pPic.getSubmittedFileName();
			FileOutputStream fos = new FileOutputStream(path);
			InputStream iStream = pPic.getInputStream();
			byte [] data = new byte[iStream.available()];
			iStream.read(data);
			fos.write(data);
			System.out.println(path);
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Product Saved Successfully! Id " + pId);
			response.sendRedirect("admin.jsp");
			return;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	else
	{
		response.getWriter().println("Incorrect Operation flag");
	}

} catch (Exception e) {
	e.printStackTrace();
}
		
		
	}

}
