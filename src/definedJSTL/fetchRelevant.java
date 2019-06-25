package definedJSTL;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.ibatis.session.SqlSession;

import bean.Video;
import mapper.VideoMapper;
import utils.MyBatisUtils;

public class fetchRelevant extends SimpleTagSupport{
	private PageContext pc;
	private SqlSession openSession;
	public void setJspContext(JspContext pc) {
		this.pc=(PageContext) pc;
	}
	public void doTag() throws JspException, IOException{
		openSession = MyBatisUtils.getSqlSessionFactory();
		String path=pc.getServletContext().getContextPath();
		VideoMapper mapper=openSession.getMapper(VideoMapper.class);
		List<Video> videos = mapper.getAllVideoInfo();
		for(Video video:videos){
			pc.getOut().print("<a href=\'"+path+"/display?author="+video.getAuthor()+"&videoName="+video.getVideoName()+"\' target=\'_blank\' class='list-group-item row'>");
			pc.getOut().print("<div class='col-md-6'>");
			pc.getOut().print("<video src=\'"+path+"/video/"+video.getAuthor()+"/"+video.getVideoName()+".mp4\'>");
			pc.getOut().print("Your browser does not support the video tag.");
			pc.getOut().print("</video></div>");
			pc.getOut().print("<div class='col-md-6'>");
			pc.getOut().print("<p>"+video.getVideoName()+"</p>");
			pc.getOut().print("<p> ”∆µ ±≥§: "+video.getDuration()+"</p>");
			pc.getOut().print("</div></a>");
		}
	}
	
}
