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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css "href="css/material.min.css">
<link rel="stylesheet" type="text/css "href="css/material.css">
<script type="text/javascript" src="js/material.js"></script>
<script type="text/javascript" src="js/material.min.js"></script>
<title>Manage Profile: House owner</title>
<link rel="stylesheet" type="text/css" href="css/material.min.css" />

<script type="text/javascript">
/*function validate1(){
	var a=document.getElementById("text142").value;
	var b=document.getElementById("text143").value;
	a=a.trim();
	b=b.trim();
	if(a.length<1 || b.length <1){
		alert("ENTER STUDENT_ID AND PG_ID BOTH(FOR ADDING)");
		return false;
	}
	return true;
}
function validate2(){
	var a=document.getElementById("text144").value;
	var b=document.getElementById("text145").value;
	a=a.trim();
	b=b.trim();
	if(a.length<1 || b.length <1){
		alert("ENTER STUDENT_ID AND PG_ID BOTH(FOR DELETING)");
		return false;
	}
	return true;
}*/
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
<body>
<%
String unm=session.getAttribute("mail").toString();
HouseOwner hs=HouseOwner.showDetails(unm);
/*Connection con=ConnectionFact.dbConnect();
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
	k1=rs1.getString("NAME");*/
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
			<!-- Accent-colored raised button -->
			
	
<form action="verify_student_manager.jsp" method="post" style="padding-left:23em;">
<!--  Student_ID:<input type="text" name="studentid"  />
PG_ID:<input type="text" name="pgid" />
<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left: 40em;">
  ADD STUDENT
</button>   -->
             <!--   <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" >
               <input class="mdl-textfield__input" type="text" id="text142" name="studentid">
               <label class="mdl-textfield__label" for="text142">Student ID</label>
            </div>
             -->
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
             
           <!--     <input class="mdl-textfield__input" type="text" id="text143" name="pgid">
               <label class="mdl-textfield__label" for="text143">PG ID</label> -->
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


          
          <h3 style="margin-left: 450px;">List of Already added PGs</h3>
          
          <table class="mdl-data-table mdl-js-data-table" style="margin-top:30px; margin-left: 430px; margin-bottom: 60px;" id="mytable" name="table">
  
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


<form action="delete_student_manager.jsp" method="post" style="padding-left:23em;">
<!--  Student_ID:<input type="text" name="studentid"  />
PG_ID:<input type="text" name="pgid" />
<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left: 40em;">
  ADD STUDENT
</button>   -->
         <!--       <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" >
               <input class="mdl-textfield__input" type="text" id="text144" name="studentid1">
               <label class="mdl-textfield__label" for="text142">Student ID</label>
            </div>-->
            
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
            
        <!--      <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" id="text145" name="pgid1">
               <label class="mdl-textfield__label" for="text143">PG ID</label>
            </div> -->
            
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