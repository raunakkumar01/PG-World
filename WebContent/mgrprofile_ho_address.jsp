<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%-- 
  - Author: Shamik Kundu
  - Description:  In this page houseowner will add details (1/2) of a new PG
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css "href="css/material.min.css">
<link rel="stylesheet" type="text/css "href="css/material.css">
<script type="text/javascript" src="js/material.js"></script>
<script type="text/javascript" src="js/material.min.js"></script>

<title>ADD PG</title>
<script>
    var lat1;
    var lng1;
    
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: {lat: 22.5698662, lng: 88.42955949999998}
        });
        var geocoder = new google.maps.Geocoder();

        document.getElementById('submit').addEventListener('click', function() {
        	
        	var a=document.getElementById("text14").value;
        	var b=document.getElementById("text6").value;
        	if(a.length >0 ){
        	if(b.length >0){
        			var x=document.getElementById("text2");
        			var y=x.value;
        			if(!isNaN(y)){
        			if(y.length <6 || y.length>6){
        			alert("Enter pin of 6 digits");
        			x.value="";
        			document.getElementById("text2").focus();
        			}
        			else{
        				if(y==parseInt(y)){
        					geocodeAddress(geocoder, map);
        				}
        				else{
        					alert("No decimals please.");
        					x.value="";
                			document.getElementById("text2").focus();
        				}
        				
        				
        			}
        			}
        			else{
        			alert("Enter digits only");
        			x.value="";
        			document.getElementById("text2").focus();
        			}
        		}
        	else{
        		alert("ENTER CITY NAME");
        	}
        	}
        	else{
        		alert("ENTER ADDRESS");
        	}
        	
          
        });
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('text14').value+' '+document.getElementById('text6').value+' '+document.getElementById('text2').value;
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            resultsMap.setCenter(results[0].geometry.location);
            
                lat1 = results[0].geometry.location.lat();
               lng1 = results[0].geometry.location.lng();
              
       
        document.getElementById('lati').value=lat1;
        document.getElementById('longi').value=lng1;
       
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
      
      function sub(){
    	  
    	  var x = document.getElementById('text14').value;
    	  var y = document.getElementById('text6').value;
    	  var z = document.getElementById('text2').value;
    	  var p = document.getElementById('lati').value;
    	  var q = document.getElementById('longi').value;
    	  document.getElementById('text141').value=x;
    	  document.getElementById('text61').value=y;
    	  document.getElementById('text21').value=z;
    	  document.getElementById('text91').value=p;
    	  document.getElementById('text31').value=q;
    	  
      }
       
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?callback=initMap">
    </script>
</head>
<body>
 <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
      <header class="mdl-layout__header">
         <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">ADD PG DETAILS</span>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation -->
            
         </div>
      </header>
	  
	 <main class="mdl-layout__content">
	        <div class="mdl-grid">
			<div class="mdl-cell mdl-cell--4-col">
			<p>Instruction: Fill in the blanks, click Calculate coordinates, click next and finally click go to next page.</p>
            <ul>
			<li>           
		    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" id="text14" required>
               <label class="mdl-textfield__label" for="text14">Address</label>
            </div>
			</li>
			        
			<li>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" id="text6" required>
               <label class="mdl-textfield__label" for="text6">City</label>
            </div>
            </li>
			<li>
			 <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="text2" required>
               <label class="mdl-textfield__label" for="text2">Pincode</label>
			   <span class="mdl-textfield__error">Number required!</span>
            </div>
			</li>
			</ul>
			<table>
			<tr>
			<td>
			<button  id="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left:45px;">
            CALCULATE CO-ORDINATES
            </button>
            <button onclick="sub()" id="submit1" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left:35px;">
             NEXT
             </button>
            </td> 
			<td>
		
			</td>
			</tr>
			</table>

			</div>
          <div class="mdl-cell mdl-cell--4-col">
			<div id="map" style="height: 300px; width: 300px;"></div>
			
			 </div>

          <div class="mdl-cell mdl-cell--4-col">
  
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" id="lati">
               <label class="mdl-textfield__label" for="text1411"></label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" id="longi">
               <label class="mdl-textfield__label" for="text611"></label>
            </div>
            
          </div>
           <div class="mdl-cell mdl-cell--6-col">
          <form action="mgrprofile_ho_address_mgr.jsp" method="post">
	        <div class="mdl-grid">
			<div class="mdl-cell mdl-cell--4-col">
			
            <ul>
			<li>           
		    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" id="text141" name="adrs">
               <label class="mdl-textfield__label" for="text141"></label>
            </div>
			</li>
			        
			<li>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
               <input class="mdl-textfield__input" type="text" id="text61" name="city">
               <label class="mdl-textfield__label" for="text61"></label>
            </div>
            </li>
			<li>
			 <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
              <input class="mdl-textfield__input" type="text" id="text21" name="pin">
               <label class="mdl-textfield__label" for="text21"></label>
            </div>
			</li>
				<li>
			 <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
              <input class="mdl-textfield__input" type="text" id="text91" name="lt">
               <label class="mdl-textfield__label" for="text21"></label>
            </div>
			</li>
				<li>
			 <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
              <input class="mdl-textfield__input" type="text" id="text31" name="lng">
               <label class="mdl-textfield__label" for="text21"></label>
            </div>
			</li>
			</ul>
			</div>
			</div>
				<button id="submit2" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="margin-left:35px;">
             GO TO NEXT PAGE
             </button>
			</form>
          </div>
          </div>
          
	   
	 </main>


      
  </div>
</body>
</html>