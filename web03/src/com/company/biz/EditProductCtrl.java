package com.company.biz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EditProductCtrl")
public class EditProductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String unum = request.getParameter("pronum");
		String uname = request.getParameter("proname");
		int uprice = Integer.parseInt(request.getParameter("proprice"));
		int ucnt = Integer.parseInt(request.getParameter("procnt"));
		String uimg = request.getParameter("proimg");
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String id ="scott";
		String pw="tiger";
		String sql; 
		try { Class.forName("oracle.jdbc.OracleDriver");
			 con = DriverManager.getConnection(url,id,pw);
			 sql = "update product set proname=?,proprice=?,procnt=?,proimg=? where pronum=?";
			 stmt = con.prepareStatement(sql);
			 stmt.setString(1, uname);
			 stmt.setInt(2, uprice);
			 stmt.setInt(3, ucnt);
			 stmt.setString(4, uimg);
			 stmt.setString(5, unum);
			 
			 int cnt = stmt.executeUpdate();
				if(cnt == 0) { 
					response.sendRedirect("EditProductFormCtrl");
				} else {
					response.sendRedirect("GetProductListCtrl");
				}
			
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}

}
