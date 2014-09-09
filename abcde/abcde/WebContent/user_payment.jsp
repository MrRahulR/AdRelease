<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Payment</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  
  <script>
  $(function() {
    $( document ).tooltip();
  });
  </script>
  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
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
            <h2><span>Select Date for your Advertisement</span></h2>
            <div class="clr"></div>
           <form action="user_bookdate" method="post">
           <br> </br>
           <table align="center" cellpadding="20">
           <tr>
           		<td>
           			<label for="adname">Select Date: </label>
           		</td>
           		<td>
           			<input type="text" id="datepicker" name = "date" title="Ad Date"/>
           		</td>
           </tr>
           <tr>
           		<td>
           			<label for="dprice">Default Price</label>
           		</td>
           		<td>
           			<label for="defprice"> <%= (Double)session.getAttribute("dfPayment") %> </label>
           		</td>
           </tr>
           <tr>
           		<td>
           			<label for="eprice">Extra Lines Cost</label>
           		</td>
           		<td>
           			<label for="exprice"> <%= (Double)session.getAttribute("extra_payment")%> </label>
           		</td>
           </tr>
           <tr>
           		<td>
           			<label for="img">Image Cost</label>
           		</td>
           		<td>
           			<label for="image"> Included with Line cost </label>
           		</td>
           </tr>
           <tr>
           		<td>
           			<label for="total"> Total Cost </label>
           		</td>
           		<td>
           			<label for="tcost"> <%= (Double)session.getAttribute("payment") %> </label>
           		</td>
           </tr>
           <tr>
           		<td colspan="2" align="center">
           			<h2 style="font-family:verdana;color:red;"> Rs.  <%= (Double)session.getAttribute("payment") %> </h2>
           		</td>
           </tr>
           <tr>
           		<td>
           			<label for="payment">Payment Option:</label>
           		</td>
           		<td>
           			<select name = "payment_option">
				  <option value="Credit">Credit Card</option>
				  <option value="Debit">Debit Card</option>
				  <option value="Net Banking">Net Banking</option>
				  <option value="Cheque">Via Cheque</option>
				  </select>
           		</td>
           </tr>
           	<tr>
           		<td>
           		<ol>
				<li>
			 <input type="submit" class="textbutton" value="Pay Now!" name="submit"/>
			
			 <input type="reset" class="textbutton" value="Clear" name="clear"/>
				</li>
			</ol>
			</td>
			</tr>
           </table>
           
           
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