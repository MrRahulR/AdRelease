package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.dao;

import com.beans.admin_update;


/**
 * Servlet implementation class update_newspapaer
 */
public class update_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_admin() {
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
		
		String aId = request.getParameter("aid");
		String aName = request.getParameter("aname");
		String aMailId = request.getParameter("amailid");
		String aAdd = request.getParameter("aAdd");
		String aCity = request.getParameter("acity");
		int aState = Integer.parseInt(request.getParameter("astate"));
				
		admin_update au = new admin_update();
		
		au.setaId(aId);
		au.setaName(aName);
		au.setaMailId(aMailId);
		au.setaAdd(aAdd);
		au.setaCity(aCity);
		au.setaState(aState);
		
		dao ud = new dao();
		String reply = ud.update_admin(au);
		
		if(reply.equals("yes"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("admin_info.jsp");
			rd.include(request, response);
			
		}else if(reply.equals("no"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
			rd.include(request, response);
		}
		
	}

}
