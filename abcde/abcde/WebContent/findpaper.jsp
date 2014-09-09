<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>

</head>
<body>
<%
	Connection c = null;
	Statement st = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/adbooking", "root", "root");
		st = c.createStatement();
	} catch (Exception e) {
		e.printStackTrace();
	}
	if (request.getParameter("country") != null) {
		String country = request.getParameter("country");
		
		int id = Integer.parseInt(country);

		/*
		
		if u want to select it from database then just use query
		 *
		 *
		 *              select state from table where country = '"+country+"'
		 *
		 *
		 * i am just using comparision operator
		 */

		//if(country.equals("india")){
	
			try {
			String sql2 = "select state_id,state_name from state_info where country_id='"+ id + "' order by state_name";
			ResultSet rs1 = st.executeQuery(sql2);
%>
<select name="state" id="state" onchange="showCity()">
	<option >Select State</option>
	<%
	
		while (rs1.next()) {
	%>
	
	<option value=<%=rs1.getInt(1)%>><%=rs1.getString(2)%></option>
	<%
		}
	%>
</select>
		<%
			} catch (Exception e) {
					e.printStackTrace();
				}
			}
		%>



<%
	try {
		if (request.getParameter("state") != null) {
			String state = request.getParameter("state");
			
			String sql = "select city_id,city_name from city_info where state_id='"+ state+"'";
			ResultSet rs1 = st.executeQuery(sql);
			//out.println(state);
%><select name="city" id="city" onchange="showarea()">
      <option >Select City</option>
	<%
		while (rs1.next()) {
	%>



	<option value=<%=rs1.getInt(1)%> ><%=rs1.getString(2)%></option>
	<%
		}
	%>
</select>

<%
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>


<%
	try {
		if (request.getParameter("city") != null) {
			String city = request.getParameter("city");
			String sql = "select newspaper_id,newspaper_name from newspaper_info where city_id='"+ city+"'";
			ResultSet rs2 = st.executeQuery(sql);
			//out.println(state);
%><select name="newspaper" id="newsaper" onchange="showdealership()">
<option >Select Newspaper</option>
	<%
		while (rs2.next()) {
	%>



	<option value=<%=rs2.getInt(1)%>><%=rs2.getString(2)%></option>
	<%
		}
	%>
</select>

<%
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>


</body>
</html>