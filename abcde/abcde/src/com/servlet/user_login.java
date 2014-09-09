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
public class user_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_login() {
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
		
			String User_MailID=request.getParameter("uMailID");
			String User_Password=request.getParameter("uPass");
			
		if(User_MailID.startsWith("A")){
			
			RequestDispatcher rd = request.getRequestDispatcher("admin_login");
					rd.include(request, response);
		}else{
		
		try {
			//String User_MailID=request.getParameter("uMailID");
		//	String User_Password=request.getParameter("uPass");
	
			Connectdb cdb=new Connectdb();
			cdb.connect_databse();
			
			String sql="select * from user_info where User_MailID='"+User_MailID+"' and User_Password='"+User_Password+"'";
			
				ResultSet rs=cdb.stmt.executeQuery(sql);
				
				int i=0;
				String name = null;
				String uid = null;
				System.out.println("Rahul");
				
				while(rs.next())
				{
					System.out.println("in Resultset");
					if(rs.getString(10).equals("1") ){
					if(rs.getString(3).equals(User_MailID) && rs.getString(4).equals(User_Password)) 
					{
						i=1;
						//System.out.println(i);
						name=rs.getString(2);
						uid=rs.getString(1);
						//System.out.println(name);
						break;
						
					}
					
					}
					else{
						RequestDispatcher rd=request.getRequestDispatcher("blockUser.jsp");
						   rd.forward(request, response);
						
					}
				}
				
				if(i==1)
				{
					
					 HttpSession session=request.getSession(true);
					System.out.println(session.isNew()); 
					   session.setAttribute("uName", name);
					   session.setAttribute("uid", uid);
					response.sendRedirect("user_home.jsp");
				   
		  
		  
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

}
