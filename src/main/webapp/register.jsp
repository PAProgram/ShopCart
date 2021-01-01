<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShopCart - Register</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="row mt-3">
<div class="col-4 md-4 offset-md-4">

<div class="card">
<div class="card-header custom-bg text-white">
SignUp Page
</div>
<div class="card-body">
<%@include file="components/message.jsp" %>

<form action="RegisterServlet" method="post">

<div class="mb-3">
    <label for="uname" class="form-label">User Name</label>
    <input name="uname" type="text" class="form-control" id="uname" >
  </div>
  
  <div class="mb-3">
    <label for="umail" class="form-label">Email address</label>
    <input name="umail" type="email" class="form-control" id="umail" aria-describedby="emailHelp">
  </div>
  
  <div class="mb-3">
    <label for="uphone" class="form-label">Phone</label>
    <input name="uphone" type="number" class="form-control" id="uphone" >
  </div>

  <div class="mb-3">
    <label for="upass" class="form-label">Password</label>
    <input name="upass" type="password" class="form-control" id="upass">
  </div>
  
  <div class="mb-3">
    <label for="uaddr" class="form-label">Address</label>
    <textarea name="uaddr" class="form-control" id="uaddr" style="height:100px;"></textarea>
  </div>
  <div class="container text-center mt-2">
  <a href="login.jsp">Already registered, click here to sign in</a>
  </div>
  <div class="container text-center mt-2">
  <button type="submit" class="btn btn-primary">Submit</button>
  <button type="reset" class="btn btn-primary">Reset</button>
  </div>
</form>

</div>
</div>



</div>
</div>

</body>
</html>