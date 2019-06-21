package definedJSTL;

import java.io.File;
import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class fetchPopular extends SimpleTagSupport{
	private PageContext pc;
	private String rootAbsolutePath;
	private String rootRelativePath;
	public void setJspContext(JspContext pc) {
		this.pc=(PageContext) pc;
	}
	public void doTag() throws JspException, IOException {
		rootAbsolutePath=(String) pc.getSession().getAttribute("rootAbsolutePath");
		rootRelativePath=(String) pc.getSession().getAttribute("rootRelativePath");
		File root=new File(rootAbsolutePath);
		fun(root);
	}
	public void fun(File root) throws IOException{
		if(root.isDirectory()){
			//获取file文件夹下的所有子节点
			File files[]=root.listFiles();
			//遍历所有
			for(File f:files){
				fun(f);
			}	    
		}
		else{
			//输出文件或文件夹
			pc.getOut().print("<div class=\'col-xs-6 col-md-4\'>");
			pc.getOut().print("<a href=\'"+rootRelativePath+"/display\' target=\'_blank\' class=\'thumbnail\'>");
			pc.getOut().print("<video src=\'"+rootRelativePath+"/video"+root.getName()+"\'>");
			pc.getOut().print("Your browser does not support the video tag.");
			pc.getOut().print("</video>");
			pc.getOut().print("<div class=\'caption\'>");
			pc.getOut().print("<h3>Lua语言介绍</h3>");
			pc.getOut().print("<p>Lua 是一种轻量小巧的脚本语言，用标准C语言编写并以源代码形式开放。</p>");
			pc.getOut().print("</div></a></div>");
		}
	}
}
