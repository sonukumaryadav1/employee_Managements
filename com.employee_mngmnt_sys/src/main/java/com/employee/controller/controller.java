package com.employee.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.employee.entity.employee;
import com.employee.service.employeeService;

import jakarta.servlet.http.HttpSession;

@RestController
public class controller 
{
   @Autowired
   employeeService service;
	
	@GetMapping(value="/")
	public ModelAndView login()
	{
		System.out.print("hello");
		return new  ModelAndView("login");
	}
	
	@PostMapping(value="/loginprocess")
	public ModelAndView loginprocess(employee emp ,HttpSession session) {
	
		employee empl=service.loginprocess(emp);
		
		System.out.println(empl.getEmployeeDesignation());
		
		if(empl!=null)
		{
			session.setAttribute("name",empl.getEmployeeName());
			
			session.setAttribute("id",empl.getEmployeeId());
			
			session.setAttribute("role", empl.getEmployeeDesignation());
			System.out.println(session.getAttribute("role"));
			
			
			return new ModelAndView("homePage");
		}
		else
		{
			return new ModelAndView("login","msg","invalid user");
		}
		
		
	}
	
	@PostMapping(value="/saveEmployee")
	public ModelAndView saveEmployee(@ModelAttribute employee employee, @RequestParam("pic")MultipartFile file)
	{
	
		
          System.out.println("am in save employyee");
		
		  System.out.println("hhhh"+file.getOriginalFilename());
		
	    	if(file!=null&&!file.isEmpty())
		    {
			
			String photoName=genrateUniqeFileName(file.getOriginalFilename());
			employee.setPhoto(photoName);
			try {
				Files.copy(file.getInputStream(),Paths.get("src/main/webapp/resources/uploads").resolve(photoName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		System.out.println(employee);
		
		employee emp=service.saveEmployee(employee);
		
		if(emp!=null)
		{
			return new ModelAndView("redirect:/eployeeList");
		}
		else
		{
			return new ModelAndView("redirect:/eployeeList");
		}
			
		
	}
	
	
	public String genrateUniqeFileName(String fileName )
	{
		String baseName=FilenameUtils.getBaseName(fileName);
		String getExtenssion=FilenameUtils.getExtension(fileName);
		String timeStamp=String.valueOf(System.currentTimeMillis());
		return baseName+"_"+timeStamp+"."+getExtenssion;
		
	}


	@GetMapping(value="employeeList")
	public ModelAndView emplist()
	
	{
		List<employee> employees=service.emplist();
		for(employee empl:employees) {
			System.out.println(empl);
		}
		
		return new ModelAndView("employeeList","list",employees);
		
	}

	@GetMapping(value="/employeeCall/{id}")
	public employee employeeCall(@PathVariable  int id )
	{
	 employee empl=service.employeeCall(id);
		System.out.println(empl);
		return empl;
		
	}
	
	
	@RequestMapping(value="/employeeDelete/{id}")
	public ModelAndView employeeDelete(@PathVariable int id)
	{
	    boolean msg =service.employeeDelete(id);
	 
		if(msg==true)
		{
         return new ModelAndView("redirect:/employeeList");
		}
		else
		{
		 return new ModelAndView("redirect:/employeeList");	
		}
	
}
  @PostMapping(value="/employeeupdate")	
  public ModelAndView employeeupdate(@ModelAttribute employee emp, @RequestParam("picture")MultipartFile file )
  {
	  
	  System.out.println("in update");
	  
		  System.out.println("hello"+file.getOriginalFilename());
			
	    	if(file!=null&&!file.isEmpty())
		    {
			
			String photoName=genrateUniqeFileName(file.getOriginalFilename());
			emp.setPhoto(photoName);
			try {
				Files.copy(file.getInputStream(),Paths.get("src/main/webapp/resources/uploads").resolve(photoName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		    employee empl= service.employeeupdate(emp);

	    
	    if(empl!=null)
	    {
	    	return new ModelAndView("redirect:/employeeList");
	    }
	    else
	    {
	    	return new ModelAndView("redirect:/employeeList");
	    }
	    
	
	  
  }
	@GetMapping(value="/getemployeeid/{id}")
	public ModelAndView getemployeeid(@PathVariable  int id )
	{
	 employee empl=service.employeeCall(id);
	 
		System.out.println(empl);
		return new ModelAndView("profilePage","empl",empl);
		
	}

	  
  }
