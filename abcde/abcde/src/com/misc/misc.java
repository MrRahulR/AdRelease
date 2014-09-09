package com.misc;

import java.sql.Date;
import java.util.Random;
public class misc {

	public misc() {
		// TODO Auto-generated constructor stub
	}

	 public Date booking_date()
	    {
	    	java.util.Date today = new java.util.Date();
	   	 Date date=new Date(today.getTime());
	    	
	    	
	    	return date;
	    }
	
	 public int payment_no()
		{
			Random random=new Random();
		    int i=	random.nextInt(1000000);
			
			
			return i;
		}
	 
	 public int admin_id()
		{
			Random random=new Random();
		    int i=	random.nextInt(1000000);
			
			
			return i;
		}
	 
	 public int reference_no()
		{
			Random random=new Random();
		    int i=	random.nextInt(1000000);
			
			
			return i;
		}
}

