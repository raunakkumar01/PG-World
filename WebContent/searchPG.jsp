<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "java.util.Collections"    import="com.iem.BEAN.PG" import="java.util.ArrayList"  import="java.util.Map"
    import="com.iem.DAO.SearchManager" import="java.util.HashMap" import="com.iem.BEAN.College"%>
<%-- 
  - Author: Raunak Kumar
  - Description:
  --%>
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
	    function validate(){
	    	var a=document.getElementById("sample3").value;
	    	var b=document.getElementById("sample4").value;
	    	var c=document.getElementById("slider2").value;
	    	var d=document.getElementsByName("user_type");
	    	
	    	if(a.length <1){
	        	 document.getElementById("sample3").value="0";
	        	 a="0";
	         }
	    	if(b.length <1){
	        	 document.getElementById("sample4").value="0";
	        	 b="0";
	         }	    	
	    	
	    	
	    	if(!isNaN(a)){
	    		if(a!=parseInt(a) || a<0){
	    			alert("Enter Only positive values without decimals in occupancy field.");
	    			return false;
	    		}
	    	}
	    	else{
	    		alert("Enter only numbers.");
	    		return false;
	    	}
	    	if(!isNaN(b)){
	    		if(b!=parseInt(b) || b<0){
	    			alert("Enter Only positive values without decimals in no of bed field.");
	    			return false;
	    		}
	    	}
	    	else{
	    		alert("Enter only numbers.");
	    		return false;
	    	}
	    	if(c<1){
	    		alert("Enter your budget");
	    		return false;
	    	}
	    	var flag=0;
	    	for(var i = 0; i < d.length; i++) {
	    	   if(d[i].checked == true) {
	    	      flag=1;
	    		  break;
	    	   }
	    	 }
	    	 if(flag===0){
	    	 alert("Choose one of the sex");
	    	 return false;
	    	 }
 
	    	 return true;
	    }
	    
	    </script>
	<script type="text/javascript">
   		
		<%//ArrayList<PG> alpg= (ArrayList)session.getAttribute("alpg");
		College c=(College)session.getAttribute("clg");
		ArrayList<PG> alpgn= (ArrayList)session.getAttribute("alpgn");//All pg with greater no of boys for the given college
		ArrayList<PG> alpgf= (ArrayList)session.getAttribute("alpgf");//All pg with greater no of boys for the other college
		HashMap<PG,HashMap<String,Integer>> pgStudentsOfCollege = (HashMap<PG,HashMap<String,Integer>>)session.getAttribute("pgStudentsOfCollege");
		if((!(null == session.getAttribute("alpgn")))||(!(null == session.getAttribute("alpgf")))||!(null==session.getAttribute("clg")))
        {
		      	 System.out.println("Printing hostels");
		      	String adrs="";
		           %>	
		           var prev_infowindow=null;
		           var myCenter=new google.maps.LatLng(<%=c.getLat()%>, <%=c.getLongi()%>);
		           var map;
		           function placeMarkerCntr(location) {
				    	  var marker = new google.maps.Marker({
				    	    position: location,
				    	    map: map,
				    	    icon:'http://findicons.com/files/icons/951/google_maps/32/school.png',
				    	  });
				    	  var infowindow = new google.maps.InfoWindow({
				    		  
				    	    content: ' <%=c.getName()%>'
				    	  });
				    	  //infowindow.open(map,marker);
				    	  
				    	  //to see if the marker is clicked
				    	  
				    	  google.maps.event.addListener(marker, 'mouseover', function () {
				    		  if( prev_infowindow ) {
				    	           prev_infowindow.close();
				    	        }

				    	       prev_infowindow = infowindow;
				    		  infowindow.open(map,marker);
				            });
				    	  
				    	}
		           function initialize()
		           {
		           var mapProp = {
		             center: myCenter,
		             zoom:11,
		             mapTypeId: google.maps.MapTypeId.ROADMAP
		             };
					
		            map = new google.maps.Map(document.getElementById("map"),mapProp);
		            placeMarkerCntr(myCenter)
		           } 
				var lat1;
			    var lng1;
			   
			    
			   
			      function placeMarker(location,pgref) {
			    	  var marker = new google.maps.Marker({
			    	    position: location,
			    	    map: map,
			    	  });
			    	  var infowindow = new google.maps.InfoWindow({
			    		  
			    	    content: 'PGID: '+pgref+
			    	    			'<form action="PGDetailsMgr.jsp" method="post"><input type="hidden" id="pgid" name="pgid">'+  
									'<input type="submit" value="Show Details" /></form>	'
			    	    	//'<form action="PGDetailsMgr.jsp" method="post"><input type="text" id="pgref" value="'+pgref+'"/><button >SeeDetails</button></form>'
							// '<a href="PGDetails.jsp">See Details</a>'//'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
			    	  });
			    	  //infowindow.open(map,marker);
			    	  
			    	  //to see if the marker is clicked
			    	  
			    	  google.maps.event.addListener(marker, 'mouseover', function () {
			    		  if( prev_infowindow ) {
			    	           prev_infowindow.close();
			    	        }

			    	       prev_infowindow = infowindow;
			    		  infowindow.open(map,marker);
			    		  document.getElementById("pgid").value=pgref;
			            });
			    	  
			    	}
			      
			      function placeMarker1(location,pgref) {
			    	  var marker = new google.maps.Marker({
			    	    position: location,
			    	    map: map,
			    	    icon:'http://maps.google.com/mapfiles/ms/icons/green-dot.png', 
			    	  });
			    	  var infowindow = new google.maps.InfoWindow({
			    		  
			    	    content: 'PGID: '+pgref+
			    	    			'<form action="PGDetailsMgr.jsp" method="post"><input type="hidden" id="pgid" name="pgid">'+  
									'<input type="submit" value="Show Details" /></form>	'
			    	    	//'<form action="PGDetailsMgr.jsp" method="post"><input type="text" id="pgref" value="'+pgref+'"/><button >SeeDetails</button></form>'
							// '<a href="PGDetails.jsp">See Details</a>'//'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
			    	  });
			    	  //infowindow.open(map,marker);
			    	  
			    	  //to see if the marker is clicked
			    	  
			    	  google.maps.event.addListener(marker, 'mouseover', function () {
			    		  if( prev_infowindow ) {
			    	           prev_infowindow.close();
			    	        }

			    	       prev_infowindow = infowindow;
			    		  infowindow.open(map,marker);
			    		  document.getElementById("pgid").value=pgref;
			            });
			    	  
			    	}
			      
			      
			     
			      
			      //to place markers at ever location of pg
			   function doshow(){
				   var inp=document.getElementById("myInput").value;
				   var res = inp.split("$");
				  
				   for (i = 1; i < res.length; i++) { 
					   var ll= res[i].split(",");
					   console.log(ll);
					   var lat1=ll[0];
					   var lon1=ll[1];
					   var pgref=ll[2];
					   //var coords= new google.maps.LatLng(22.574470, 88.433813);
					   var coords= new google.maps.LatLng(lat1,lon1);
					   //geocodeAddress(geocoder, map);
					   placeMarker(coords,pgref);
					   
					}
				   inp=document.getElementById("myInput1").value;
				   res = inp.split("$");
				  
				   for (i = 1; i < res.length; i++) { 
					   var ll= res[i].split(",");
					   console.log(ll);
					   var lat1=ll[0];
					   var lon1=ll[1];
					   var pgref=ll[2];
					   //var coords= new google.maps.LatLng(22.574470, 88.433813);
					   var coords= new google.maps.LatLng(lat1,lon1);
					   //geocodeAddress(geocoder, map);
					   placeMarker1(coords,pgref);
					   
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
               <form action="gotohome1.jsp" method="post"><button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">HOME</button></form>
                 
            </nav>
         </div>
      </header>
<form action="searchPGMgr.jsp" method="post">
	  
	  <main class="mdl-layout__content">
	  <div style="margin-left: 40em;"><p style="font-weight: bold;">College names:
	  <select name="clgnm">
	  <% ArrayList<College> alclg=College.getAllCollege();

	//System.out.println("hi"+alrv.get(0).getReview());
  
  	//ArrayList<PGReview> alrv=(ArrayList)session.getAttribute("alrv");	 
  for(College cl: alclg){%>
  
      <option value="<%=cl.getName() %>"><%=cl.getName() %></option>
      
    <%} %>   
	  <!--  <option value="IEM">IEM</option>
       <option value="Heritage">Heritage</option>
       <option value="Techno">Techno</option>
       <option value="BP Poddar">BP Poddar</option>
       <option value="Jadavpur">Jadavpur</option>
       <option value="Meghnad Saha Institue of Technology">Meghnad Saha Institue of Technology</option>
	  -->
	  </select>
	   </div>
	   <!--  
	  <div style="margin-left: 40em;"><p style="font-weight: bold;">College names:</p><input type="text" list="colleges"  />
	   
	   <datalist id="colleges">
       <option value="IEM">IEM</option>
       <option value="Heritage">Heritage</option>
       <option value="Techno">Techno</option>
       <option value="BP Poddar">BP Poddar</option>
       <option value="Meghnad Saha Institue of Technology">Meghnad Saha Institue of Technology</option>
       </datalist> 
        </div>
        -->
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
		 <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left: 44em; margin-top: 10px;" onclick="return validate();">
  SEARCH
</button>

<div id="map" style="height:500px; width:800px; margin-left:20em; margin-top:50px;margin-bottom:100px;border-right: 1px solid #666666; border-bottom: 1px solid #666666; border-top: 1px solid #AAAAAA; border-left: 1px solid #AAAAAA;"></div>
		  
	  </main>
	<input type="hidden" id="myInput">
	<input type="hidden" id="myInput1">
</form>	



  <%//if(!(null == session.getAttribute("alpg")))
  if((!(null == session.getAttribute("alpgn")))||(!(null == session.getAttribute("alpgf"))))
      {
			      
			      //System.out.println(alpg.size());
			      //session.setAttribute("alpg", alpg);
			      String adrs="";
			      for(int i=0;i<alpgn.size();i++)
			      {
				    	   adrs=adrs+"$"+alpgn.get(i).getLat()+","+alpgn.get(i).getLon()+","+alpgn.get(i).getPGID()+":";//"22.574470,88.433813"+"$"+"22.5735314,88.43311889999995";//
				    	   
				    	   for (Map.Entry<String, Integer> entryI : pgStudentsOfCollege.get(alpgn.get(i)).entrySet())
							{
								adrs+="<br>"+entryI.getKey()+"->"+entryI.getValue();
							}
				    	   
				    	   
				    	   
				    	   System.out.println(adrs);
				    	  %>
				    	 <script > document.getElementById("myInput").value="<%=adrs%>";</script>
				    	  
				    	  <%
			      }
			      
			      request.getSession().removeAttribute("alpgn");
			      adrs="";
			      for(int i=0;i<alpgf.size();i++)
			      {
				    	   adrs=adrs+"$"+alpgf.get(i).getLat()+","+alpgf.get(i).getLon()+","+alpgf.get(i).getPGID()+":";//"22.574470,88.433813"+"$"+"22.5735314,88.43311889999995";//
				    	   
				    	   if(pgStudentsOfCollege.containsKey(alpgf.get(i)))
				    	   for (Map.Entry<String, Integer> entryI : pgStudentsOfCollege.get(alpgf.get(i)).entrySet())
							{
								adrs+="<br>"+entryI.getKey()+"->"+entryI.getValue();
							}
				    	   
				    	   
				    	   
				    	   System.out.println(adrs);
				    	  %>
				    	 <script > document.getElementById("myInput1").value="<%=adrs%>";</script>
				    	  
				    	  <%
			      }
			      
			      request.getSession().removeAttribute("alpgf");
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