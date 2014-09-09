package com.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;



public class Connectdb {
	
	public Statement stmt;
	public String connect_databse()
	{
		try {
			
			
			
			Class.forName("com.mysql.jdbc.Driver");
		   
		    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AdBooking","root","root");
		   
		    stmt=con.createStatement();
		    
			System.out.print("connection created");
		
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
		
		
		
	}
	

}
