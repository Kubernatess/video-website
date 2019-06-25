package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VideoController {
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public String display(HttpServletRequest request) {  		
		String author = request.getParameter("author");
		String videoName = request.getParameter("videoName");
		request.setAttribute("author", author);
		request.setAttribute("videoName", videoName);
		return "display";
	}
}
