package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.dao;

import com.beans.admin;
import com.misc.misc;


/**
 * Servlet implementation class user_registration
 */

public class add_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add_admin() {
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
		
		misc ms = new misc();
		int adid = ms.admin_id();
		
		String aid = Integer.toString(adid);
		String admin_name = request.getParameter("aName");
        String admin_mailID = request.getParameter("aMailID");
        String admin_pass = request.getParameter("aPass");
      //  String admin_state = request.getParameter("aState");
        String admin_city = request.getParameter("aCity");
        
      //  int i_state = 0;
   /**     
        try{
        	
        	Connectdb cdb = new Connectdb();
			cdb.connect_databse();
			
			String sql = "select * from state_info where state_name = '" +admin_state+"'";
			
			ResultSet rs = cdb.stmt.executeQuery(sql);
			
			//int i=0;
			
			while (rs.next())
			{
				i_state = rs.getInt(1);
				System.out.println(i_state);
			}
        	
        }catch(Exception ex){
			
			ex.printStackTrace();
		}
     
      //  double d_sRate = Double.parseDouble(statndard_rate);
       // double d_aRate = Double.parseDouble(additional_rate);
        //double d_cRate = Double.parseDouble(color_rate);
       // double d_disc = Double.parseDouble(discount);
    */    
		admin ad = new admin();
		
		ad.setAid(aid);
		ad.setaName(admin_name);
		ad.setaMailID(admin_mailID);
		ad.setaPass(admin_pass);
		//ad.setAstate(i_state);
		ad.setAcity(admin_city);
				       
        dao ud=new dao();
		String reply=ud.addadmin(ad);
		
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
