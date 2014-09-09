<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.beans.Connectdb" %>
<head>

<title>Customer</title>

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
          <li><a href="admin_info.jsp">Admin</a></li>
          <li class="active"><a href="cust_info.jsp">Customers</a></li>
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
            
             <%
        		try{
        			        			
        			Connectdb cdb = new Connectdb();
        			cdb.connect_databse();
        			
        			String sql = "select * from user_info";
        			
        				ResultSet rs = cdb.stmt.executeQuery(sql);
        				
        				int i=0;
        				
        				//System.out.println(" in Rs");
        				%>
        				<br></br>
        				<table border="1" cellpadding ="10">
        				<tr bgcolor="#e0e0e0">
        					<th> 
        						User ID
        					</th>	
        					<th>
        						User Name
        					</th>
        					<th>
        						Email ID
        					</th>
        					<th>
        						Password
        					</th>
        					<th>
        						City
        					</th>
        					<th>
        						Feedback
        					</th>
        				</tr>
        				
        				<%
        				
        				while(rs.next()){
        					
        					%>
        					
        		
        				<tr>
        					<td> 
        						<%= rs.getInt(1) %>
        					</td>
        					<td>
        						<%= rs.getString(2) %>
        					</td>
        					<td>
        						<%= rs.getString(3) %>
        					</td>
        					<td>
        						<%= rs.getString(4) %>
        					</td>
        					<td>
        						<%= rs.getString(8) %>
        					</td>
        					<td>
        						<%= rs.getString(9) %>
        					</td>
        				</tr>
        		
        				<%
        				}
        			
        			}catch(Exception ex){
        				
        				ex.printStackTrace();
        			}
        		 %>
        		 
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
              <li class="active"><a href="cust_info.jsp">Customers</a></li>
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