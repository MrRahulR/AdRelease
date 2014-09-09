<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<head>

<title>View Offer</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>

<script>
$(document).ready(function(){
	  $("#clear").click(function(){
	    $("table,#test").hide("slow");
	    
	    
	  });
	  $("#submit").click(function(){
	    $("table,#test").show("slow");
	    
	  });
	});

</script>

<link href="style.css" rel="stylesheet" type="text/css" />

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
</script>

</head>

<body>
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html">Home</a></li>
          <li><a href="user_auth.html">Register</a></li>
          <li><a href="http://localhost:8080/abcde/user_auth">Book Ad</a></li>
          <li><a href="feedback.html">Contact Us</a></li>
          <li><a href="aboutus.html">About Us</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg">
      	<img src="images/header_images.jpg" width="641" height="289" alt="" />
      	<div class="logo">
          <h1><a href="index.html">Book<span>My</span>Ad<small>Online Newspaper Ad Booking</small></a></h1>
        </div>
      </div>
    </div>
    <div class="content">
      <div class="content_bg">
      
      
        <div class="mainbar">
          <div class="article">
            <h2><span>Welcome Guest</span></h2><hr/>
            <div class="clr"></div>
           <ol>
              <li>
       			<label for="country">Country</label>
          	  <select name="country" id="country" onchange="show()">
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
				<option value= <%= rs.getInt(1)%> > <%=rs.getString(2)%></option>
				<%
					}
						c.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
                          
                        </select>

			</li>
			<li>
				<label for="state">State</label>
                    <div id="statediv">
                        <select name="state" id="state"  onblur="check_state()">
                            <option value="-1">Select State</option>
                        </select>
                        </div>
			</li>
				
			<li>
				<label for="state">City</label>
                   <div id="citydiv">
                        <select name="city" id="city" onblur="check_city()" >
                            <option value="-1">Select City</option>
                        </select>
                        </div>
			</li>
			<li>
				<label for="newspaer">Newspaper</label>
                   <div id="newspaperdiv">
                        <select name="newspaper" id="newspaper" onblur="check_newspaper()" >
                            <option value="-1">Select Newspaper</option>
                        </select>
                        </div>
			</li>
			<br></br>
				 <li>
                  <input type="submit" class="textbutton" value="View Rates!" id="submit" name="submit"/>
                  <input type="reset" class="textbutton" value="Clear" id="clear" name="clear"/>
                  <div class="clr"></div>
                </li>  
				</ol>
				<hr id="test"/>
				
				
			<table border="1" cellpadding="15">
					<tr bgcolor="#e0e0e0">
						<th>
							Standard Rate
						</th>
						
						<th>
							Additional per letter rate
						</th>
					
						<th>
							Color Rate
						</th>
					
						<th>
							Discounts
						</th>
					</tr>
					
				<%   try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection c = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/adbooking", "root",
							"root");
					Statement st = c.createStatement();
					String sql = "select * from newspaper_info ";
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
				%>
				
					<tr>
						<td> <%= rs.getDouble(3) %></td>
						<td> <%= rs.getDouble(4) %></td>
						<td> <%= rs.getDouble(5) %></td>
						<td> <%= rs.getDouble(6) %></td>
					</tr>
			
			
			</table>
			<%
					}
					c.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		
            <div class="clr"></div>
          </div>
        </div>
        
        
        <div class="sidebar">
          <div class="gadget">
            <h2><span>Links</span></h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li><a href="index.html">Home</a></li>
              <li><a href="register.jsp">Register</a></li>
              <li><a href="http://localhost:8080/abcde/user_auth">Book Classified Ad</a></li>
              <li><a href="http://localhost:8080/abcde/ad_auth">Book Classified Display Ad</a></li>
              <li><a href="#">How to Book</a></li>
              <li  class="active"><a href="#">View Rates</a></li>
              <li><a href="feedback.html">Feedback</a></li>
            </ul>
          </div>
          <div class="gadget">
            <h2 class="grey"><span>Log-In</span></h2>
            <div class="clr"></div>
            <div class="search">
              <form method="post" id="login" action="user_login">
              	<label for="message">Email-Id : </label>
                <input class="textbox" type="text" name="uMailID" />
                <label for="message">Password : </label>
                <input class="textbox" type="password" name="uPass" />
                <input type="submit" class="textbutton" value="Log-In" name="submit"/>
              </form>
              <div class="clr"></div>
            </div>
            
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