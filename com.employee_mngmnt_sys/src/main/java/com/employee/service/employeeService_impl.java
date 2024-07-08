package com.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.employee.dao.employeeDao;
import com.employee.entity.employee;

@Service
public class employeeService_impl implements employeeService
{
    @Autowired
    employeeDao dao;
    
	@Override
	
	public employee loginprocess(employee emp)
	{
		employee empl=dao.loginprocess(emp);
		
		System.out.println(empl);
		
		return empl;
	}

	@Override
	public employee saveEmployee(employee emp) {
		
	employee employee=	dao.saveEmployee(emp);
	
		return employee;
	}

	@Override
	public List<employee> emplist() {
		// TODO Auto-generated method stub
		List<employee> employees=dao.emplist();
		return employees;
	}

	@Override
	public employee employeeCall(int id) {
		// TODO Auto-generated method stub
		  employee empl =dao.employeeCall(id);
		return empl ;
	}

	@Override
	public boolean employeeDelete(int id) {
		// TODO Auto-generated method stub
	boolean msg=dao.employeeDelete(id);
		return msg;
	}

	@Override
	public employee employeeupdate(employee emp)
	{
		// TODO Auto-generated method stub
		 employee empl=dao.employeeupdate(emp);
		return empl;
	}

}
