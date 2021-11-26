package com.company.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.MemberVO;

@WebServlet("/GetMemberListCtrl")
public class GetMemberListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select * from member";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();	
			//select로 검색한 데이터를 저장한 공간 마련
			while(rs.next()) {
				String u_id = rs.getString("userid");
				String u_pw = rs.getString("passwd");
				int u_birth = rs.getInt("birth");
				Date u_regdate = rs.getDate("regdate");
				String u_name = rs.getString("name");
				int u_point = rs.getInt("point");
				int u_visited = rs.getInt("visited");
				String u_yesno = rs.getString("yesno");
				
				MemberVO mem = new MemberVO();	// 한 회원의 컬럼 데이터를 VO에 담는다.
				mem.setUserid(u_id);
				mem.setPasswd(u_pw);
				mem.setBirth(u_birth);
				mem.setRegdate(u_regdate);
				mem.setName(u_name);
				mem.setPoint(u_point);
				mem.setVisited(u_visited);
				mem.setYesno(u_yesno);
				//mem.setYesno(rs.getString("yesno"));
				memberList.add(mem);	//VO에 담긴 여러 건의 데이터들를 List에 담는다. 
			}
			request.setAttribute("memberList", memberList);		//보내질 List 데이터를 지정
			RequestDispatcher view = request.getRequestDispatcher("getMemberList.jsp");  //보내질 곳 지정 
			view.forward(request, response);	//지정한 URL로 데이터를 송신
			rs.close();
			stmt.close();
			con.close();
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}