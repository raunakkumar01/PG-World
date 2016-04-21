<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
<%-- 
  - Author: Shamik Kundu
  - Description: home page
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="main.css">
    <title>PG WORLD: Home</title>
    <style>
      .nav a {
  color: #5a5a5a;
  font-size: 11px;
  font-weight: bold;
  padding: 14px 10px;
  text-transform: uppercase;
}

.nav li {
  display: inline;
}

.jumbotron {
  background-image:url('images/bcg2.jpg');
  height: 500px;
}

.jumbotron .container {
  position: relative;
  top:100px;
}

.jumbotron h1 {
  color: #fff;
  font-size: 48px;  
  font-family: 'Shift', sans-serif;
  font-weight: bold;
}

.jumbotron p {
  font-size: 20px;
  color: #fff;
}

.learn-more {
  background-color: #f7f7f7;
}

.learn-more h3 {
  font-family: 'Shift', sans-serif;
  font-size: 18px;
  font-weight: bold;
}

.learn-more a {
  color: #00b0ff;
}

.neighborhood-guides {
  background-color: #efefef;
  border-bottom:1px solid #dbdbdb;
}

.neighborhood-guides h2 {
  color: #393c3d;
  font-size: 24px;
}

.neighborhood-guides p {
  margin-bottom: 13px;
  font-size: 15px;
}
    </style>
    <% if(!(null == session.getAttribute("fail"))&&(session.getAttribute("fail").toString().equals("fail")))
    {
    	request.getSession().setAttribute("fail", "");
    	%>
    	  <script type="text/javascript">
    	alert("Invalid Username or Password");
    	</script>
    	<%
    }%>
</head>
<body>

 <div class="nav">
      <div class="container">
        <ul class="pull-left">
          <li style="font-weight:bold;color:blue;">PG WORLD</li>
          
        </ul>
        <ul class="pull-right">
          <li> 
          <%if(null == session.getAttribute("mail"))
        	  {
                    	  
                         %>
                   <form class="navbar-form navbar-right" role="form" method="post" action="loginmgr.jsp">
                        <div class="form-group">
                            <input type="text" required="required" maxlength="15" name="mail" class="form-control" placeholder="Username" />
                            <input type="password" required="required" maxlength="15" name="pwd" class="form-control" placeholder="Password" />
                        </div>
                        <button type="submit" class="btn btn-default">Log In</button></li>
                          <li><a href="SignUp.jsp">Sign Up</a></li> 
                   </form>
                    <%
                      }
                    else{ 
                    	if(session.getAttribute("cat").toString().equalsIgnoreCase("STUDENT"))
                        {
                    	String unm= session.getAttribute("mail").toString();
                    	out.println("<div class=\"navbar-brand navbar-right\">Hi "+unm);
                    	out.println("<a href=\"logout.jsp\" class=\"btn btn-warning\">LogOut</a></div>");
                    %></li><li><a href="searchPG.jsp">Search</a></li>
                    <%} else
                          {
                    	   if(session.getAttribute("cat").toString().equalsIgnoreCase("HOUSEOWNER")){
                    		 String unm= session.getAttribute("mail").toString();
                           	out.println("<div class=\"navbar-brand navbar-right\">Hi "+unm);
                           	out.println("<a href=\"logout.jsp\" class=\"btn btn-warning\">LogOut</a></div>");
                           %></li><li><a href="manageprofile_houseowner.jsp">Manage Profile</a></li>
                           <%
                    	   }
                    	   else if(session.getAttribute("cat").toString().equalsIgnoreCase("ADMIN"))
                    	   {
                    		   String unm= session.getAttribute("mail").toString();
                              	out.println("<div class=\"navbar-brand navbar-right\">Hi "+unm);
                              	out.println("<a href=\"logout.jsp\" class=\"btn btn-warning\">LogOut</a></div>");
                              %></li><li><a href="addcollege.jsp">Configure Profile</a></li>
                              <%
                    		   
                    	   }
                    	  }
                      }
                   %>
        </ul>
      </div>
    </div>

    <div class="jumbotron">
      <div class="container">
        <h1>Find a place to stay.</h1>
        <p>Join us for a pleasant, trust-worthy and seamless solution.</p>
        <a href="#">Learn More</a>
      </div>
    </div>
    
    <div class="neighborhood-guides">
         <div class="container">
            <h2>Featured colleges</h2>
            <p>Having a hard time finding a great PG nearby your college? Look no more! Check out this featured list. We have a lot more to offer beyond this list. Register to find out what we have in store. It's FREE!</p>
            <div class="row">
                <div class="col-md-4">
                    <div class="thumbnail">
                      <img src="images/1.jpg" >
                    </div>
                    <div class="thumbnail">
                      <img src="images/2.jpg" >
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="thumbnail">
                      <img src="images/3.jpg" >
                    </div>
                    <div class="thumbnail">
                      <img src="images/4.jpg" >
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="thumbnail">
                      <img src="images/5.jpg" >
                    </div>
                </div>
            </div>
         </div>
    </div>

    <div class="learn-more">
	  <div class="container">
		<div class="row">
	      <div class="col-md-4">
			<h3>Rent</h3>
			<p>Get details about the most affordable places near your college. Know where your peers are staying!</p>
			
	      </div>
		  <div class="col-md-4">
			<h3>Host</h3>
			<p>Renting out your unused space could pay your bills or fund your next vacation.</p>
			
		  </div>
		  <div class="col-md-4">
			<h3>Trustworthy and Safety</h3>
			<p>Read the reviews, call the houseowners. We've got your back at every step. </p>
			
		  </div>
	    </div>
	  </div>
	</div>
</body>
</html>