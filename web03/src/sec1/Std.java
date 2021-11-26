package sec1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Std")
public class Std extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Std() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String ad=null;
		int age = Integer.parseInt(request.getParameter("age"));
		if(age>=20) {
			ad="성년";
			}
		else {
			ad="미성년";
		}
		out.println("당신의 이름은 "+name+"이며 ,"+" 나이는 "+age+"세이고 ,"+ad+" 입니다.");
		}		
}


