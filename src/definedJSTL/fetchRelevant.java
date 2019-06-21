package definedJSTL;

import java.io.File;
import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class fetchRelevant extends SimpleTagSupport{
	private PageContext pc;
	private String rootAbsolutePath;
	private String rootRelativePath;
	public void setJspContext(JspContext pc) {
		this.pc=(PageContext) pc;
	}
	public void doTag() throws JspException, IOException{
		rootAbsolutePath=(String) pc.getSession().getAttribute("rootAbsolutePath");
		rootRelativePath=(String) pc.getSession().getAttribute("rootRelativePath");
		File root=new File(rootAbsolutePath);
		fetch(root);
	}
	public void fetch(File root) throws IOException{
		if(root.isDirectory()){
			//获取file文件夹下的所有子节点
			File files[]=root.listFiles();
			//遍历所有
			for(File f:files){
				fetch(f);
			}	    
		}
		else{
			//输出文件或文件夹
			pc.getOut().print("<li class='list-group-item row'>");
			pc.getOut().print("<div class='col-md-6'>");
			pc.getOut().print("<video src=\'"+rootRelativePath+"/video/"+root.getName()+"\'>");
			pc.getOut().print("Your browser does not support the video tag.");
			pc.getOut().print("</video></div>");
			pc.getOut().print("<div class='col-md-6'>");
			pc.getOut().print("<p>"+root.getName()+"</p>");
			pc.getOut().print("<p>视频时长: 20:00</p>");
			pc.getOut().print("</div></li>");
		}
	}
}
