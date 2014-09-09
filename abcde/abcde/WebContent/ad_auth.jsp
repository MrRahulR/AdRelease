<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>LogIn</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="style1.css" />

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://www.modernizr.com/downloads/modernizr-latest.js"></script>
<script type="text/javascript" src="placeholder.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>

</head>

<body>
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="menu_nav">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li class="active"><a href="register.jsp">Register</a></li>
          <li><a href="http://localhost:8080/abcde/user_auth">Book Ad</a></li>
          <li><a href="feedback.html">Contact Us</a></li>
          <li><a href="aboutus.html">About Us</a></li>
        </ul>
        <div class="clr"></div>
      </div>
     
    </div>
    <div class="content">
      <div class="content_bg">
      
      
        <div class="mainbar">
          <div class="article">
            <div class="clr"></div>
           
			 <form id="slick-login" action="user_login" method="post">
			<label for="username">EmailID</label>
			<input type="text" name="uMailID" class="placeholder"/>
			<label for="password">Password</label>
			<input type="password" name="uPass" class="placeholder" />
			<input type="submit" value="Log In"/>
			</form>

            <div class="clr"></div>
          </div>
        </div>
        
        
       
    </div>
  </div>
  </div>
</div>
</body>
</html>