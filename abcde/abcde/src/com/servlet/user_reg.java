package com.servlet;

import java.io.IOException;
//import java.io.PrintWriter;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import user.dao.dao;

import com.beans.user;

/**
 * Servlet implementation class user_registration
 */

public class user_reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_reg() {
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
		
	
        String User_Name = request.getParameter("uName");
        String User_MailID = request.getParameter("uMailID");
        String User_Password = request.getParameter("uPass");
        String User_Address = request.getParameter("uAdd");
        String User_Country = request.getParameter("country");
        String User_State = request.getParameter("state");
        String User_City = request.getParameter("city");
       
       	
		
		user ur=new user();
		
		ur.setuName(User_Name);
		ur.setuMailID(User_MailID);
		ur.setuPass(User_Password);
		ur.setuAdd(User_Address);
		ur.setCountry(User_Country);
		ur.setState(User_State);
		ur.setCity(User_City);
		
		       
        dao ud=new dao();
		String reply=ud.userregistration(ur);
		
		if(reply.equals("yes"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("register_success.jsp");
			rd.include(request, response);
		}else if(reply.equals("no"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
			rd.include(request, response);
		}
			 
	
	
	}

}
