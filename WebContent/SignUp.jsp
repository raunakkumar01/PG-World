<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%-- 
  - Author: Shamik Kundu
  - Description: In this page a new user can register to the system as a houseowner or student. 
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/pace.js"></script>
  <link href="css/pace.css" rel="stylesheet" />
<style>
#content{background-image: url("images/bg.jpg"); }
</style>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/style1.css">
    <link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
    <% if(!(null == session.getAttribute("snupfail"))&&(session.getAttribute("snupfail").toString().equals("fail")))
    {
    	request.getSession().setAttribute("snupfail", "");
    	%>
    	  <script type="text/javascript">
    	alert("Entered EmailId is already registered with someone");
    	</script>
    	<%
    }%>
    <script>
      function validate(){
    	  var a=document.getElementById("name").value;
    	  var b=document.getElementById("number").value;
    	  var c=document.getElementById("mail").value;
    	  var d=document.getElementById("password").value;
 
    	  var e=document.getElementsByName("user_cat");
    	  

    	  if(a.length ==0 || b.length==0 || c.length==0 || d.length==0){
    		  alert("ALL FIELDS ARE MANDATORY");
    		 return false;
    	  }
    	  var x=document.getElementById("number");
    	  var y=x.value;
    	  if(!isNaN(y)){
    	  if(y.length !== 10){
    	  alert("Enter mobile no of 10 digits only");
    	  x.value="";
    	  return false;
    	  }
    	  }
    	  else{
    	  alert("Enter digits only");
    	  x.value="";
    	  return false;
    	  }
    	  var flag=0;
    	  for(var i = 0; i < e.length; i++) {
    	     if(e[i].checked == true) {
    	        flag=1;
    	  	  break;
    	     }
    	   }
    	   if(flag===0){
    	   alert("Choose one of the Category");
    	   return false;
    	   }
    	  return true; 
      }
    </script>
</head>
<body id="content">
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
        <button type="submit" onclick="return validate();">Next</button>
      </form>
</body>
</html>