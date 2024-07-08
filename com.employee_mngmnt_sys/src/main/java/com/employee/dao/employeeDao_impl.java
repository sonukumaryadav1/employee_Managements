package com.employee.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.employee.entity.employee;
@Repository
public class employeeDao_impl implements employeeDao {

	@Autowired
	SessionFactory sf;
	
	@Override
	public employee loginprocess(employee emp) {
		employee empl=null;
	Session session=sf.openSession();
	try {
		Query query=session.createQuery("from employee where email=:email And possword=:pass");
		query.setParameter("email",emp.getEmail() );
		query.setParameter("pass",emp.getPossword() );
		
	    List<employee>list=query.list();
	    System.out.println(list);
	    
	    if(!list.isEmpty())
	    {
	     empl=list.get(0);	
	    }
	} catch (Exception e) 
	{
		e.printStackTrace();
	}
	finally {
		
		session.close();
	}
		return empl;
	}

	@Override
	public employee saveEmployee(employee emp) 
	{
		employee employee=null;
		
		Session ses=sf.openSession();
		Transaction tx=ses.beginTransaction();
		
		try {
			
			ses.save(emp);
			tx.commit();
			employee=emp;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			   ses.close();
		}
		
		
		return employee;
	}

	@Override
	public List<employee> emplist() {
		// TODO Auto-generated method stub
		List<employee> empl=null;
		Session session=sf.openSession();
		try {
			Query query=session.createQuery("from employee");
		    List<employee>list=query.list();
		    empl=list;
		  
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally {
			
			session.close();
		}
			return empl;

}

	@Override
	public employee employeeCall(int id)
	{
		employee empl=null;
		Session ses =sf.openSession();
		Transaction tx=ses.beginTransaction();
		try {
			 employee emp=ses.get(employee.class, id);
			 
			empl =emp;
		} 
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			ses.close();
		}
		
		return empl;
	}

	@Override
	public boolean employeeDelete(int id)
	 {
		
		boolean msg=false;
		Session ses=sf.openSession();
		Transaction tx=ses.beginTransaction();
		
		try {
			 employee emp=ses.get(employee.class, id);
			{
				ses.delete(emp);
				tx.commit();
				msg=true;
			}
		} 
		catch (Exception e)
		{
			System.out.println(e);
		}
		finally 
		{
			ses.close();
		}
	 
		return msg;
	 }

	@Override
	public employee employeeupdate(employee emp)
	{
	   employee empl=null;
	   Session ses=sf.openSession();
	   Transaction tx=ses.beginTransaction();
	   try {
		
		   ses.update(emp);
		   tx.commit();
		   empl=emp;
		   
	} 
	   catch (Exception e)
	   {
		   System.out.println(e);
	   }
	   finally 
	   {
		ses.close();
	  }
	 
	
		return empl;
	}
	}



