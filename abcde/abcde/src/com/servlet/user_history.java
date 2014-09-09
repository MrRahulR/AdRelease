package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Connectdb;

/**
 * Servlet implementation class user_history
 */
public class user_history extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_history() {
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
		
		try{
			
		HttpSession session = request.getSession();
		
		String User_Id = (String) session.getAttribute("uid");
		
		Connectdb cdb = new Connectdb();
		cdb.connect_databse();
		
		String sql = "select * from booking_info where uid = '" +User_Id+"'";
		
			ResultSet rs = cdb.stmt.executeQuery(sql);
			
			//int i=0;
			
			while(rs.next()){
				
				
			}
		
		}catch(Exception ex){
			
			ex.printStackTrace();
		}
	}

}
