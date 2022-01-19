<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>    
<%@ page import="java.util.*" %>
<%@ page import="com.shop.model.*" %>
<%@ page import="com.shop.biz.*" %>
<%@ page import="com.shop.view.*" %> 
<%
	ArrayList<BasketVO> basketList = (ArrayList<BasketVO>) request.getAttribute("basketList");
%>
<%
	String gprice = request.getParameter("gprice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-latest.js"></script>
<link rel="stylesheet" href="datatables.min.css" />
<script src="/datatables.min.js"></script>
<script src="/masonry.pkgd.js"></script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div class="">
		<h2 class="tit">찜 목록</h2>
		<div class="">
			<table id="basket" class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>상품 코드</th>
						<th>상품 수량</th>
						<th>구매 가능 여부</th>
					</tr>
				</thead>
				<tbody>
<%
	for(int i=0; i<basketList.size(); i++){
		BasketVO bas = basketList.get(i);
%>
					<tr>
						<td>
							<span><%=bas.getBid() %></span>
						</td>
						<td><%=bas.getCid() %></td>
						<td><%=bas.getGcode() %></td>
						<td><%=bas.getBcnt() %></td>
						<td>구매가능</td>
					</tr>
				</tbody>
	<%
	}
	%>
			</table>
		<script>
				//var container = document.querySelector('#mason');
				//var msnry = new Masonry(container);
				$("#mason").masonry();
			</script>
		</div>
	</div>
</body>
</html>