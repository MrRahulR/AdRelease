<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<link rel="stylesheet" href="js/jquery-ui.css"/>

<script src="js/jquery-1.9.1.js"></script>

<script src="js/jquery-ui.js"></script>

<title>Register</title>

<script>

function getXMLHTTP() {
        var xmlhttp=false;
        try{
            xmlhttp=new XMLHttpRequest();
        }
        catch(e)    {
            try{
                xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(e){
                try{
                xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch(e1){
                    xmlhttp=false;
                }
            }
        }

        return xmlhttp;
    }
    
    function show(){

                var strURL="findstate.jsp?country="+document.getElementById("country").value;


                var req = getXMLHTTP();


        if (req) {
    
        	req.onreadystatechange = function() {

                           // alert(strURL);
                if (req.readyState == 4) {
                    // only if "OK"
                      if (req.status == 200) {
                              document.getElementById('statediv').innerHTML=req.responseText;
                                   } else {
                        alert("There was a problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            };
            req.open("GET", strURL, true);
            req.send(null);
        }
            }
    function showCity(){
    	//alert('showCity  '+document.getElementById("state").value);
        var strURL="findstate.jsp?state="+document.getElementById("state").value;

//        alert(strURL);
        var req = getXMLHTTP();


if (req) {
    req.onreadystatechange = function() {

                   // alert(strURL);
        if (req.readyState == 4) {
            // only if "OK"
              if (req.status == 200) {
                      document.getElementById('citydiv').innerHTML=req.responseText;
                           } else {
                alert("There was a problem while using XMLHTTP:\n" + req.statusText);
            }
        }
    };
    req.open("GET", strURL, true);
    req.send(null);
	}
}
</script>


<script type="text/javascript" language="javascript">

function check_name() {
	var uname = document.getElementById("uName");

	var User = /^[a-zA-Z'_]+$/;
	if (uname.value == '') {
		alert("Please Enter Your Name!");
		document.regForm.uName.focus() ;
		return false;
	} else if (!User.test(uname.value)) {
		alert("Enter valid character");
		document.regForm.uName.focus() ;
		return false;
	}
	else
		document.getElementById("uName").innerHTML = "";		
}

function check_state() {
	var state = document.getElementById("state");

	if (state.value == '-1') {
		alert("Please Enter Your State!");
		document.getElementById("state").focus();
	}
}

function check_city() {
	var city = document.getElementById("city");

	if (city.value == '-1') {
		alert("Please Enter Your City!");
		document.getElementById("city").focus();
	}
}
	

function check_email() {
	var umail = document.getElementById("uMailID");

	var User = /^[a-zA-Z0-9.-_]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;
	if (umail.value == '') {
		alert("E-MailID should not be blank");
		document.getElementById("uMailID").focus();
	} else if (!User.test(umail.value)) {
		alert("Enter valid EmailID!");
		document.getElementById("uMailID").focus();
	}
	else
		document.getElementById("uMailID").innerHTML = "";
}

function check_password() {
	var upass = document.getElementById("uPass");

	var User = /^[a-zA-Z0-9'_]+$/;
	if (upass.value == '') {
		alert("Password should not be blank!");
		document.getElementById("uPass").focus();
	} else if (!User.test(upass.value)) {
		alert("Enter valid Character!");
		document.getElementById("uPass").focus();
	}
	else
		document.getElementById("uPass").innerHTML = "";
}

function check_retypepassword() {
	var ucpass = document.getElementById("ucPass");
	//var upass=document.getElementById("ucPass");
	
	if (ucpass.value == '') {
		alert("Confirm your password first");
		document.getElementById("uPass").focus();
	}else if(ucpass.value!=uPass.value)
		{
		alert("Not Match with your password,Re-Enter!");
		document.getElementById("uPass").focus();
		}
	else
		document.getElementById("ucPass").innerHTML = "";
}

function validate()
{	
   if( document.regForm.uName.value == "" )
   {
     alert( "Please provide your name!" );
     document.regForm.uName.focus() ;
     return false;
   }
   if( document.regForm.umailID.value == "" )
   {
     alert( "Please provide your Email!" );
     document.myForm.EMail.focus() ;
     return false;
   } 
   if( document.regForm.textarea.value == "" )
   {
	  alert( "Please provide your valid Address!" );
	  document.myForm.textarea.focus() ;
	  return false;
	}
   
   return( true );
}
	
</script>

</head>

<body>
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="menu_nav">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li  class="active"><a href="register.jsp">Register</a></li>
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
            <h2><span>Register</span></h2>
            <div class="clr"></div>
           <form action="user_reg" method="post" onsubmit="return(validate());" name="regForm">
           <ol>
           		<li><label for="name">Enter Name :</label>
           			<input name="uName" type="text" class="a" id="uName" onblur="check_name()" size="30" maxlength="30" />
           		</li>
                <li><label for="mail"> Enter EmailID :</label>      
                     <input name="uMailID" type="text" class="a" id="uMailID" onblur="check_email()" size="30" maxlength="30"/>
               	</li>
               	<li><label for="password">Enter Password : </label>
               		<input name="uPass" type="password" class="a" id="uPass" onblur="check_password()" size="30" maxlength="30"/>
               	</li>
               	<li><label for="confirmpass">Confirm Password : </label>
                     <input name="ucPass" type="password" class="a" id="ucPass" onblur="check_retypepassword()" size="30" maxlength="30"/>
                </li>   
                <li><label for="address">Enter Address :</label>
                    <textarea name="uAdd" cols="30" rows="5" class="a" id="textarea"></textarea>
                </li>
                <li><label for="country">Country</label>
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
				<option value = <%= rs.getInt(1) %> > <%=rs.getString(2)%></option>
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
                	<label for="city">City</label>
                        <div id="citydiv">
                        <select name="city" id="city" onblur="check_city()" >
                            <option value="-1">Select City</option>
                        </select>
                        </div>
                </li>
                <br/><br/>
                 <li>
                  <input type="submit" class="textbutton" value="Register" name="submit"/>
                  <input type="reset" class="textbutton" value="Clear" name="clear"/>
                  <div class="clr"></div>
                </li>  
                </ol> 
                  </form>
            <div class="clr"></div>
          </div>
        </div>
        
        
        <div class="sidebar">
          <div class="gadget">
            <h2><span>Links</span></h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li><a href="index.html">Home</a></li>
              <li class="active"><a href="user_auth.html">Register</a></li>
              <li><a href="http://localhost:8080/abcde/user_auth">Book Classified Ad</a></li>
              <li><a href="http://localhost:8080/abcde/ad_auth">Book Classified Display Ad</a></li>
              <li><a href="#">How to Book</a></li>
               <li><a href="#">View Rates</a></li>
              <li><a href="feedback.html">Feedback</a></li>
            </ul>
          </div>
          <div class="gadget">
            <h2 class="grey"><span>Log-In</span></h2>
            <div class="clr"></div>
            <div class="search">
              <form method="get" id="login" action="#">
              	<label for="message">Email-Id : </label>
                <input class="textbox" type="text" />
                <label for="message">Password : </label>
                <input class="textbox" type="password" />
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