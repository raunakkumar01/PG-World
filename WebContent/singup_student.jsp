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
        <script type="text/javascript">
        function validate(){
        	var a=document.getElementById("aline1").value;
        	a=a.trim();
        	var b=document.getElementById("city").value;
        	b=b.trim();
        	var c=document.getElementById("pin").value;
        	c=c.trim();
        	if(a.length <1 || b.length<1 ||c.length<1){
        		alert("ALL FIELDS ARE MANDATORY");
        		return false;
        	}
        	
        	var d=document.getElementsByName("user_type");

        	var flag=0;
        	for(var i = 0; i < d.length; i++) {
        	   if(d[i].checked == true) {
        	      flag=1;
        		  break;
        	   }
        	 }
        	 if(flag===0){
        	 alert("Choose one of the gender");
        	 return false;
        	 }
        	return true;
        }
        
        </script>
</head>
<body>
 <form action="singupmgr_student.jsp" method="post">
      
        <h1>Sign Up</h1>
        
        <fieldset>
          <legend><span class="number">2</span>Add Personal Details</legend>
          <label for="aline1">Address line 1 *</label>
          <input type="text" id="aline1" name="add1">
           <label for="aline2">Address line 2</label>
          <input type="text" id="aline2" name="add2">
          <label for="city">DOB *</label>
          <input type="date" id="city" name="dob">
           <label for="pin">College Name *</label>
          <input type="text" id="pin" name="clgname">
          <label>Gender: *</label>
          <input type="radio" id="Houseowner" value="Male" name="user_type"><label for="Houseowner" class="light">Male</label><br>
          <input type="radio" id="Student" value="Female" name="user_type"><label for="Student" class="light">Female</label>
        </fieldset>
        <button type="submit" onclick="return validate();">Register</button>
      </form>
</body>
</html>