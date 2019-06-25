package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	@RequestMapping(path = "/upload")
	public String handleFormUpload(@RequestParam("video_name") String video_name,@RequestParam("describe") String describe, @RequestParam("upload") MultipartFile uploadfile) throws IOException {
		System.out.println(video_name);
        if (!uploadfile.isEmpty()) {
            byte[] bytes = uploadfile.getBytes();
            // store the bytes somewhere
            System.out.println(bytes);
            return "redirect:uploadSuccess";
        }

        return "redirect:uploadFailure";
    }
}
