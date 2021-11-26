package com.company.biz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteNoticeListCtrl")
public class deleteNoticeListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		PreparedStatement stmt = null;
		String[]ck=request.getParameterValues("ck");
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String id ="scott";
		String pw ="tiger";
		String sql;
		
		try { 
			  Class.forName("oracle.jdbc.OracleDriver");
			  con= DriverManager.getConnection(url,id,pw);
			  int cnt = 0;
			  for(int i=0;i<ck.length;i++) {
				  sql="delete from notice where title = ?";
				  stmt=con.prepareStatement(sql);
				  stmt.setString(1, ck[i]);
				  cnt++;
				  stmt.executeUpdate();			
			  }
			  if (cnt!=0) {
				  response.sendRedirect("GetProductListCtrl");
			  }
			stmt.close();
			con.close();
			
			
		} catch(Exception e) {
			e.printStackTrace();
			
			
		}

}
}