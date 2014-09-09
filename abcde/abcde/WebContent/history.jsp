<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.beans.Connectdb" %>
<head>

<title>History</title>

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
          <li><a href="user_home.jsp">Home</a></li>
          <li class="active"><a href="history.jsp">History</a></li>
          <li><a href="http://localhost:8080/abcde/user_auth">Book Ad</a></li>
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
            <h2><span>History</span></h2>
            <hr></hr>
            <h2> <span>Your Customer ID No. is </span> <%= session.getAttribute("uid") %></h2>
            <div class="clr"></div>
           
        	 <%
        		try{
        			
        			String User_Id = (String) session.getAttribute("uid");
        			
        			Connectdb cdb = new Connectdb();
        			cdb.connect_databse();
        			
        			String sql = "select * from booking_info where uid = '" +User_Id+"'";
        			
        				ResultSet rs = cdb.stmt.executeQuery(sql);
        				
        				int i=0;
        				
        				//System.out.println(" in Rs");
        				%>
        				<br></br>
        				<table border="1" cellpadding ="10">
        				<tr bgcolor="#e0e0e0">
        					<th> 
        						Reference No.
        					</th>	
        					<th>
        						Ad Name
        					</th>
        					<th>
        						Ad Type
        					</th>
        					<th>
        						Book Date
        					</th>
        					<th>
        						Ad Content
        					</th>
        					<th>
        						Newspaper ID
        					</th>
        					<th>
        						Ad Status
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
        						<%= rs.getString(3) %>
        					</td>
        					<td>
        						<%= rs.getString(4) %>
        					</td>
        					<td>
        						<%= rs.getDate(5) %>
        					</td>
        					<td>
        						<%= rs.getString(6) %>
        					</td>
        					<td>
        						<%= rs.getInt(7) %>
        					</td>
        					<td>
        						<%= rs.getString(8) %>
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
              <li><a href="user_home.jsp">Home</a></li>
              <li class="active"><a href="history.jsp">History</a></li>
              <li><a href="http://localhost:8080/abcde/user_auth">Book Classified Ad</a></li>
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