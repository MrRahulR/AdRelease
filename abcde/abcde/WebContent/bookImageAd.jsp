<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<head>

<title>Book Ad</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="style.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>

<script>
	function getXMLHTTP() {
		var xmlhttp = false;
		try {
			xmlhttp = new XMLHttpRequest();
		} catch (e) {
			try {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				try {
					xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e1) {
					xmlhttp = false;
				}
			}
		}

		return xmlhttp;
	}

	function show() {

		var strURL = "findpaper.jsp?country="
				+ document.getElementById("country").value;
        
		var req = getXMLHTTP();
    
      
		if (req) {

			req.onreadystatechange = function() {

				// alert(strURL);
				if (req.readyState == 4) {
					// only if "OK"
					if (req.status == 200) {
						document.getElementById('statediv').innerHTML = req.responseText;
					} else {
						alert("There was a problem while using XMLHTTP:\n"
								+ req.statusText);
					}
				}
			};
			req.open("GET", strURL, true);
			req.send(null);
		}
	}
	function showCity() {
		
		var strURL = "findpaper.jsp?state="
				+ document.getElementById("state").value;

		
		var req = getXMLHTTP();

		if (req) {
			req.onreadystatechange = function() {

				// alert(strURL);
				if (req.readyState == 4) {
					// only if "OK"
					if (req.status == 200) {
						document.getElementById('citydiv').innerHTML = req.responseText;
					} else {
						alert("There was a problem while using XMLHTTP:\n"
								+ req.statusText);
					}
				}
			};
			req.open("GET", strURL, true);
		//	alert(document.getElementsByName("select_state").value);
			req.send(null);
		}

	}

	function showarea() {
	//	alert(document.getElementsByName("select_state").value);
		var strURL = "findpaper.jsp?city="
				+ document.getElementById("city").value;

		
		var req = getXMLHTTP();

		if (req) {
			req.onreadystatechange = function() {

				// alert(strURL);
				if (req.readyState == 4) {
					// only if "OK"
					if (req.status == 200) {
						document.getElementById('newspaperdiv').innerHTML = req.responseText;
					} else {
						alert("There was a problem while using XMLHTTP:\n"
								+ req.statusText);
					}
				}
			};
			req.open("GET", strURL, true);
			req.send(null);
		}
	}
	
	

	function check_state() {
		var state = document.getElementById("state");

		//var User = /^[a-zA-Z'_]+$/;
		if (state.value == '-1') {
			alert("Please Enter Your State!");
			document.getElementById("state").focus();
		}
	}

	function check_city() {
		var city = document.getElementById("city");

		//var User = /^[a-zA-Z'_]+$/;
		if (city.value == '-1') {
			alert("Please Enter Your City!");
			document.getElementById("city").focus();
		}
	}
	
	function check_newspaper() {
		var city = document.getElementById("newspaper");

		//var User = /^[a-zA-Z'_]+$/;
		if (city.value == '-1') {
			alert("Please Enter Newspaper!");
			document.getElementById("newspaper").focus();
		}
	}
	
	function check_adname() {
		var city = document.getElementById("adname");

		//var User = /^[a-zA-Z'_]+$/;
		if (city.value == '-1') {
			alert("Please Enter Ad Name!");
			document.getElementById("adname").focus();
		}
	}
</script>



</head>

<body>
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="menu_nav">
        <ul>
          <li><a href="user_home.jsp">Home</a></li>
          <li><a href="history.jsp">History</a></li>
          <li class="active"><a href="http://localhost:8080/abcde/user_auth">Book Ad</a></li>
          <li><a href="http://localhost:8080/abcde/contact_auth">Contact Us</a></li>
          <li><a href="http://localhost:8080/abcde/user_logout">Logout</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg">
      	<img src="images/header_images.jpg" width="641" height="289" alt="" />
      	<div class="logo">
          <h1><a href="user_home.html">Book<span>My</span>Ad<small>Online Newspaper Ad Booking</small></a></h1>
        </div>
      </div>
    </div>
    <div class="content">
      <div class="content_bg">
      
      
        <div class="mainbar">
          <div class="article">
            <h2><span>Select Booking Info</span></h2>
            <hr/>
            
            <h2> <span>Your Customer ID No. is </span> <%= session.getAttribute("uid") %></h2>
            <div class="clr"></div>
            <br/>
          
		<form action="booking_servlet" method="post">
		<table id="test2">
       	<tr>
       		<td width="207"><label for="adname">Enter Ad Type : </label></td>
       		<td width="266"> 
				 <select name = "adname" onblur="check_adname()">
				  <option value="Matrimonial">MATRIMONIAL</option>
				  <option value="Property">PROPERTY</option>
				  <option value="Recruitment">RECRUITMENT</option>
				  <option value="Buissness">BUISSNESS</option>
				   <option value="Personal">PERSONAL</option>
				  <option value="Vehicles">VEHICLES</option>
				  <option value="Announcement">ANNOUNCEMENT</option>
				  <option value="Travel">TRAVEL</option>
				  <option value="To Rent">TO RENT</option>
				  <option value="Notice">PUBLICE NOTICE AND TENDERS</option>
				  <option value="Wanted">SITUATION WANTED</option>
				   <option value="Service">SERVICES</option>
				  <option value="Retail">RETAIL</option>
				  <option value="Wadding Arrangement">WADDING ARRANGEMENT</option>
				  <option value="Orbituary">ORBITUARY</option>
				   <option value="Computers">COMPUTERS</option>
				  <option value="Marriege Bearue">MARRIAGE BEREAU</option>
				  <option value="Astrology">ASTROLOGY</option>
				  <option value="Rememberance">REMEBERANCE</option>
				   <option value="Entertainment">ENTERTAINMENT</option>
				  <option value="Education">EDUCATION</option>
				</select>
       		</td>
       </tr>
      
       <tr>
       		<td width="205" height="129"><label for="id">SELECT YOUR AD</label></td>
       		<td width="271"> 
       		
					 <input type = "radio" name = "adtype" value = "Classified Text"/> Classified Text Ad <br/><br/>
					 <input type = "radio" name = "adtype" value = "Classified Display" checked="checked"/> Classified Display Ad <br/>
       		</td>
       		</tr>
       		<tr>
       			<td height="46">
       			<label for="country">Country</label></td>
                 <td>	  <select name="country" id="country" onchange="show()">
                  <%      try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection c = DriverManager.getConnection(
								"jdbc:mysql://localhost:3306/adbooking", "root",
								"root");
						Statement st = c.createStatement();
						String sql = "select * from country_info";
						ResultSet rs = st.executeQuery(sql);
						while (rs.next()) {
				%>
				<option value= <%=rs.getInt(1)%> > <%=rs.getString(2)%></option>
				<%
					}
						c.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
                          
                        </select>

						</td>
				</tr>
				<tr>
				  <td height="45"><label for="state">State</label></td>
                    <td> <div id="statediv">
                        <select name="state" id="state"  onblur="check_state()">
                            <option value="-1">Select State</option>
                        </select>
                        </div>
					</td>
				</tr>
				<tr>
				  <td height="50"><label for="city">City</label></td>
                    <td><div id="citydiv">
                        <select name="city" id="city" onblur="check_city()" >
                            <option value="-1">Select City</option>
                        </select>
                        </div>
					</td>
				</tr>
					<tr>
					<td height="44"><label for="newspaer">Newspaper</label></td>
                    <td><div id="newspaperdiv">
                        <select name="newspaper" id="newspaper" onblur="check_newspaper()" >
                            <option value="-1">Select Newspaper</option>
                        </select>
                        </div>
					</td>
				</tr>


       		<tr>
       			<td height="57"></td>
       				<td>
       				<ol>
       			<li>
       				 <input type="submit" class="textbutton" value="Go Further!" name="submit"/>
                 </li>
                 </ol>
       				</td>
       				<td>
       				<ol>
       			<li>	
       				<input type="reset" class="textbutton" value="Clear" name="clear"/>
       			</li>
       			</ol>
       				</td>
       				
       		</tr>
       </table>
      
       </form>
       <div class="clr"></div>
      	  <br/>
       <br/>
      
       
            <div class="clr"></div>
          </div>
        </div>
        
        
        <div class="sidebar">
          <div class="gadget">
            <h2><span>Links</span></h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li><a href="user_home.jsp">Home</a></li>
              <li><a href="history.jsp">History</a></li>
              <li class="active"><a href="http://localhost:8080/abcde/user_auth">Book Classified Ad</a></li>
              <li><a href="http://localhost:8080/abcde/ad_auth">Book Classified Display Ad</a></li>
              <li><a href="#">How to Book</a></li>
              <li><a href="#">View Rates</a></li>
              <li><a href="http://localhost:8080/abcde/contact_auth">Feedback</a></li>
            </ul>
          </div>
          
         
        </div>
        <div class="clr"></div>
      </div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">Copyright &copy; 2014 <a href="#">BookMyAd</a></p>
      <p class="rf">All Rights Reserved</p>
      <div class="clr"></div>
    </div>
  </div>
</div>
</body>
</html>