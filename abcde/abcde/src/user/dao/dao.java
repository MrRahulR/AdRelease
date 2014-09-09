package user.dao;

import java.sql.SQLException;

import com.beans.admin;
import com.beans.admin_update;
import com.beans.booking_1;
import com.beans.Connectdb;
import com.beans.booking_2;
import com.beans.newspaper;
import com.beans.payment;
import com.beans.update_np;
import com.beans.user;

	
public class dao {
	
	
	public String userregistration(user u)
	{
		    Connectdb cdb=new Connectdb();
	        cdb.connect_databse();
	        String reply="";
	       try
	       {
	       	   
		   
		   String sql1="insert into user_info(User_Name,User_MailID,User_Password,User_Address,User_Country,"
		   			+ "User_State,User_City)"
		   			+ " values ('" + u.getuName() + "','" + u.getuMailID() + "','" + u.getuPass() + "','" + u.getuAdd() +
		   			"','" + u.getCountry() + "','" + u.getState() + "','" + u.getCity() +"')";
			
			int i=0;
			 
				i=cdb.stmt.executeUpdate(sql1);
				
				 if(i!=0)
				 {
					 reply= "yes";
					 
				 }else
				 {
					   reply= "no";
				 }
				
				
				
			} catch (Exception e) {
				reply="no";
				e.printStackTrace();
			}
		return reply;
	}
	
	public String userfeedback(user u)
	{
		    Connectdb cdb=new Connectdb();
	        cdb.connect_databse();
	        String reply="";
	       try
	       {
		   
		   String sql1="update user_info set User_Feedback=' "+ u.getFeedback() + "' where User_ID ='" + u.getUid() + "'";
			
			int i=0;
			 
				i=cdb.stmt.executeUpdate(sql1);
				
				 if(i!=0)
				 {
					 reply= "yes";
					 
				 }else
				 {
					   reply= "no";
				 }
				
				
				
			} catch (Exception e) {
				reply="no";
				e.printStackTrace();
			}
		return reply;
	}
	
	
	 public  String  insert_booking(booking_1 book1)
	    {
	    	String reply;
	    	int i=0;
	    	try {
	    		
	    	
	    	Connectdb cdb=new Connectdb();
	    	cdb.connect_databse();
	    	
	    	String sql="insert into booking_info (Ref_No,uid,ad_name,ad_type,book_date,newspaper_id) "
		    			+ "values"
		    			+ "('"+ book1.getRid() +"','"+book1.getUid()+ "','" + book1.getAd_name() + "','"
		    			+ book1.getAd_type() +"','"+book1.getBook_date()+ "','" +book1.getNewspaper() +"')";
		    	
	    	 
	    		i=cdb.stmt.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	
	    	 if(i!=0)
			 {
				 reply= "yes";
				 
			 }else
			 {
				   reply= "no";
			 }
			
	    	
	    	
	    	return reply;
	    }
	




			public String insert_adcontent(booking_2 book2) {
				String reply;
		    	int i=0;
		    	try {
		    		
		    	
		    	Connectdb cdb=new Connectdb();
		    	cdb.connect_databse();
		    	
		    	String sql="update booking_info set ad_content='" + book2.getAd_content()
		    			+"' where Ref_No ='" + book2.getRid() +"'";
		    	
		    	 
		    		i=cdb.stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	
		    	
		    	 if(i!=0)
				 {
					 reply= "yes";
					 
				 }else
				 {
					   reply= "no";
				 }
				
		    	
		    	
		    	return reply;
			}
			

			public String payment_info(payment pay) {
				String reply;
		    	int i=0;
		    	try {
		    		
		    	
		    	Connectdb cdb=new Connectdb();
		    	cdb.connect_databse();
		    	
		    	String sql= "insert into payment_info (payment_id,reference_id,payment)"+
		    				"values ('" + pay.getPid() + "','" + pay.getRno() + "','" + pay.getPayment() + "')";
		    	
		    	 
		    		i=cdb.stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	
		    	
		    	 if(i!=0)
				 {
					 reply= "yes";
					 
				 }else
				 {
					   reply= "no";
				 }
				
		    	
		    	
		    	return reply;
			}
			
			public String addnewspaper(newspaper n)
			{
				    Connectdb cdb=new Connectdb();
			        cdb.connect_databse();
			        String reply="";
			       try
			       {
			       	   
				   
				   String sql1="insert into newspaper_info(newspaper_name,standard_rate,additional_letter_rate,"
					   			+ "color_rate,city_id)"
					   			+ " values ('" + n.getnName() + "','" + n.getnRate() + "','" + n.getnAdRate() + "','" 
					   			+ n.getnColRate() +
					   			"','" + n.getnCity() +"')";
					
					int i=0;
					 
						i=cdb.stmt.executeUpdate(sql1);
						
						 if(i!=0)
						 {
							 reply= "yes";
							 
						 }else
						 {
							   reply= "no";
						 }
						
						
						
					} catch (Exception e) {
						reply="no";
						e.printStackTrace();
					}
				return reply;
			}
			
			public String deletenewspaper(newspaper n)
			{
				    Connectdb cdb=new Connectdb();
			        cdb.connect_databse();
			        String reply="";
			       try
			       {
			       	   
				   
				   String sql1="delete from newspaper_info where newspaper_name = '" + n.getnName() + "' and "
						   + " city_id ='" + n.getnCity() + "'";
					
					int i=0;
					 
						i=cdb.stmt.executeUpdate(sql1);
						
						 if(i!=0)
						 {
							 reply= "yes";
							 
						 }else
						 {
							   reply= "no";
						 }
						
						
						
					} catch (Exception e) {
						reply="no";
						e.printStackTrace();
					}
				return reply;
			}
		
				
			public String addadmin(admin a)
			{
				    Connectdb cdb=new Connectdb();
			        cdb.connect_databse();
			        String reply="";
			       try
			       {
			       	   System.out.println("in DAO");
				   
				   String sql1="insert into admin_info (Admin_ID,Admin_Name,Admin_MailID,Admin_Password"
					   			+ "Admin_City)"
					   			+ " values ('" + a.getAid() + "','" + a.getaName() + "','" + a.getaMailID() + "','" 
					   			+ a.getaPass() +"','" + a.getAcity() + "')";
				   
				   				
					
					int i=0;
					 
					i=cdb.stmt.executeUpdate(sql1);
						
						 if(i!=0)
						 {
							 reply= "yes";
							 
						 }else
						 {
							   reply= "no";
						 }
						
						
						
					} catch (Exception e) {
						reply="no";
						e.printStackTrace();
					}
				return reply;
			}
			
			public String deleteadmin(admin a)
			{
				    Connectdb cdb=new Connectdb();
			        cdb.connect_databse();
			        String reply="";
			       try
			       {
			       	   
				   
				   String sql1="delete from admin_info where Admin_Name = '" + a.getaName() + "' and "
						   + " Admin_City ='" + a.getAcity() + "'";
					
					int i=0;
					 
						i=cdb.stmt.executeUpdate(sql1);
						
						 if(i!=0)
						 {
							 reply= "yes";
							 
						 }else
						 {
							   reply= "no";
						 }
						
						
						
					} catch (Exception e) {
						reply="no";
						e.printStackTrace();
					}
				return reply;
			}
			

			public String insert_payment(payment pay) {
				String reply;
		    	int i=0;
		    	try {
		    		
		    	System.out.println("insert_payment");
		    	Connectdb cdb=new Connectdb();
		    	cdb.connect_databse();
		    	
		    	String sql="update payment_info set publish_date= '" +pay.getpDate() + "' ,payment_type = '" + pay.getpType()
		    			+ " ' where reference_id =' " + pay.getRno() + 
		    			  "'";
		    	
		    	 
		    		i=cdb.stmt.executeUpdate(sql);
		    		System.out.println("Done!!!!");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	
		    	
		    	 if(i!=0)
				 {
					 reply= "yes";
					 
				 }else
				 {
					   reply= "no";
				 }
				
		    	
		    	
		    	return reply;
			}
			
			public String update_newspapaer(update_np update) {
				String reply;
		    	int i=0;
		    	try {
		    		
		    	//System.out.println("insert_payment");
		    	Connectdb cdb=new Connectdb();
		    	cdb.connect_databse();
		    	
		    	String sql="update newspaper_info set additional_letter_rate = '"
		    				+ update.getUnar() +  "',standard_rate = '" + update.getUnsr() + "',color_rate = '" + update.getUncr() + "',discount = '" + update.getUndr() +
		    				"' where newspaper_id = '" + update.getNpId() + "'" ;
		    	
		    	 
		    		i=cdb.stmt.executeUpdate(sql);
		    		//System.out.println("Done!!!!");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	
		    	
		    	 if(i!=0)
				 {
					 reply= "yes";
					 
				 }else
				 {
					   reply= "no";
				 }
				
		    	
		    	
		    	return reply;
			}
			
			public String update_admin(admin_update admin) {
				String reply;
		    	int i=0;
		    	try {
		    		
		    	//System.out.println("insert_payment");
		    	Connectdb cdb=new Connectdb();
		    	cdb.connect_databse();
		    	
		    	String sql="update admin_info set Admin_Name = ' " +admin.getaName() + "',Admin_MailID = '" + admin.getaMailId()
		    				+ "', Admin_Address='" +admin.getaAdd() + "',Admin_City='" + admin.getaCity() +
		    				"',Admin_State='" +admin.getaState()+ "' where Admin_ID = '" + admin.getaId() + "'" ;
		    	
		    	 
		    		i=cdb.stmt.executeUpdate(sql);
		    		//System.out.println("Done!!!!");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	
		    	
		    	 if(i!=0)
				 {
					 reply= "yes";
					 
				 }else
				 {
					   reply= "no";
				 }
				
		    	
		    	
		    	return reply;
			}
}
