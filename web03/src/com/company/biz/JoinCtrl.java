package com.company.biz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/JoinCtrl")
public class JoinCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		int ubirth =Integer.parseInt(request.getParameter("ubirth"));
		String uname = request.getParameter("uname");
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		try { Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection(url,id,pw);
			sql="insert into member values (?,?,?,sysdate,?,100,1,'YES')";
			stmt=con.prepareStatement(sql);
			stmt.setString(1,uid);
			stmt.setString(2, upw);
			stmt.setInt(3, ubirth);
			stmt.setString(4, uname);
		int cnt=stmt.executeUpdate();
		if(cnt>=1) {
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("joinForm.jsp");
		}
			stmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
			
		}
	}

}
