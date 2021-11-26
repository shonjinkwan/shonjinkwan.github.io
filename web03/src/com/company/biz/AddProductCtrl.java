package com.company.biz;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddProductCtrl")
public class AddProductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터 받아오기
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String pronum = request.getParameter("pronum");
		String proname = request.getParameter("proname");
		int proprice = Integer.parseInt(request.getParameter("proprice"));   //"50000" -> parseInt("50000") -> 50000
		int procnt = Integer.parseInt(request.getParameter("procnt"));   //"50000" -> parseInt("50000") -> 50000
		String proimg = request.getParameter("proimg");
		if(proimg=="" || proimg.equals("")) {
			proimg="./img/noImg.png";
		}
		
		//컨넥터,상태정보,DB정보 선언
		Connection con = null;
		PreparedStatement stmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String pass = "tiger";
		String sql;
		
		try {
			//드라이버 로딩 및 연결
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, pass);
			
			//sql구문
			sql = "insert into product values(?, ?, ?, ?, ?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, pronum);
			stmt.setString(2, proname);
			stmt.setInt(3, proprice);
			stmt.setInt(4, procnt);
			stmt.setString(5, proimg);	
			//sql 변수설정 및 실행
			int k = stmt.executeUpdate();
			
			//실행결과를 반환받아 비교
			if(k!=0) {
				response.sendRedirect("GetProductListCtrl");
			} else {
				response.sendRedirect("addProductForm.jsp");
			}
			stmt.close();
			con.close();
		} catch(Exception e) {
			System.out.println("시스템상 오류가 발생하였습니다.");
			e.printStackTrace();
		}
	}
}