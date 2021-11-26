package com.company.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/req2")
public class reqHeader2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;UTF-8");
		PrintWriter out=response.getWriter();
		
		String id =request.getParameter("id");
		String name = request.getParameter("name");
		
		out.println("당신이 선택한 아이디는"+id+"이고,당신의 이름은"+name+"입니다.");
	}

}
