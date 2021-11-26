package com.company.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.ProductVO;


@WebServlet("/EditProductFormCtrl")
public class EditProductFormCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String unum = request.getParameter("id");
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		
		try { Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url,id,pw);
			sql = "select * from product where pronum=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, unum);
			rs = stmt.executeQuery();
			ProductVO pro = new ProductVO();	
		
		if(rs.next()) {
			pro.setPronum(rs.getString("pronum"));
			pro.setProname(rs.getString("proname"));
			pro.setProprice(rs.getInt("proprice"));
			pro.setProcnt(rs.getInt("procnt"));
			pro.setProimg(rs.getString("proimg"));
		} else {
			response.sendRedirect("GetProductListCtrl");
		}
		request.setAttribute("pro", pro);
		RequestDispatcher view = request.getRequestDispatcher("editProductForm.jsp");
		view.forward(request, response);
		rs.close();
		stmt.close();
		con.close();
			
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
			
		}
	}

}
