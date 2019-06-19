package controller;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.User;

import org.springframework.ui.ModelMap;
@Controller
public class UserController{ 
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	   public ModelAndView user() {
	      return new ModelAndView("register", "command", new User());
	   }   
	   @RequestMapping(value = "/addUser", method = RequestMethod.GET)
	   public String addStudent(@ModelAttribute("SpringWeb")User user,ModelMap model,HttpSession session) {
	      if(user.getUsername() != null){
	    	  session.setAttribute("username",user.getUsername());
	      }
	      return "redirect:indexPage";
	   }
	   @RequestMapping(value = "/indexPage", method = RequestMethod.GET)
	   public String loginPage() {     
	      return "index";
	   }
}