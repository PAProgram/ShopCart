package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String uName = request.getParameter("uname");
			String uMail = request.getParameter("umail");
			String uPhone = request.getParameter("uphone");
			String uPass = request.getParameter("upass");
			String uAddress = request.getParameter("uaddr");
			
//			Validations
			if(uName.isEmpty())
			{
				response.getWriter().println("User Name is Empty");
				return;
			}
			
			User user = new User(uName, uMail, uPhone, uPass, "default.jpg", uAddress, "normal");
		
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			int uId = (Integer) s.save(user);
			
			tx.commit();
			s.close();
			
			HttpSession httpS =  request.getSession();
			httpS.setAttribute("message", "User Registered Successfully!  User Id - "+ uId);
			response.sendRedirect("register.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			return;
		}
		
	}

}
