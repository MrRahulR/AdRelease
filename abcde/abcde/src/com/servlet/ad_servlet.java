package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.dao;

import com.beans.booking_2;




/**
 * Servlet implementation class ad_servlet
 */
public class ad_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ad_servlet() {
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
		
			HttpSession session = request.getSession();
			
			String Ad_Content = request.getParameter("ad_content");
			int Lines= Ad_Content.length();
			String rid = (String) session.getAttribute("refno");
			System.out.println(rid);
			
			//payment pay = new payment();
			booking_2 book2 = new booking_2();
			
			book2.setAd_content(Ad_Content);
			book2.setRid(rid);
			//pay.setLines(Lines);
			
			dao ud = new dao();
			String reply= ud.insert_adcontent(book2);			
			
			if(reply.equals("yes"))
			{
				session.setAttribute("ad_content", Ad_Content);
				session.setAttribute("lines", Lines);
				RequestDispatcher rd=request.getRequestDispatcher("payment_calc");
				rd.include(request, response);
		
			}else if(reply.equals("no"))
			{
				
				RequestDispatcher rd=request.getRequestDispatcher("bookAd.jsp");
				rd.include(request, response);
			}
			
			
	}

}
