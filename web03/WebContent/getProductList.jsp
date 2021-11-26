<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* " %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="com.company.model.ProductVO"  %>
<%
	ArrayList<ProductVO> proList = (ArrayList<ProductVO>) request.getAttribute("ProductList");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 관리</title>
<style>
	.tit { text-align:center; }
table { display:table; border-collapse:collapse; text-align:center; }
tr { display:table-row; }
th, td { display:table-cell; }
.tb { width:600px; margin:20px auto; }
.tb th, .tb td { line-height:36px; border-bottom:1px solid #333; }
.tb th { border-top:2px solid #333; background:white; }
.tb tbody tr:nth-child(2n) td { background:pink; }
.btn_wrap { width:220px; margin:20px auto; }
	.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
	text-align:center; border:0; outline:0; float:left; line-height:38px; }
	.btn_wrap .in_btn:hover { background-color:skyblue; }
	.ft { clear:both; height: 120px; background-color: #333; }
    .ft_wrap { width: 1000px; margin: 0 auto; padding-top:20px; padding-bottom:20px; color:#fff; }
</style>
</head>

<body>
<div class="wrap">
<%@ include file="admin_header.jsp" %>
	<h2 class="tit">제품 관리</h2>
	<table class="tb">
		<thead>
			<tr>
				<th class="item1">상품넘버</th>
				<th class="item2">상품명</th>
				<th class="item3">상품가격</th>
				<th class="item4">상품개수</th>
				<th class="item5">상품이미지</th>
				<th class="item6">편집</th>
			</tr>
			</thead>
			<tbody>
<form action="deleteProductCtrl" method="post" name="delform" onsubmit="return frm_submit(this)">
<%
	for(int i=0;i<proList.size();i++){
		ProductVO pro = proList.get(i);
%>			
	<tr>
		<td class="item1"><a href="EditProductFormCtrl?id=<%=pro.getPronum() %>"><%=pro.getPronum() %></td>
		<td class="item2"><%=pro.getProname() %></td>
		<td class="item3"><%=pro.getProprice() %></td>
		<td class="item4"><%=pro.getProcnt() %></td>
		<td class="item6"><%=pro.getProimg() %></td>
		<td class="item7">
			<input type="checkbox"  name="ck"  id="ck<%=i %>"  class="ck_item" value="<%=pro.getProname() %>"/>
		</td>
	</tr>
<%
	}
%>	
	</tbody>
  </table>
  <div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">삭제</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
		<a href="addProductForm.jsp" class="in_btn">추가</a>
	</div>	
</form>
<script>
function frm_submit(f){
	var sel = 'input[name="ck"]:checked';
	var item = document.querySelectorAll(sel);
	var cnt = item.length;
	if (cnt==0){
		alert("삭제할 요소를 선택하지 않았습니다.")
		return false;
	} else{
		var qt = confirm("정말 삭제하시겠습니까?");
		if(qt) {
			f.submit();
		} else {
			return false;
	}
}
}
</script>
<%@ include file="admin_footer.jsp" %>
</div>
</body>
</html>