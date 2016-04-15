<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "java.util.Collections"    import="com.iem.BEAN.*" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search</title>
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
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
      <header class="mdl-layout__header">
         <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">PG World</span>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation -->
            <nav class="mdl-navigation">
               <a class="mdl-navigation__link" href="gotohome1.jsp" style="color:white">Home</a>
               <a class="mdl-navigation__link" href="" style="color:white">About</a>      
            </nav>
         </div>
      </header>
	<% 
	PG p=(PG)request.getSession().getAttribute("pgdet");
	HouseOwner h=(HouseOwner)request.getSession().getAttribute("hodet");
	
	
	%>
	<section>
    <div class="demo-card-wide mdl-card mdl-shadow--6dp">
    <div class="mdl-card__title">
    <h2 class="mdl-card__title-text"></h2>
	<h3>Houseowner details</h3>
	<ol>
	<li>Name: <%=h.getName() %> </li>
	<li>Email: <%=h.getUsername() %></li>
	<li>Contact Number: <%=h.getContact_no() %></li>
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
               <input class="mdl-textfield__input" type="text" id="text4" readonly="readonly" value="<%=p.getAddressLine()  %>">
               <label class="mdl-textfield__label" for="text4">Address line 1</label>
            </div>
			</li>
			<li>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" id="text6" readonly="readonly" value="<%=p.getCity()  %>">
               <label class="mdl-textfield__label" for="text6">City</label>
            </div>
            </li>
			<li>
			 <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="text2" readonly="readonly" value="<%=p.getPincode() %>">
               <label class="mdl-textfield__label" for="text2">Pincode</label>
			   <span class="mdl-textfield__error">Number required!</span>
            </div>
			</li>
			<li> PG for:
			 <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option2">
            <input type="radio" id="option2" name="gender" class="mdl-radio__button" onclick="return false;" <%if(p.getPG_FOR().equalsIgnoreCase("female")) {%>checked="checked"<%} %> >
            <span class="mdl-radio__label">Female</span>
         </label>
		  <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option1">
            <input type="radio" id="option1" name="gender" class="mdl-radio__button" onclick="return false;" <%if(p.getPG_FOR().equalsIgnoreCase("male")) {%>checked="checked"<%} %>>
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
      <td><%=p.getB1() %></td>
      <td><%=p.getP1() %></td>
    </tr>
    <tr>
      <td>2</td>
      <td><%=p.getB2() %></td>
      <td><%=p.getP2() %></td>
    </tr>
    <tr>
      <td>3</td>
      <td><%=p.getB3() %></td>
      <td><%=p.getP3() %></td>
    </tr>
  </tbody>
</table>
</div>
			<div class="mdl-cell mdl-cell--4-col" style="margin-top: 100px;">
			 <p style="font-size: 15px; font-weight: bold;">Facilities provided:</p>
			 <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-2">
            <input type="checkbox" id="switch-2" class="mdl-switch__input" onclick="return false;" <%if(p.getFOOD().equalsIgnoreCase("true")) {%>checked="checked"<%} %>>   
			<span class="mdl-checkbox__label">&nbsp;&nbsp;Food Facility</span>        
         </label>
		    <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-3">
            <input type="checkbox" id="switch-3" class="mdl-switch__input" onclick="return false;" <%if(p.getWiFi().equalsIgnoreCase("true")) {%>checked="checked"<%} %>>   
			<span class="mdl-checkbox__label">&nbsp;&nbsp;WiFi</span>        
         </label>
		 	 <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-4">
            <input type="checkbox" id="switch-4" class="mdl-switch__input" onclick="return false;" <%if(p.getTV().equalsIgnoreCase("true")) {%>checked="checked"<%} %>>   
			<span class="mdl-checkbox__label">&nbsp;&nbsp;TV</span>        
         </label>
		 <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-5">
            <input type="checkbox" id="switch-5" class="mdl-switch__input" onclick="return false;" <%if(p.getAC().equalsIgnoreCase("true")) {%>checked="checked"<%} %>>   
			<span class="mdl-checkbox__label">&nbsp;&nbsp;AC</span>        
         </label> 
         </div>
         


			
			</div>
			<!-- Accent-colored raised button -->
<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left: 40em;">
  ADD PG REVIEW
</button>

			
			
          </form>
          
          <h3 style="margin-left: 450px;">List of Reviews added to PGs</h3>
          
          <table class="mdl-data-table mdl-js-data-table" style="margin-top:30px; margin-left: 430px; margin-bottom: 60px;">
  <thead>
    <tr>
      <th>Student Username</th>
      <th class="mdl-data-table__cell--non-numeric">Review</th>
      <th class="mdl-data-table__cell--non-numeric">Link to the details page</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>sk@m.c</td>
      <td class="mdl-data-table__cell--non-numeric">Good</td>
      
      <td class="mdl-data-table__cell--non-numeric"><a href="pg001.html">pg001</a></td>
    </tr>
    <tr>
      <td>rm@m.c</td>
      <td class="mdl-data-table__cell--non-numeric">Nice</td>
      
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
