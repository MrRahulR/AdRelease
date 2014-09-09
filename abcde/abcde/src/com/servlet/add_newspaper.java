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
import com.beans.newspaper;


/**
 * Servlet implementation class user_registration
 */

public class add_newspaper extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add_newspaper() {
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
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		
	   // PrintWriter out=response.getWriter();
		
	
        String newspaper_name = request.getParameter("nName");
        String statndard_rate = request.getParameter("nRate");
        String additional_rate = request.getParameter("nAdRate");
        String color_rate = request.getParameter("nColRate");
       // String discount = request.getParameter("nDesc");
        String city = request.getParameter("nCity");
        
        int i_city = 0;
        
        try{
        	
        	Connectdb cdb = new Connectdb();
			cdb.connect_databse();
			
			String sql = "select * from city_info where city_name = '" +city+"'";
			
			ResultSet rs = cdb.stmt.executeQuery(sql);
			
			//int i=0;
			
			while (rs.next())
			{
				i_city = rs.getInt(1);
			}
        	
        }catch(Exception ex){
			
			ex.printStackTrace();
		}
     
        double d_sRate = Double.parseDouble(statndard_rate);
        double d_aRate = Double.parseDouble(additional_rate);
        double d_cRate = Double.parseDouble(color_rate);
       // double d_disc = Double.parseDouble(discount);
        
		newspaper nw = new newspaper();
		
		nw.setnName(newspaper_name);
		nw.setnRate(d_sRate);
		nw.setnAdRate(d_aRate);
		nw.setnColRate(d_cRate);
		//nw.setnDesc(d_disc);
		nw.setnCity(i_city);
				       
        dao ud=new dao();
		String reply=ud.addnewspaper(nw);
		
		if(reply.equals("yes"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("newspaper_info.jsp");
			rd.include(request, response);
		}else if(reply.equals("no"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("admin_home.jsp");
			rd.include(request, response);
		}
			 
	
	
	}

}
