package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class fetch_newspaper
 */
public class fetch_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fetch_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
		
			PrintWriter out = response.getWriter();
		
			String uId = request.getParameter("uName");
			
			try{
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adbooking", "root", "root");
				Statement stmt = conn.createStatement();
				
				String sql = "select * from admin_info where Admin_ID = '" + uId + "'";
			
				ResultSet rs = stmt.executeQuery(sql);
				
				
				
				while(rs.next())
				{
					out.println( "<!DOCTYPE html>" +
							     "<html>" +
							     "<head>" +
							     "<title>Update Admin</title>" +
							     "</head>" +
							     "<body style=\"background:CYAN\">");
					out.println("<form action = \"update_admin\" method = \"post\">");
				    out.println("<br>Admin ID  <input type=text name=aid value="+rs.getString(1)+">");
					out.println("<br>Admin Name  <input type=text name=aname value="+rs.getString(2)+">" +
							"" +"<br>Admin Mail ID  <input type=text name=amailid value="+rs.getString(3)+">" +
							"" +"<br>Admin Address<input type=text name=aAdd value="+rs.getString(5)+">"+
							"" +"<br>Admin State <input type=text name=astate value="+rs.getString(7)+">"+
							"" +"<br>Admin City <input type=text name=acity value="+rs.getString(8)+">"+
							"" +"<br><input type=submit value = \" Update\">" + "</form> </body></html>");
				}
			
			}
			catch(Exception e){
				
				e.printStackTrace();
			}
		}
		
	
	}


