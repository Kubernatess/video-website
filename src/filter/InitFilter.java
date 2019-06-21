package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class InitFilter implements Filter{
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//获取/video的磁盘路径
		//D:\apache-tomcat-9.0.11\webapps\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\video-website\video
		String rootAbsolutePath = request.getServletContext().getRealPath("/video");
		//localhost:8080/video-website/
		String rootRelativePath = ((HttpServletRequest) request).getContextPath();
		HttpSession session = ((HttpServletRequest) request).getSession();
		session.setAttribute("rootAbsolutePath", rootAbsolutePath);
		session.setAttribute("rootRelativePath", rootRelativePath);
		chain.doFilter(request, response);
		
	}
}
