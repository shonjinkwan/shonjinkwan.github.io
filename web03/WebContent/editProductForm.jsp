<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.company.model.ProductVO" %>
<%	ProductVO pro = (ProductVO) request.getAttribute("pro"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>

</head>
<body>
<h2 class="tit">상품 상세 수정</h2>
<form action="EditProductCtrl" method="post" id="frm" name="frm">
<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="unum">상품 번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="pronum" name="pronum" class="in_data" value="<%=pro.getPronum() %>" readonly />
				</td>
			</tr>
			
			<tr>
				<th class="col_hd">
					<label for="uname">상품명</label>
				</th>
				<td class="col_data">
					<input type="text" id="proname" name="proname" class="in_data" value="<%=pro.getProname() %>"/>
				</td>
			</tr>		
			<tr>
				<th class="col_hd">
					<table label="uprice">상품 가격</table>
				</th>
				<td class="col_data">
					<input type="number" id="proprice" name="proprice" class="in_data" value="<%=pro.getProprice() %>" />
				</td>			
			</tr>	
			<tr>
				<th class="col_hd">
					<table label="ucnt">상품 수량</table>
				</th>
				<td class="col_data">
					<input type="number" id="procnt" name="procnt"	class="in_data" value="<%=pro.getProcnt() %>"/>
				</td>
			</tr>	
			<tr>
				<th class="col_hd">
					<table label="uimg">상품 이미지</table>
				</th>
				<td class="col_data">
					<img src="<%=pro.getProimg() %>" alt="<%=pro.getProname() %>"  id="proData"/>
					<input type="button" onclick="imgCheck()" value="이미지 변경"/>
					<input type="hidden" name="proimg" id="proimg" value="<%=pro.getProimg() %>" />
					<input type="hidden" name="imgck" id="imgck" value="" />
				</td>	
			</tr>	
			<div class="btn_wrap">	
				<button type="submit" class="in_btn" onclick="">수정</button>
				<button type="reset" class="in_btn" onclick="">취소</button>
			</div>
			</tbody>
	</table>				
</form>
<% System.out.println("응애3");%>
<script>
function imgCheck() {
	window.open("imgCheckForm.jsp", "imguploadcheck", "width=300, height=300");
	return false;
}
function pCheck(f) {
	if(f.imgck.value=="yes"){
		alert("이미지가 변경되었습니다.");
	} else {
		alert("이미지가 변경되지 않았습니다.");
	}
}


	</script>
</body>
</html>