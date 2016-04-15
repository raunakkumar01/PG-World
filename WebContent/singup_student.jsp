<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
  - Author: Shamik Kundu
  - Description: In this page student will add relevant details (2/2)
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/style1.css">
</head>
<body>
 <form action="singupmgr_student.jsp" method="post">
      
        <h1>Sign Up</h1>
        
        <fieldset>
          <legend><span class="number">2</span>Add Personal Details</legend>
          <label for="aline1">Address line 1</label>
          <input type="text" id="aline1" name="add1">
           <label for="aline2">Address line 2</label>
          <input type="text" id="aline2" name="add2">
          <label for="city">DOB</label>
          <input type="text" id="city" name="dob">
           <label for="pin">College Name</label>
          <input type="text" id="pin" name="clgname">
          <label>Gender:</label>
          <input type="radio" id="Houseowner" value="Male" name="user_type"><label for="Houseowner" class="light">Male</label><br>
          <input type="radio" id="Student" value="Female" name="user_type"><label for="Student" class="light">Female</label>
        </fieldset>
        <button type="submit">Register</button>
      </form>
</body>
</html>