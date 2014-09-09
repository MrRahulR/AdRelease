package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.dao;

import com.beans.Connectdb;
import com.beans.admin;


/**
 * Servlet implementation class delete_newspaper
 */
public class delete_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_admin() {
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
		
		String dName = request.getParameter("dName");
		String dCity = request.getParameter("dCity");
		
		int i_city = 0;
		
		 try{
	        	
	        	Connectdb cdb = new Connectdb();
				cdb.connect_databse();
				
				String sql = "select * from city_info where city_name = '" +dCity+"'";
				
				ResultSet rs = cdb.stmt.executeQuery(sql);
				
				//int i=0;
				
				while (rs.next())
				{
					i_city = rs.getInt(1);
				}
	        	
	        }catch(Exception ex){
				
				ex.printStackTrace();
			}
		 
		admin ad = new admin();
		 
		 ad.setaName(dName);
		 ad.setAcity(dCity);
		 
		 dao ud = new dao();
		 String reply = ud.deleteadmin(ad);
		 
		 if(reply.equals("yes"))
			{
				
				RequestDispatcher rd=request.getRequestDispatcher("admin_info.jsp");
				rd.include(request, response);
			}else if(reply.equals("no"))
			{
				
				RequestDispatcher rd=request.getRequestDispatcher("admin_home.jsp");
				rd.include(request, response);
			}
				 
		
		
		
	}

}
