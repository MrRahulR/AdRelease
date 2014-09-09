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
public class fetch_newspapers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fetch_newspapers() {
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
		
			String uId = request.getParameter("uid");
			
			try{
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adbooking", "root", "root");
				Statement stmt = conn.createStatement();
				
				String sql = "select * from newspaper_info where newspaper_id = '" + uId + "'";
			
				ResultSet rs = stmt.executeQuery(sql);
				
				
				
				while(rs.next())
				{
					out.println( "<!DOCTYPE html>" +
							     "<html>" +
							     "<head>" +
							     "<title>Update Newspaper</title>" +
							     "</head>" +
							     "<body style=\"background:CYAN\">");
					out.println("<form action = \"update_newspapaer\" method = \"post\">");
				    out.println("<br>Newspaper ID  <input type=text name=unid value="+rs.getString(1)+">");
					out.println("<br>Newspaper name  <input type=text name=unname value="+rs.getString(2)+">" +
							"" +"<br>Standard Rate  <input type=text name=unsr value="+rs.getString(3)+">" +
							"" +"<br>Additional Rate<input type=text name=unar value="+rs.getString(4)+">"+
							"" +"<br>Color Rate <input type=text name=uncr value="+rs.getString(5)+">"+
							"" +"<br>Discount <input type=text name=undr value="+rs.getString(6)+">"+
							"" +"<br>City ID <input type=text name=uncid value="+rs.getString(7)+">"+
							"" +"<br><input type=submit value = \" Update\">" + "</form> </body></html>");
				}
			
			}
			catch(Exception e){
				
				e.printStackTrace();
			}
		}
		
	
	}


