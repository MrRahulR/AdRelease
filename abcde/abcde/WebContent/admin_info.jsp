<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<title>Admin</title>

<script>
$(document).ready(function(){
  $("#Add").click(function(){
    $("#hide,#hide1,#hide2,#hide3,#hide4,#hide6").toggle(1000);
  });
});

$(document).ready(function(){
	  $("#Delete").click(function(){
	    $("#hide7,#hide8,#hide9").toggle(1000);
	  });
	});
	
$(document).ready(function(){
	  $("#Update").click(function(){
	    $("#hide10,#hide11").toggle(1000);
	  });
	});
</script>

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
          <li><a href="admin_home.jsp">Home</a></li>
          <li><a href="newspaper_info.jsp">Newspaper</a></li>
          <li class="active"><a href="admin_info.jsp">Admin</a></li>
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
           <br></br>
           <table>
           <form action="add_admin" method="post">
           		<tr>
           			<td id="Add">
           				<h3> Add Admin</h3>
           			</td>
           			
           		</tr>
           		<tr id="hide" style="display:none;">
           			<td></td>
           			<td>
           				<label for="aName"> Name : </label>
           			</td>
           			<td>
           				 <input type="text" name="aName"/>
           			</td>
           		</tr>
           		<tr id="hide1" style="display:none;">
           			<td></td>
           			<td>
           				<label for="aMailID"> Email ID </label>
           			</td>
           			<td>
           				 <input type="text" name="aMailID"/>
           			</td>
           		</tr>
           		<tr id="hide2" style="display:none;">
           			<td></td>
           			<td>
           				<label for="aPass"> Password </label>
           			</td>
           			<td>
           				 <input type="password" name="aPass"/>
           			</td>
           		</tr>
           		<tr id="hide3" style="display:none;">
           			<td></td>
           			<td>
           				<label for="aState"> State: </label>
           			</td>
           			<td>
           				 <input type="text" name="aState"/>
           			</td>
           		</tr>
           		<tr id="hide4" style="display:none;">
           			<td></td>
           			<td>
           				<label for="aCity"> City </label>
           			</td>
           			<td>
           				 <input type="text" name="aCity"/>
           			</td>
           		</tr>
           		
           		<tr id="hide6" style="display:none;">
           			<td></td>
           			<td>
           				<input type="submit" value="Add"/>
           			</td>
           			<td>
           				 <input type="reset" value="Clear"/>
           			</td>
           		</tr>
           		</form>
           		<form action="fetch_admin" method="post">
           		<tr>
           			<td id="Update">
           			<h3>Update Admin</h3>	
           			</td>
           		</tr>
           		<tr id="hide10" style="display:none;">
           			<td></td>
           			<td>
           				<label for="uName"> Admin Id : </label>
           			</td>
           			<td>
           				 <input type="text" name="uName"/>
           			</td>
           		</tr>
           		<tr id="hide11" style="display:none;">
           			<td></td>
           			<td>
           				<input type="submit" value="Update"/>
           			</td>
           			<td>
           				 <input type="reset" value="Clear"/>
           			</td>
           		</tr>
           		</form>
           		<form action="delete_admin" method="post">
          		<tr>
           			<td id="Delete">
           			<h3>Delete Admin</h3>	
           			</td>
           		</tr>
           		<tr id="hide7" style="display:none;">
           			<td></td>
           			<td>
           				<label for="dName"> Admin Name : </label>
           			</td>
           			<td>
           				 <input type="text" name="dName"/>
           			</td>
           		</tr>
           		<tr id="hide8" style="display:none;">
           			<td></td>
           			<td>
           				<label for="dCity"> City Name : </label>
           			</td>
           			<td>
           				 <input type="text" name="dCity"/>
           			</td>
           		</tr>
           		<tr id="hide9" style="display:none;">
           			<td></td>
           			<td>
           				<input type="submit" value="Delete!"/>
           			</td>
           			<td>
           				 <input type="reset" value="Clear"/>
           			</td>
           		</tr>
           		</form>	
           
           </table>
        	 
           
            <div class="clr"></div>
          </div>
        </div>
        
        
        <div class="sidebar">
          <div class="gadget">
            <h2><span>Links</span></h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li><a href="admin_home.jsp">Home</a></li>
              <li><a href="newspaper_info.jsp">Newspaper</a></li>
              <li><a href="cust_info.jsp">Customers</a></li>
              <li><a href="booking_info.jsp">Booking Info</a></li>
              <li class="active"><a href="admin_info.jsp">Admin</a></li>
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