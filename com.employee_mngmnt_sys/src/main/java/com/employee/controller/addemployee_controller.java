package com.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class addemployee_controller 
{
    @GetMapping(value="/addEmployee")
    public String ADDEMPLOYEE()
    {
    	System.out.println("i am addemployee API");
    	
		return "employeePage";
    	
    }
    
    
   @GetMapping(value="/profile")
   public String profile()
   {
	  
	return "profilePage";
	   
   }
   

   @GetMapping(value="/homePage")
   public String homePage()
   {
	  
	return "homePage";
	   
   }
   

}
