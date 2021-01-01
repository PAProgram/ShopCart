<%@page import="com.entities.User"%>
<%
	User user = (User)session.getAttribute("current-user");
	if(user == null)
	{
		session.setAttribute("message", "You are not Logged In! ");
		response.sendRedirect("login.jsp");
	}
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShopCart - Normal User Page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<h2>This is Normal user page</h2>
</body>
</html>