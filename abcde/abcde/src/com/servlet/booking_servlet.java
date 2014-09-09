package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.dao;

import com.beans.booking_1;
import com.misc.misc;

/**
 * Servlet implementation class booking_servlet
 */
public class booking_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public booking_servlet() {
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
		
			HttpSession session= request.getSession();
			String uid = (String)session.getAttribute("uid");
			String Ad_Name = request.getParameter("adname");
			String Ad_Type = request.getParameter("adtype");
			java.sql.Date book_date;
			String News_Paper = request.getParameter("newspaper");
			
			System.out.println(News_Paper);
			
			booking_1 book1 = new booking_1();
			
			misc m = new misc();
			book_date = m.booking_date();
			
			misc ms = new misc();
			int rid = ms.reference_no();
			
			book1.setRid(rid);
			book1.setUid(uid);
			book1.setAd_name(Ad_Name);
			book1.setAd_type(Ad_Type);
			book1.setBook_date(book_date);
			book1.setNewspaper(News_Paper);
			
			dao dao = new dao();
			String reply = dao.insert_booking(book1);
			
			if(reply.equals("yes"))
			{
							
				session.setAttribute("rno", rid);
				String refno = Integer.toString(rid);
				session.setAttribute("refno", refno);
				int nid = Integer.parseInt(News_Paper);
				session.setAttribute("nid", nid);
				
				if( Ad_Type == "Classified Text"){
					
					RequestDispatcher rd=request.getRequestDispatcher("composeAd.jsp");
					rd.include(request, response);
					
				}else{
					RequestDispatcher rd=request.getRequestDispatcher("imageAd.jsp");
					rd.include(request, response);
					
				}
			
			}
				else if(reply.equals("no"))
			{
				
				RequestDispatcher rd=request.getRequestDispatcher("bookAd.jsp");
				rd.include(request, response);
			}
			
	}
	

	
}