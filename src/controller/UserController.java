package controller;
import java.io.IOException;

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
import mapper.UserMapper;
import utils.MyBatisUtils;

import org.springframework.ui.ModelMap;
@Controller
public class UserController{ 
	private SqlSession openSession;
    @RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView user() {
    	return new ModelAndView("register", "command", new User());
	}   
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUser(@ModelAttribute("SpringWeb")User user,ModelMap model,HttpSession session) throws IOException {
		openSession = MyBatisUtils.getSqlSessionFactory();
		UserMapper mapper=openSession.getMapper(UserMapper.class);
		user.setVIP(false);
		mapper.addUser(user);
	    openSession.commit();
		if(user.getUsername() != null){
			session.setAttribute("username",user.getUsername());
	    }
	    return "redirect:index";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexPage() {  	
		return "index";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {  		
		return "login";
	}
	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public String loginSuccess(String username,String password,HttpSession session) {  
		if(username != null){
			session.setAttribute("username",username);
	    }
		return "redirect:index";
	}
	
	
}