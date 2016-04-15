<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.ConnectionFactory.ConnectionFact" import="java.sql.*" 
    import="com.iem.DAO.UserManager" import="com.iem.BEAN.PGIndex" import="java.util.ArrayList"%>
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
               <form action="gotohome.jsp" method="post"><button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">HOME</button></form>
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
			<!-- Accent-colored raised button -->
<form action="mgrprofile_ho_address.jsp" method="post">
<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left: 40em;">
  ADD PG DETAILS
</button>
</form>
<form action="post">
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
  <%int i=0;
  ArrayList<PGIndex>rb=UserManager.getPGNames(unm); 
  for(i=0;i<rb.size();i++){
  %>
    <tr>
    <form action="PGMgr.jsp" method="post">
      <td><input type="text" name="pgd" value=<%=rb.get(i).getPgid()%> /></td>
      <td><%=rb.get(i).getAddress()%></td>
      <td class="mdl-data-table__cell--non-numeric"><button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
  EDIT DETAILS
</button></td>
      </form>
    </tr>
    <%} %>
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