package com.servlet;

import java.io.IOException;





import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;

import user.dao.dao;

import com.beans.payment;


/**
 * Servlet implementation class user_bookdate
 */
public class user_bookdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_bookdate() {
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
		
			String pDate = request.getParameter("date");
			String pType = request.getParameter("payment_option");
			String rid = (String) session.getAttribute("refno");
			int rno = Integer.parseInt(rid);
			
			System.out.println(pType);
			System.out.println(pDate);
			
			payment pay=new payment();
			
			pay.setpDate(pDate);
			pay.setpType(pType);
			pay.setRno(rno);
			
			       
	        dao ud=new dao();
			String reply=ud.insert_payment(pay);
			
			if(reply.equals("yes"))
			{
				
					
				RequestDispatcher rd=request.getRequestDispatcher("success.jsp");
				rd.include(request, response);
				
					
				
			}else if(reply.equals("no"))
			{
				
				RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
				rd.include(request, response);
			}
				 
		
		
		}
	}


