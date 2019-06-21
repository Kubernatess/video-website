package controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.User;
import utils.MyBatisUtils;

import org.springframework.ui.ModelMap;
@Controller
public class UserController{ 
	private SqlSession Sqlsession = MyBatisUtils.getSession();
    @RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView user() {
    	return new ModelAndView("register", "command", new User());
	}   
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addStudent(@ModelAttribute("SpringWeb")User user,ModelMap model,HttpSession session) {
		user.setVIP(false);
		Sqlsession.insert("mapper.UserMapper.addUser",user);
	    Sqlsession.commit();
		if(user.getUsername() != null){
			session.setAttribute("username",user.getUsername());
	    }
	    return "redirect:indexPage";
	}
	@RequestMapping(value = "/indexPage", method = RequestMethod.GET)
	public String indexPage(String username,String password,HttpSession session) {  
		if(username != null){
			session.setAttribute("username",username);
	    }
		return "index";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {  		
		return "login";
	}
}