<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Home</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="style.css" rel="stylesheet" type="text/css" />

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
          <li class="active"><a href="admin_home.jsp">Home</a></li>
          <li><a href="newspaper_info.jsp">Newspaper</a></li>
          <li><a href="admin_info.jsp">Admin</a></li>
          <li><a href="cust_info.jsp">Customers</a></li>
          <li><a href="http://localhost:8080/abcde/admin_logout">Logout</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg">
      	<img src="images/header_images.jpg" width="641" height="289" alt="" />
      	<div class="logo">
          <h1><a href="admin_home.html">Book<span>My</span>Ad<small>Online Newspaper Ad Booking</small></a></h1>
        </div>
      </div>
    </div>
    <div class="content">
      <div class="content_bg">
      
      
        <div class="mainbar">
          <div class="article">
            <h2><span>Welcome</span> <%= session.getAttribute("aName") %></h2>
            <h2> <span>Your Admin ID No. is </span> <%= session.getAttribute("aid") %></h2>
            <div class="clr"></div>
            <p><a href="user_home.jsp">bookMyAd</a> is the easiest way to<span> book Classified &amp; Display Advertisements
            </span> for <b>Times of India, Hindustan Times, Hindu, Mid-Day, ABP &amp; all other leading newspaper
             publications!</b>  Now book Matrimonial, Property, Recruitment Newspaper Ads at lowest rates. releaseMyAd is India's simplest classified booking service! Through our service you can book classified Ads for all leading Indian Newspapers – at no extra charges!
       		 We are fully accredited by the Indian Newspaper Society (I.N.S.) - the primary governing body for all media
        	 publications. We enjoy Full Accreditation recognition from the I.N.S. - an honour only allocated to select 
        	 few.</p>
        	 
           
            <div class="clr"></div>
          </div>
        </div>
        
        
        <div class="sidebar">
          <div class="gadget">
            <h2><span>Links</span></h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li class="active"><a href="admin_home.jsp">Home</a></li>
              <li><a href="newspaper_info.jsp">Newspaper</a></li>
              <li><a href="cust_info.jsp">Customers</a></li>
              <li><a href="booking_info.jsp">Booking Info</a></li>
              <li><a href="admin_info.jsp">Admin</a></li>
              <li><a href="#">Edit Info</a></li>
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