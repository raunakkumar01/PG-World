<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.ConnectionFactory.ConnectionFact" import="java.sql.*" 
    import="com.iem.BEAN.PG" import="java.util.ArrayList" import="com.iem.DAO.PGManager"
    %>
    <%-- 
  - Author: Shamik Kundu
  - Description: In this page houseowner can update the details of a specific PG that is already present in
                 his list of added PGs.
  --%>
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
int id=Integer.parseInt(request.getParameter("pgd"));
ArrayList<PG> ar=PGManager.getPGDetails(id);
request.getSession().setAttribute("pgid",ar.get(0).getPGID());
request.getSession().setAttribute("cat","Houseowner");
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
               <form action="gotohome.jsp" method="post"><button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">HOME</button></form>
                     
            </nav>
         </div>
      </header>
  <section>
    <div class="demo-card-wide mdl-card mdl-shadow--6dp">
    <div class="mdl-card__title">
    <h2 class="mdl-card__title-text"></h2>
<h3>UPDATE PG DETAILS</h3>
<ol>
<li>PGID: <%=ar.get(0).getPGID() %></li>
<li>ADDRESS<%=ar.get(0).getAddressLine()%></li>
<li>PINCODE: <%=ar.get(0).getPincode() %></li>
</ol>
  </div>
  </div>
</section>
<form action="updatepgmgr.jsp">
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
      <td><input type="text"  style="width:30px;" name="b1"></td>
      <td><input type="text"  style="width: 50px;" name="p1"></td>
    </tr>
    <tr>
      <td>2</td>
      <td><input type="text" style="width: 30px;" name="b2"></td>
      <td><input type="text" style="width: 50px;" name="p2"></td>
    </tr>
    <tr>
      <td>3</td>
      <td><input type="text"  style="width: 30px;" name="b3"></td>
      <td><input type="text"  style="width: 50px;" name="p3"></td>
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
<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left: 40em;">
  UPDATE PG DETAILS
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
