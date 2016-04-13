<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <link rel="stylesheet" href="css/style.css">
</head>
</head>
<body>
<hgroup>
  <h1>Login Form</h1>
  
</hgroup>
<form action="loginmgr.jsp" method="post">
  
  <div class="group">
    <input type="email" name="mail"><span class="highlight"></span><span class="bar"></span>
    <label>Email</label>
  </div>
  <div class="group">
    <input type="password" name="pwd"><span class="highlight"></span><span class="bar"></span>
    <label>Password</label>
  </div>
  <button type="button" class="button buttonBlue">Log in
    <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
  </button>
</form>
 <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
 <script src="js/index.js"></script>
</body>
</html>