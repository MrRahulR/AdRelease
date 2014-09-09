package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Connectdb;

/**
 * Servlet implementation class user_login
 */
public class admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_login() {
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
		
			String Admin_MailID=request.getParameter("uMailID");
			String Admin_Password=request.getParameter("uPass");
		
		try {
			//String User_MailID=request.getParameter("uMailID");
		//	String User_Password=request.getParameter("uPass");
	
			Connectdb cdb=new Connectdb();
			cdb.connect_databse();
			String sql="select * from admin_info where Admin_MailID='"+Admin_MailID+"' and Admin_Password='"+Admin_Password+"'";
			
				ResultSet rs=cdb.stmt.executeQuery(sql);
				
				int i=0;
				String name = null;
				String aid = null;
				System.out.println("RP");
				
				while(rs.next())
				{
					System.out.println("Resultset");
					if(rs.getString(3).equals(Admin_MailID) && rs.getString(4).equals(Admin_Password)) 
					{
						i=1;
						//System.out.println(i);
						name=rs.getString(2);
						aid=rs.getString(1);
						//System.out.println(name);
						break;
						
					}
					
					
				}
				
				if(i==1)
				{
					
					 HttpSession session=request.getSession(true);
					System.out.println(session.isNew()); 
					   session.setAttribute("aName", name);
					   session.setAttribute("aid", aid);
					 System.out.println("sending...");  
					 
						RequestDispatcher rd=request.getRequestDispatcher("admin_home.jsp");
						   rd.include(request, response);
				   
		  
		  
		}else
		{
			RequestDispatcher rd=request.getRequestDispatcher("index.html?id=notlog");
			   rd.include(request, response);
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	}
	}


