<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.ConnectionFactory.ConnectionFact" import="java.sql.*" %>
<%-- 
  - Author: Shamik Kundu
  - Description: In this page houseowner will add details (2/2) of a new PG
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Manage Profile: House owner</title>
<link rel="stylesheet" type="text/css" href="css/material.min.css" />
<style>
#content{background-image: url("images/bg.jpg"); }
</style>
<script type="text/javascript" src="js/material.min.js"></script>
<style>
.demo-card-wide.mdl-card {
  width: 712px;
  margin-left:20em;
}
.demo-card-wide > .mdl-card__title {
  color: #fff;
  height: 176px;
  background:rgb(193,193,193);
}
.demo-card-wide > .mdl-card__menu {
  color: #fff;
}
table {
  margin-left:20em;
}

</style>
<script type="text/javascript">
    function validate(){
    var a=document.getElementsByName("gender");
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
<body id="content">
<% 
String unm=session.getAttribute("mail").toString();
Connection con=ConnectionFact.dbConnect();
String stquery2="SELECT CONTACT_NO FROM PG_HOUSE_OWNER WHERE USERNAME=?";
String stquery3="SELECT NAME FROM PG_USER WHERE USERNAME=?";
PreparedStatement pst=con.prepareStatement(stquery2);
pst.setString(1, unm);
ResultSet rs=pst.executeQuery();
//pst.close();
String k="";
String k1="";
while(rs.next())
k=rs.getString("CONTACT_NO");
PreparedStatement pst1=con.prepareStatement(stquery3);
pst1.setString(1, unm);
ResultSet rs1=pst1.executeQuery();
//pst1.close();
while(rs1.next())
k1=rs1.getString("NAME");
%>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
      <header class="mdl-layout__header">
         <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">PG World</span>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation -->
            <nav class="mdl-navigation">
               <a class="mdl-navigation__link" href="Home.jsp" style="color:white">Home</a>
               <a class="mdl-navigation__link" href="" style="color:white">About</a>      
            </nav>
         </div>
      </header>
  <section>
    <div class="demo-card-wide mdl-card mdl-shadow--6dp">
    <div class="mdl-card__title">
    <h2 class="mdl-card__title-text"></h2>
<h3>Houseowner details</h3>
<ol>
<li>Name: <%=k1 %></li>
<li>Email:<%=unm %></li>
<li>Contact Number: <%=k %></li>
</ol>
  </div>
  </div>
</section>
<form action="mgrprofile_ho_facilities_mgr.jsp">
       <div class="mdl-grid">
<div class="mdl-cell mdl-cell--4-col">
 <ul>        
<li> PG for:
<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option2">
            <input type="radio" id="option2" name="gender" class="mdl-radio__button" value="female">
            <span class="mdl-radio__label">Female</span>
         </label>
 <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option1">
            <input type="radio" id="option1" name="gender" class="mdl-radio__button" value="male">
            <span class="mdl-radio__label">Male</span>
         </label>
</li>
</ul>
</div>
 <div class="mdl-cell mdl-cell--4-col">
         <table class="mdl-data-table mdl-js-data-table" style="margin-top: 80px; margin-left: 10px;">
  <thead>
    <tr>
      <th>No of Occupancy</th>
      <th>Available beds</th>
      <th>Cost</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td><input type="text"  style="width:30px;" name="b1" id="b1"></td>
      <td><input type="text"  style="width: 50px;" name="p1" id="p1"></td>
    </tr>
    <tr>
      <td>2</td>
      <td><input type="text" style="width: 30px;" name="b2" id="b2"></td>
      <td><input type="text" style="width: 50px;" name="p2" id="p2"></td>
    </tr>
    <tr>
      <td>3</td>
      <td><input type="text"  style="width: 30px;" name="b3" id="b3"></td>
      <td><input type="text"  style="width: 50px;" name="p3" id="p3"></td>
    </tr>
  </tbody>
</table>
</div>
<div class="mdl-cell mdl-cell--4-col" style="margin-top: 100px;">
<p style="font-size: 15px; font-weight: bold;">Facilities provided:</p>
<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-2">
            <input type="checkbox" id="switch-2" class="mdl-switch__input" name="utility" value="food">   
<span class="mdl-checkbox__label">&nbsp;&nbsp;Food Facility</span>        
         </label>
   <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-3">
            <input type="checkbox" id="switch-3" class="mdl-switch__input" name="utility" value="wifi">   
<span class="mdl-checkbox__label">&nbsp;&nbsp;WiFi</span>        
         </label>
<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-4">
            <input type="checkbox" id="switch-4" class="mdl-switch__input" name="utility" value="tv">   
<span class="mdl-checkbox__label">&nbsp;&nbsp;TV</span>        
         </label>
<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-5">
            <input type="checkbox" id="switch-5" class="mdl-switch__input" name="utility" value="ac">   
<span class="mdl-checkbox__label">&nbsp;&nbsp;AC</span>        
         </label> 
         </div>
         


</div>
<!-- Accent-colored raised button -->
<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left: 40em;" onclick="return validate();">
  ADD PG DETAILS
</button>

          </form>
          
<footer class="mdl-mini-footer">
            <div class="mdl-mini-footer__left-section">
               
               <ul class="mdl-mini-footer__link-list">
                  <li><a href="#">Help</a></li>
                  <li><a href="#">Privacy and Terms</a></li>
                  <li><a href="#">User Agreement</a></li>
               </ul>
            </div>
            
         </footer>
</div>
</body>
</html>
