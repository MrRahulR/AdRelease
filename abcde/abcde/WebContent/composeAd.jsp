<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Ad Compose</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="style.css" rel="stylesheet" type="text/css" />
<link  href="demo.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="jquery-te-1.4.0.min.js" charset="utf-8"></script>
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
              <h2>Create Your <span>Ad</span></h2>
            <hr/>
            
            <h2> <span>Your Customer ID No. is </span> <%= session.getAttribute("uid") %></h2>
            <div class="clr"></div>
            <form action="ad_servlet" method="post">
          <br></br>
			<div>
			<script type="text/javascript" src="Edit1.js"></script>
			<script type="text/javascript">
				bkLib.onDomLoaded(function() { nEditors.allTextAreas() });
			</script>
			<textarea name="ad_content" style="height:300px; width:600px;"></textarea>
			</div>
			
			<br> </br>
			<ol>
				<li>
			 <input type="submit" class="textbutton" value="Book Ad!" name="submit"/>
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