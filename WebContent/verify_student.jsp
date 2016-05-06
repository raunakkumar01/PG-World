<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.ConnectionFactory.ConnectionFact" import="java.sql.*" 
    import="com.iem.DAO.UserManager" import="com.iem.BEAN.*" import="java.util.ArrayList" import="com.iem.BEAN.PG"%>
    <%-- 
  - Author: Shailesh Kumar
  - Description: landing page of houseowner after logging in where he/she can see the list of his already added PGs.
                 Houseowner also gets the option to add a new PG and verify students who are staying at his/her PG.
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/pace.js"></script>
  <link href="css/pace.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css "href="css/material.min.css">
<style>
#content{background-image: url("images/bg.jpg"); }
</style>
<link rel="stylesheet" type="text/css "href="css/material.css">
<script type="text/javascript" src="js/material.js"></script>
<script type="text/javascript" src="js/material.min.js"></script>
<title>Manage Profile: House owner</title>
<link rel="stylesheet" type="text/css" href="css/material.min.css" />

<% if(!(null == session.getAttribute("vsfail"))&&(session.getAttribute("vsfail").toString().equals("fail")))
		{
			request.getSession().setAttribute("vsfail", "");
			%>
			  <script type="text/javascript">
			  alert("Incorrect Data");
			  </script>
			<%
		}%>



<script type="text/javascript">

</script>
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
<body id="content">
<%
String unm=session.getAttribute("mail").toString();
HouseOwner hs=HouseOwner.showDetails(unm);

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
	<h3>Houseowner details</h3>
	<ol>
	<li>Name: <%=hs.getName() %></li>
	<li>Email:<%= unm %></li>
	<li>Contact Number: <%=hs.getContact_no() %></li>
	</ol>
  </div>
  </div>
	</section>
			
	<!--  Bug 14 - Problem in Authenticate student details   
			With the help of combo box option for student id and pg id in the page the problem was resolved-->
<form action="verify_student_manager.jsp" method="post" style="padding-left:32em;">

             <select style="width:10em" name="studentid">
        <%
      // System.out.println(unm);
      ArrayList<String> student_names=User.get_student();
        for(int i=0;i<student_names.size();i++){
     	   %>
        <option  value=<%=student_names.get(i) %>><%=student_names.get(i) %> </option>
        <%
        }
               %>
               </select>
             
           
               <select style="width:10em" name="pgid">
        <%
      // System.out.println(unm);
      ArrayList<String> pgids=PG.get_pg_id(unm);
        for(int i=0;i<pgids.size();i++){
     	   %>
        <option  value=<%=pgids.get(i) %>><%=pgids.get(i) %> </option>
        <%
        }
               %>
               </select>
               
            
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" >
  ADD STUDENT
</button>
            
</form>


          
          <h3 style="margin-left: 450px;">List of Verified Students</h3>
          
          <table class="mdl-data-table mdl-js-data-table" style="margin-top:30px; margin-left: 500px; margin-bottom: 60px;" id="mytable" name="table">
  
    <tr>
    <th>STUDENT ID</th>
      <th class="mdl-data-table__cell--non-numeric">PG ID</th>
    </tr>
    
    <%
    ArrayList<Rental> allrental=new ArrayList<Rental>();
    for(int i=0;i<pgids.size();i++){
    	allrental=Rental.getRental(pgids.get(i));
    	for(Rental r:allrental){
    		%>
        	<tr>  
        	<td> <%=r.getUsername() %></td>
        	<td> <%=r.getPGID() %></td>
        	</tr>
        	
        	<% 
    	}
    }
    %>
      
    
  
  
</table>


<form action="delete_student_manager.jsp" method="post" style="padding-left:32em;">

            
            <select style="width:10em" name="studentid1">
        <%
      // System.out.println(unm);
      ArrayList<String> student_name=User.get_student();
        for(int i=0;i<student_name.size();i++){
     	   %>
        <option value=<%=student_name.get(i) %>><%=student_name.get(i) %> </option>
        <%
        }
               %>
               </select>
            
        
            
            <select style="width:10em" name="pgid1">
        <%
       //System.out.println(unm);
      ArrayList<String> pgids2=PG.get_pg_id(unm);
        for(int i=0;i<pgids2.size();i++){
     	   %>
        <option value=<%=pgids2.get(i) %>><%=pgids2.get(i) %> </option>
        <%
        }
               %>
               </select>
            
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"  >
  DELETE STUDENT
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