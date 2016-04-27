<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
  - Author: Shamik Kundu
  - Description: During signup, in this page houseowner will add details (2/2) of a new PG 
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
    var a=document.getElementsByName("audi");
    var flag=0;
    for(var i = 0; i < a.length; i++) {
       if(a[i].checked == true) {
          flag=1;
    	  break;
       }
     }
     if(flag===0){
     alert("Choose one of the gender");
     return false;
     }
     var b1=document.getElementById("b1").value;
     var p1=document.getElementById("p1").value;
     var b2=document.getElementById("b2").value;
     var p2=document.getElementById("p2").value;
     var b3=document.getElementById("b3").value;
     var p3=document.getElementById("p3").value;
     if((b1.length>0&&p1.length>0) || (b2.length>0&&p2.length>0) ||(b3.length>0&&p3.length>0)){
    	 if(b1.length>0 && p1.length>0){
    		 var x=parseInt(b1);
    		 var y=parseInt(p1);
    		 if(isNaN(x) || isNaN(y)){
    			 alert("ENTER ONLY NUMBERS");
    			 return false;
    		 }
    		 if(x<0 || y<0){
    			 alert("ENTER ONLY POSITIVE VALUES");
    			 return false;
    		 }
    		if(x!=b1 || y!=p1){
    			alert(" DO NOT ENTER DECIMALS");
   			 return false;
    		}
    
    	 }
    	 if(b2.length>0 && p2.length>0){
    		 var x=parseInt(b2);
    		 var y=parseInt(p2);
    		 if(isNaN(x) || isNaN(y)){
    			 alert("ENTER ONLY NUMBERS");
    			 return false;
    		 }
    		 if(x<0 || y<0){
    			 alert("ENTER ONLY POSITIVE VALUES");
    			 return false;
    		 }
    		 if(x!=b2 || y!=p2){
     			alert(" DO NOT ENTER DECIMALS");
    			 return false;
     		}
    		 
    	 }
    	 if(b3.length>0 && p3.length>0){
    		 var x=parseInt(b3);
    		 var y=parseInt(p3);
    		 if(isNaN(x) || isNaN(y)){
    			 alert("ENTER ONLY NUMBERS");
    			 return false;
    		 }
    		 if(x<0 || y<0){
    			 alert("ENTER ONLY POSITIVE VALUES");
    			 return false;
    		 }
    		 if(x!=b3 || y!=p3){
     			alert(" DO NOT ENTER DECIMALS");
    			 return false;
     		}
    	 }
     }
     else{
    	 alert("ENTER ANY ONE TYPE OF BED AND ITS COST");
    	 return false;
     }
     if(b1.length <1 && p1.length <1){
    	 document.getElementById("b1").value="0";
    	 document.getElementById("p1").value="0";
     }
     if(b2.length <1 && p2.length <1){
    	 document.getElementById("b2").value="0";
    	 document.getElementById("p2").value="0";
    	 }
     if(b3.length <1 && p3.length <1){
    	 document.getElementById("b3").value="0";
    	 document.getElementById("p3").value="0";
     }
     return true;
    }
       
    </script>
</head>
<body>
   <form action="signupmgr_houseowner.jsp" method="post">
      
        <h1>Sign Up</h1>
        
        <fieldset>
          <legend><span class="number">2</span>Almost there!</legend>
          <label>PG for</label>
          <input type="radio" id="Houseowner" value="Male" name="audi"><label for="Houseowner" class="light">Male</label><br>
          <input type="radio" id="Student" value="Female" name="audi"><label for="Student" class="light">Female</label>
          <label>Facilities provided</label>
          <input type="checkbox" id="Houseowner" value="TV" name="fac"><label for="Houseowner" class="light">TV</label><br>
          <input type="checkbox" id="Houseownerq" value="AC" name="fac"><label for="Houseowner" class="light">AC</label><br>
          <input type="checkbox" id="Student" value="WIFI" name="fac"><label for="Student" class="light">WiFi</label>
          <input type="checkbox" id="Student1" value="FOOD" name="fac"><label for="Student1" class="light">Food</label>
          <table >
  <thead>
    <tr>
      <th>Occupancy</th>
      <th> Beds</th>
      <th> Cost</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td><input type="text" name="b1" id="b1" ></td>
      <td><input type="text" name="p1" id="p1" ></td>
    </tr>
    <tr>
      <td>2</td>
      <td><input type="text" name="b2" id="b2" ></td>
      <td><input type="text" name="p2" id="p2"></td>
    </tr>
    <tr>
      <td>3</td>
      <td><input type="text" name="b3"  id="b3" ></td>
      <td><input type="text" name="p3"  id="p3"></td>
    </tr>
  </tbody>
</table>
        </fieldset>
        
        
        <button type="submit" onclick="return validate();">Register</button>
      </form>
 
</body>
</html>