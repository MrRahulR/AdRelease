package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.dao;

import com.beans.update_np;

/**
 * Servlet implementation class update_newspapaer
 */
public class update_newspapaer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_newspapaer() {
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
		
		int NpId = Integer.parseInt(request.getParameter("unid"));
		Double Unsr = Double.parseDouble(request.getParameter("unsr"));
		Double Unar = Double.parseDouble(request.getParameter("unar"));
		Double Uncr = Double.parseDouble(request.getParameter("uncr"));
		Double Undr = Double.parseDouble(request.getParameter("undr"));
				
		update_np update = new update_np();
		
		update.setUnsr(Unsr);
		update.setUnar(Unar);
		update.setUncr(Uncr);
		update.setUndr(Undr);
		update.setNpId(NpId);
		
		dao ud = new dao();
		String reply = ud.update_newspapaer(update);
		
		if(reply.equals("yes"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("newspaper_info.jsp");
			rd.include(request, response);
			
		}else if(reply.equals("no"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
			rd.include(request, response);
		}
		
	}

}
