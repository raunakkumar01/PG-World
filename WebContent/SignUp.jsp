<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%-- 
  - Author: Shamik Kundu
  - Description: In this page a new user can register to the system as a houseowner or student. 
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/style1.css">
    <link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
    <script>
      
    </script>
</head>
<body>
 <form action="signupmgr.jsp" method="post">
      
        <h1>Sign Up</h1>
         <fieldset>
          <legend><span class="number">1</span>Your basic info</legend>
          <label for="name">Name:</label>
          <input type="text" id="name" name="user_name">
          
           <label for="number">Contact number:</label>
          <input type="number" id="number" name="number">

          <label for="mail">Email:</label>
          <input type="email" id="mail" name="user_email">
          
          <label for="password">Password:</label>
          <input type="password" id="password" name="user_password">
          
          <label>Register as:</label>
          <input type="radio" id="Houseowner" value="Houseowner" name="user_cat"><label for="Houseowner" class="light">Houseowner</label><br>
          <input type="radio" id="Student" value="Student" name="user_cat"><label for="Student" class="light">Student</label>
        </fieldset>
        <button type="submit">Next</button>
      </form>
</body>
</html>