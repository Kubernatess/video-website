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
import mapper.UserMapper;
import mapper.VideoMapper;
import utils.MyBatisUtils;

public class fetchPopular extends SimpleTagSupport{
	private PageContext pc;
	private String rootAbsolutePath;
	private String rootRelativePath;
	private SqlSession openSession;
	public void setJspContext(JspContext pc) {
		this.pc=(PageContext) pc;
	}
	public void doTag() throws JspException, IOException {
		openSession = MyBatisUtils.getSqlSessionFactory();
		rootAbsolutePath=(String) pc.getSession().getAttribute("rootAbsolutePath");
		rootRelativePath=(String) pc.getSession().getAttribute("rootRelativePath");
		File root=new File(rootAbsolutePath);
		fetch(root);
	}
	public void fetch(File root) throws IOException{
		if(root.isDirectory()){
			//��ȡfile�ļ����µ������ӽڵ�
			File files[]=root.listFiles();
			//��������
			for(File f:files){
				fetch(f);
			}	    
		}
		else{
			openSession = MyBatisUtils.getSqlSessionFactory();
			System.out.println("fetchpopular:"+openSession);
			VideoMapper mapper=openSession.getMapper(VideoMapper.class);
			List<Video> videos = mapper.getAllVideoInfo();
			System.out.println(videos);
			pc.getOut().print("<div class=\'col-xs-6 col-md-4\'>");
			//���ݲ���videoName��displayҳ��,ʹdisplayҳ����ʾ�ض�����
			pc.getOut().print("<a href=\'"+rootRelativePath+"/display?videoName="+root.getName()+"\' target=\'_blank\' class=\'thumbnail\'>");
			pc.getOut().print("<video src=\'"+rootRelativePath+"/video/"+root.getName()+"\'>");
			pc.getOut().print("Your browser does not support the video tag.");
			pc.getOut().print("</video>");
			pc.getOut().print("<div class=\'caption\'>");
			pc.getOut().print("<h3>Lua���Խ���</h3>");
			pc.getOut().print("<p>Lua ��һ������С�ɵĽű����ԣ��ñ�׼C���Ա�д����Դ������ʽ���š�</p>");
			pc.getOut().print("</div></a></div>");
		}
	}
}
