<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
  - Author: Shamik Kundu
  - Description: During signup, in this page houseowner will add details (2/2) of a new PG 
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/style1.css">
    
</head>
<body>
   <form action="signupmgr_houseowner.jsp" method="post">
      
        <h1>Sign Up</h1>
        
        <fieldset>
          <legend><span class="number">2</span>Almost there!</legend>
          <label>PG for</label>
          <input type="radio" id="Houseowner" value="Male" name="audi"><label for="Houseowner" class="light">Male</label><br>
          <input type="radio" id="Student" value="Female" name="audi"><label for="Student" class="light">Female</label>
          <label>Facilities provided</label>
          <input type="checkbox" id="Houseowner" value="TV" name="fac"><label for="Houseowner" class="light">TV</label><br>
          <input type="checkbox" id="Houseownerq" value="AC" name="fac"><label for="Houseowner" class="light">AC</label><br>
          <input type="checkbox" id="Student" value="WIFI" name="fac"><label for="Student" class="light">WiFi</label>
          <input type="checkbox" id="Student1" value="FOOD" name="fac"><label for="Student1" class="light">Food</label>
          <table >
  <thead>
    <tr>
      <th>Occupancy</th>
      <th> Beds</th>
      <th> Cost</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td><input type="text" name="b1" ></td>
      <td><input type="text" name="p1"  ></td>
    </tr>
    <tr>
      <td>2</td>
      <td><input type="text" name="b2" ></td>
      <td><input type="text" name="p2" ></td>
    </tr>
    <tr>
      <td>3</td>
      <td><input type="text" name="b3"  ></td>
      <td><input type="text" name="p3"  ></td>
    </tr>
  </tbody>
</table>
        </fieldset>
        
        
        <button type="submit">Register</button>
      </form>
 
</body>
</html>