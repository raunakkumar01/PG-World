<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "java.util.Collections"    import="com.iem.BEAN.PG" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css "href="css/material.min.css">
<link rel="stylesheet" type="text/css "href="css/material.css">
<script type="text/javascript" src="js/material.js"></script>
<script type="text/javascript" src="js/material.min.js"></script>
<script langauage="javascript">
      function showMessage(value){
         document.getElementById("message").innerHTML = value;
      }	  
   </script>
   
   <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false"></script>
    
    <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript">
   		
		<%if(!(null == session.getAttribute("alpg")))
        {
		      	 System.out.println("Printing hostels");
		      	String adrs="";
		           %>		
		           var myCenter=new google.maps.LatLng(22.574470, 88.433813);
		           var map;
		           function initialize()
		           {
		           var mapProp = {
		             center: myCenter,
		             zoom:15,
		             mapTypeId: google.maps.MapTypeId.ROADMAP
		             };
					
		            map = new google.maps.Map(document.getElementById("map"),mapProp);
		           } 
				var lat1;
			    var lng1;
			   
			    
			      
			      function placeMarker(location) {
			    	  var marker = new google.maps.Marker({
			    	    position: location,
			    	    map: map,
			    	  });
			    	  var infowindow = new google.maps.InfoWindow({
			    	    content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
			    	  });
			    	  infowindow.open(map,marker);
			    	}
			      
			   function doshow(){
				   var inp=document.getElementById("myInput").value;
				   var res = inp.split("$");
				  
				   for (i = 1; i < res.length; i++) { 
					   var ll= res[i].split(",");
					   console.log(ll);
					   var lat1=ll[0];
					   var lon1=ll[1];
					   //var coords= new google.maps.LatLng(22.574470, 88.433813);
					   var coords= new google.maps.LatLng(lat1,lon1);
					   //geocodeAddress(geocoder, map);
					   placeMarker(coords);
					   
					}
				   
			   }
			   google.maps.event.addDomListener(window, 'load', initialize);
			      
			       
			    </script>
			    
			    <title>Search PG</title>
			    </head>
			    <body onload="doshow();">
	    <%
        }
		
		
		
		else
		{
     %>     
	    </script>
<title>Search PG</title>
</head>

<body >
<%} %>


<div class="mdl-layout mdl-js-layout  mdl-layout--fixed-header">
     <header class="mdl-layout__header">
         <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">Search</span>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation -->
            <nav class="mdl-navigation">
               <a class="mdl-navigation__link" href="" style="color:white">Home</a>
                 
            </nav>
         </div>
      </header>
<form action="searchPGMgr.jsp" method="post">
	  
	  <main class="mdl-layout__content">
	  
	   <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="margin-left:35em;">
        <input class="mdl-textfield__input" type="text" id="sample1" name="clgnm">
        <label class="mdl-textfield__label" for="sample1">College name</label>
       </div>
	   <table style="margin-left:40em;">
	   <tr>
	   <td>
	   <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox2">
            <input type="checkbox" id="checkbox2" class="mdl-checkbox__input" value="FOOD" name="fac">
            <span class="mdl-checkbox__label">Food</span>
       </label>
	   </td>
	   <td>
	     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox3">
            <input type="checkbox" id="checkbox3" class="mdl-checkbox__input" value="WIFI" name="fac">
            <span class="mdl-checkbox__label">WiFi</span>
       </label>
	   </td>
	   <td>
	     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox4">
            <input type="checkbox" id="checkbox4" class="mdl-checkbox__input" value="TV" name="fac">
            <span class="mdl-checkbox__label">TV</span>
       </label>
	   </td>
	   <td>
	     <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox5">
            <input type="checkbox" id="checkbox5" class="mdl-checkbox__input" value="AC" name="fac">
            <span class="mdl-checkbox__label">AC</span>
       </label>
	   </td>
	   </tr>
	   <tr>
	   <td>
	   <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width:130px;">
        <input class="mdl-textfield__input" type="text" id="sample3"  name="nofoc">
        <label class="mdl-textfield__label" for="sample3">No of Occupancy</label>
       </div>
	   </td>
	   <td>
	   <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width:90px;">
        <input class="mdl-textfield__input" type="text" id="sample4" name="nofbd">
        <label class="mdl-textfield__label" for="sample4">No of Beds</label>
       </div>
	   </td>
	   </tr>
	   <tr>
	   <td>
	  
	   </td>
	   </tr>
	   </table>
	   <div style="margin-left:39em;">
	    <p style="width:18em;">
	   <input id="slider2" class="mdl-slider mdl-js-slider" type="range"  
         min="0" max="10000" value="25" tabindex="0" 
         oninput="showMessage(this.value)" onchange="showMessage(this.value)" name="bdgt">
		 </p>
		 <p style="font-weight:bold">Budget: <div id="message" >25</div></p>
		 <p>
		 <label>Gender:</label><br>
          <input type="radio" id="Houseowner" value="Male" name="user_type"><label for="Houseowner" class="light">Male</label><br>
          <input type="radio" id="Student" value="Female" name="user_type"><label for="Student" class="light">Female</label>
        
		 </p>
		 </div>
		 <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left: 44em; margin-top: 10px;">
  SEARCH
</button>


    
	
<div id="map" style="height:500px; width:800px; margin-left:20em; margin-top:50px;margin-bottom:100px;border-right: 1px solid #666666; border-bottom: 1px solid #666666; border-top: 1px solid #AAAAAA; border-left: 1px solid #AAAAAA;"></div>
		  
	  </main>
	  
</form>	
<input type="text" id="myInput">


  <%if(!(null == session.getAttribute("alpg"))){
			      ArrayList<PG> alpg= (ArrayList)session.getAttribute("alpg");
			      //System.out.println(alpg.size());
			      String adrs="";
			      for(int i=0;i<alpg.size();i++)
			      {
				    	   adrs=adrs+"$"+alpg.get(i).getLat()+","+alpg.get(i).getLon();//"22.574470,88.433813"+"$"+"22.5735314,88.43311889999995";//
				    	   System.out.println(adrs);
				    	  %>
				    	 <script > document.getElementById("myInput").value="<%=adrs%>";</script>
				    	  
				    	  <%
			      }
			      
			      request.getSession().removeAttribute("alpg");
  }
			      %>
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