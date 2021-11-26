<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<link rel="stylesheet" href="common2.css" />
</head>
<body>
<%    
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int data;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql, num2="";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");		//드라이버 로딩
			con = DriverManager.getConnection(url, db_id, db_pw); //연결
			sql = "select substr(pronum, 2, 3) as num2 from (select * from product order by pronum desc) where ROWNUM <= 1";		//notice 테이블 검색구문 //sql = "select * from notice2 order by par_idx";
			stmt = con.prepareStatement(sql); 	//상태(200)연결자에 sql명령 저장
			rs = stmt.executeQuery();//실제 SQL명령을 실행하여 결과를 반환

			if(rs.next()) {		
				data = Integer.parseInt(rs.getString("num2"));	   //"008" -> 8
				if(data+1<10){
					num2 = "A00"+(data+1);
				} else if(data+1<100){
					num2 = "A0"+(data+1);
				} else if(data+1<1000) {
					num2 = "A"+(data+1);
				}
%>
<div class="wrap">
<%@ include file="admin_header.jsp" %>
<h2 class="tit">제품 등록</h2>
	<form action="AddProductCtrl" name="frm" id="frm" method="post">
		<table class="tb">
			<tbody>
				<tr>
					<th class="col_hd"><label for="pronum">제품번호</label></th>
					<td class="col_data">
						<input type="text" name="pronum" id="pronum" value="<%=num2 %>" class="in_data"  readonly required/>
					</td>
				</tr>
				<tr>
					<th class="col_hd"><label for="proname">제품명</label></th>
					<td class="col_data">
						<input type="text" name="proname" id="proname" class="in_data" required/>
					</td>
				</tr>
				<tr>
					<th class="col_hd"><label for="proprice">제품가격</label></th>
					<td class="col_data">
						<input type="text" name="proprice" id="proprice" class="in_data" required/>
					</td>
				</tr>
				<tr>
					<th class="col_hd"><label for="procnt">제품수량</label></th>
					<td class="col_data">
						<input type="text" name="procnt" id="procnt" class="in_data" required/>
					</td>
				</tr>
				<tr>
					<th class="col_hd">
						<label for="proimg">제품이미지</label>
					</th>
					<td class="col_data">
						<img src="./img/noImg.png" alt="제품이미지" id="proData"/>
						<input type="button" onclick="imgCheck()" value="이미지 업로드"/>
						<input type="hidden" name="proimg" id="proimg" value=""/>
						<input type="hidden"  name="imgck" id="imgck" value=""/>
					</td>
				</tr>
			</tbody>
		</table>
    <hr />
	<div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">등록</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
	</div>	
	</form>
	<script>
	
	function imgCheck() {
		window.open("imgUploadForm.jsp", "imguploadcheck", "width=300, height=300");
	}
	</script>
<%				
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
%>		
<%@ include file="admin_footer.jsp" %>
</div>
</body>
</html>