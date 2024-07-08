package com.employee.dao;

import java.util.List;

import com.employee.entity.employee;

public interface employeeDao 
{
	public employee loginprocess(employee emp);
	
	public employee saveEmployee(employee emp);

	public List<employee> emplist();
	
	public employee employeeCall(int id);
	
	public boolean employeeDelete(int id);
	
	public employee employeeupdate(employee emp);

}
