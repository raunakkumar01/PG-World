<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.ConnectionFactory.ConnectionFact" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Manage Profile: House owner</title>
<link rel="stylesheet" type="text/css" href="css/material.min.css" />
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
</head>
<body>
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
	<li>Email:<%= unm %></li>
	<li>Contact Number: <%=k %></li>
	</ol>
  </div>
  </div>
	</section>
	
	<form action="#">
	        <div class="mdl-grid">
			<div class="mdl-cell mdl-cell--4-col">
            <ul>
			<li>           
		    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="margin-top: 50px;">
               <input class="mdl-textfield__input" type="text" id="text4">
               <label class="mdl-textfield__label" for="text4">Address line 1</label>
            </div>
			</li>
			<li>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" id="text5">
               <label class="mdl-textfield__label" for="text5">Address line 2</label>
            </div>
            </li>
			<li>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" id="text6">
               <label class="mdl-textfield__label" for="text6">City</label>
            </div>
            </li>
			<li>
			 <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="text2">
               <label class="mdl-textfield__label" for="text2">Pincode</label>
			   <span class="mdl-textfield__error">Number required!</span>
            </div>
			</li>
			<li> PG for:
			 <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option2">
            <input type="radio" id="option2" name="gender" class="mdl-radio__button" >
            <span class="mdl-radio__label">Female</span>
         </label>
		  <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option1">
            <input type="radio" id="option1" name="gender" class="mdl-radio__button" >
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
      <td><input type="text"  style="width:30px;"></td>
      <td><input type="text"  style="width: 50px;"></td>
    </tr>
    <tr>
      <td>2</td>
      <td><input type="text" style="width: 30px;"></td>
      <td><input type="text" style="width: 50px;"></td>
    </tr>
    <tr>
      <td>3</td>
      <td><input type="text"  style="width: 30px;"></td>
      <td><input type="text"  style="width: 50px;"></td>
    </tr>
  </tbody>
</table>
</div>
			<div class="mdl-cell mdl-cell--4-col" style="margin-top: 100px;">
			 <p style="font-size: 15px; font-weight: bold;">Facilities provided:</p>
			 <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-2">
            <input type="checkbox" id="switch-2" class="mdl-switch__input">   
			<span class="mdl-checkbox__label">&nbsp;&nbsp;Food Facility</span>        
         </label>
		    <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-3">
            <input type="checkbox" id="switch-3" class="mdl-switch__input">   
			<span class="mdl-checkbox__label">&nbsp;&nbsp;WiFi</span>        
         </label>
		 	 <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-4">
            <input type="checkbox" id="switch-4" class="mdl-switch__input">   
			<span class="mdl-checkbox__label">&nbsp;&nbsp;TV</span>        
         </label>
		 <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-5">
            <input type="checkbox" id="switch-5" class="mdl-switch__input">   
			<span class="mdl-checkbox__label">&nbsp;&nbsp;AC</span>        
         </label> 
         </div>
         


			
			</div>
			<!-- Accent-colored raised button -->
<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left: 40em;">
  ADD/UPDATE PG DETAILS
</button>
<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left: 42em; margin-top: 10px;">
  VERIFY STUDENT
</button>

			
			
          </form>
          
          <h3 style="margin-left: 450px;">List of Already added PGs</h3>
          
          <table class="mdl-data-table mdl-js-data-table" style="margin-top:30px; margin-left: 430px; margin-bottom: 60px;">
  <thead>
    <tr>
      <th>PG ID</th>
      <th class="mdl-data-table__cell--non-numeric">Address</th>
      <th class="mdl-data-table__cell--non-numeric">Link to the details page</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>001</td>
      <td class="mdl-data-table__cell--non-numeric">E-14, Karunamoyee</td>
      
      <td class="mdl-data-table__cell--non-numeric"><a href="pg001.html">pg001</a></td>
    </tr>
    <tr>
      <td>002</td>
      <td class="mdl-data-table__cell--non-numeric">S-14, Beliaghata</td>
      
      <td class="mdl-data-table__cell--non-numeric"><a href="pg001.html">pg002</a></td>
    </tr>
    
  </tbody>
</table>
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