package com.company.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.ProductVO;

@WebServlet("/GetProductListCtrl")
public class GetProductListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs = null;
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		try {	
			Class.forName("oracle.jdbc.OracleDriver");	
			con=DriverManager.getConnection(url, id, pw);	
			sql="select * from product";	
			stmt=con.prepareStatement(sql);	
			rs=stmt.executeQuery();
			
			ArrayList<ProductVO> ProductList = new ArrayList<ProductVO>();
			
			while(rs.next()) {
				String u_pronum = rs.getString("pronum");
				String u_proname = rs.getString("proname");
				int u_proprice = rs.getInt("proprice");
				int u_procnt = rs.getInt("procnt");
				String u_proimg = rs.getString("proimg");
				System.out.println("객체 생성");
				
				ProductVO pro= new ProductVO();	
				pro.setPronum(u_pronum);
				pro.setProname(u_proname);
				pro.setProprice(u_proprice);
				pro.setProcnt(u_procnt);
				pro.setProimg(u_proimg);

				ProductList.add(pro);
			}
			request.setAttribute("ProductList", ProductList);	
			RequestDispatcher view = request.getRequestDispatcher("getProductList.jsp");  
			view.forward(request, response);	
			rs.close();
			stmt.close();
			con.close();	
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}

}
