package com.servlet;

import java.io.IOException;
//import java.io.PrintWriter;






import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;

import user.dao.dao;

import com.beans.user;

/**
 * Servlet implementation class user_registration
 */

public class user_feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_feedback() {
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
		HttpSession session = request.getSession();
		
		String User_id = (String) session.getAttribute("uid");
	
      
        String User_Feedback = request.getParameter("message");
        
		user ur=new user();
		
		ur.setFeedback(User_Feedback);
		ur.setUid(User_id);
		
		       
        dao ud=new dao();
		String reply=ud.userfeedback(ur);
		
		if(reply.equals("yes"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("user_home.jsp");
			rd.include(request, response);
		}else if(reply.equals("no"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("user_contact.jsp");
			rd.include(request, response);
		}
			 
	
	
	}

}
