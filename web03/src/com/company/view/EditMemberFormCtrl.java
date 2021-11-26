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

import com.company.model.MemberVO;

@WebServlet("/EditMemberFormCtrl")
public class EditMemberFormCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String uid = request.getParameter("id");
		
		//컨넥터/상태코드/DB 관련 변수에 대한 선언
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버로딩~sql 실행
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select * from member where userid=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, uid);
			System.out.println(uid);
			rs = stmt.executeQuery();
			MemberVO mem = new MemberVO();
			
			if(rs.next()) {
				mem.setUserid(rs.getString("userid"));
				mem.setPasswd(rs.getString("passwd"));
				mem.setBirth(rs.getInt("birth"));
				mem.setRegdate(rs.getDate("regdate"));
				mem.setName(rs.getString("name"));
				mem.setPoint(rs.getInt("point"));
				mem.setVisited(rs.getInt("visited"));
				mem.setYesno(rs.getString("yesno"));
			} else {
				response.sendRedirect("GetMemberListCtrl");
			}
			
			request.setAttribute("mem", mem);
			RequestDispatcher view = request.getRequestDispatcher("editMemberForm.jsp");
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