<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header.jsp  -->
<%
	String sid = (String)session.getAttribute("id"); //(String)으로 형변환해줘야 인시기함
%>    
<header class="hd">
	<div class="hd_wrap">
		<a href="" class="logo">
			<img src="./img/logo.png" alt="로고타입" />
		</a>
		<nav class="tnb">
			<%
				if(sid=="admin") {
			%>
			<a href="admin.jsp">관리자 페이지</a>
			<a href="logoutCtrl">로그아웃</a>
			<%
				} else if(sid!=null) {
			%>
			<a href="mypage.jsp">마이페이지</a>
			<a href="LogoutCtrl">로그아웃</a>
			<%		
				} else {
			%>
			<a href="joinFrm.jsp">회원가입</a>
			<a href="login.jsp">로그인</a>
			<%
				}
			%>
			<a href="site.map.jsp">사이트맵</a>
		</nav>
		<nav class="gnb">
			<ul>
				<li><a href="company.jsp">Company</a></li>
				<li><a href="product.jsp">Product</a></li>
				<li><a href="service.jsp">Service</a></li>
				<li><a href="">Community</a></li>
				<li><a href="">MemberShip</a></li>
			</ul>
		</nav>
	</div>
</header>
