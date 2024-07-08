package com.employee.entity;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class employee {
	@Id
	@GeneratedValue (strategy = GenerationType.AUTO)
	int employeeId;
	String employeeName;
	String employeeAddress;
	String employeeDesignation;
	long mobile;
	String email;
	double salary;
	String possword;
	String Gender;
	Date dob;
	Date doj;
	String Department;
	String Photo;
	public employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public employee(int employeeId, String employeeName, String employeeAddress, String employeeDesignation,
			long mobile, String email, double salary, String possword, String gender, Date dob, Date doj,
			String department, String photo) {
		super();
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.employeeAddress = employeeAddress;
		this.employeeDesignation = employeeDesignation;
		this.mobile = mobile;
		this.email = email;
		this.salary = salary;
		this.possword = possword;
		Gender = gender;
		this.dob = dob;
		this.doj = doj;
		Department = department;
		Photo = photo;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmployeeAddress() {
		return employeeAddress;
	}
	public void setEmployeeAddress(String employeeAddress) {
		this.employeeAddress = employeeAddress;
	}
	public String getEmployeeDesignation() {
		return employeeDesignation;
	}
	public void setEmployeeDesignation(String employeeDesignation) {
		this.employeeDesignation = employeeDesignation;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public String getPossword() {
		return possword;
	}
	public void setPossword(String possword) {
		this.possword = possword;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Date getDoj() {
		return doj;
	}
	public void setDoj(Date doj) {
		this.doj = doj;
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	@Override
	public String toString() {
		return "employee [employeeId=" + employeeId + ", employeeName=" + employeeName + ", employeeAddress="
				+ employeeAddress + ", employeeDesignation=" + employeeDesignation + ", mobile=" + mobile + ", email="
				+ email + ", salary=" + salary + ", possword=" + possword + ", Gender=" + Gender + ", dob=" + dob
				+ ", doj=" + doj + ", Department=" + Department + ", Photo=" + Photo + "]";
	}
	

}
