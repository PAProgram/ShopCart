package com.servlets;

import com.dao.*;
import com.entities.User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String umail = request.getParameter("umail");
		String upass = request.getParameter("upass");
		
		//validate
		if(umail.isEmpty())
		{
			response.getWriter().println("mail field can't be empty");
		}
		
		//Authenticate logic
		
		LoginDao loginDao = new LoginDao(FactoryProvider.getFactory());
		User user = loginDao.getUserByEmailAndPassword(umail, upass);
		
		HttpSession httpSession = request.getSession();
		if(user == null)
		{
			httpSession.setAttribute("message", "Invalid User!");
			response.sendRedirect("login.jsp");
		}
		else {
			httpSession.setAttribute("current-user", user);
			if(user.getuType().equals("admin"))
			{
				response.sendRedirect("admin.jsp");
			}
			else if(user.getuType().equals("normal"))
			{
				response.sendRedirect("normal.jsp");
			}
			else
			{
				response.getWriter().println("Invalid User");
			}
			
		}
	}

}
