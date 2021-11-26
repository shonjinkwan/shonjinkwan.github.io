package com.company.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Req")
public class ReqHeader extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("request.getScheme()=>"+ request.getScheme()+"<br>");
		out.println("request.getRemoteAddr()=>"+request.getRemoteAddr()+"<br>");
		out.println("request.getRequestURL()=>"+request.getRequestURL()+"<br>");
		out.println("request.getRequestURI()=>"+request.getRequestURI()+"<br>");
		out.println("request.getServletPath()=>"+request.getServletPath()+"<br>");
		out.println("request.getServletContext()=>"+request.getServletContext()+"<br>");
		out.println("request.getHeader(Accept)=>"+request.getHeader("Accept")+"<br>"); //Accept라는 변수 이름을 알아서 사용한 것
		Enumeration<String> headers = request.getHeaderNames();	//헤더 정보를 하나씩
		while(headers.hasMoreElements()) {	//헤더 정보의 카테고리 이름을 모르면서 한번에 찍기
			String hd = headers.nextElement();
			out.println(hd+" => "+request.getHeader(hd)+"<br>");
		}
		out.println(request.getQueryString()); //요청자가 보내온 파라미터=쿼리스트링
		out.println("</body>");
		out.println("</html>");
		
	}

}
