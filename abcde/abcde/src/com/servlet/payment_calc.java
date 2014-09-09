package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.dao;

import com.beans.Connectdb;
import com.beans.payment;
import com.misc.misc;


/**
 * Servlet implementation class payment_calc
 */
public class payment_calc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payment_calc() {
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
		
		int lines = (Integer) session.getAttribute("lines");
		double dfpayment = 0,payment = 0;
		int ex_lines;
		Double extra_payment;
		int N_id = (Integer) session.getAttribute("nid");
		
		if (lines <= 20){
			
			extra_payment = 0.0;
		
	}else{
		
			ex_lines = lines - 20;
			extra_payment = (double) (3 * (ex_lines));
	}
		
		misc ms = new misc();
		int pid = ms.payment_no();
		int rno = (Integer) session.getAttribute("rno");
		
		
		
		try{
			Connectdb cdb=new Connectdb();
			cdb.connect_databse();
			
			String sql="select * from newspaper_info where newspaper_id='"+N_id+"'";
			
				ResultSet rs=cdb.stmt.executeQuery(sql);
				
				int i=0;
				//String rno = null;
				//String uid = null;
				System.out.println("Rahul");
				
				while(rs.next())
				{
					//System.out.println("in Resultset");
					
						i=1;
						dfpayment = rs.getDouble(3);
						break;
				}
				
				 payment = dfpayment + extra_payment;
		
		
			session.setAttribute("dfPayment", dfpayment);
			//RequestDispatcher rd=request.getRequestDispatcher("user_payment.jsp");
			//rd.include(request, response);
	
		}catch(Exception e )
		{
			e.printStackTrace();
		}
		
				payment pay = new payment();
				
				pay.setPid(pid);
				pay.setRno(rno);
				pay.setPayment(payment);
				
				dao ud = new dao();
				String reply= ud.payment_info(pay);			
				
				if(reply.equals("yes"))
				{
					session.setAttribute("extra_payment", extra_payment);
					session.setAttribute("payment", payment);
					RequestDispatcher rd=request.getRequestDispatcher("user_payment.jsp");
					rd.include(request, response);
			
				}else if(reply.equals("no"))
				{
					
					RequestDispatcher rd=request.getRequestDispatcher("bookAd.jsp");
					rd.include(request, response);
				}
				
				
		}
	}

