<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

<link rel="stylesheet" href="./css/common.css/"/>
</head>
<body>
<div class="container">
<%@ include file = "header.jsp" %>
	<div class="content">
	<h2 class="tit">로그인</h2>
	<form action="loginCtrl" method="post" class="frm" id="frm" name="frm">
	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd"><label for="uid">아이디</label></th>
				<td class="col_data"><input type="text" name="uid" id="uid" class="in_data" required></td>	
			</tr>
			<tr>
				<th class="col_hd"><label for="upw">비밀번호</label></th>
				<td class="col_data"><input type="password" name="upw" id="upw" class="in_data" required></td>
			</tr>	
		</tbody>
	</table>
	<div class="fr_wrap">
		<ul>
			<li class="col_btn">
				<input type="submit" value="로그인" class="in_btn"/>
			</li>	
			<li class="col_btn">
				<input type="reset" value="취소" class="in_btn"/>
			</li>
			<li class="col_btn">
				<input type="submit" value="회원가입" class="in_btn"/>
			</li>	
		</ul>
			
	</div>
	</form>
	</div>
<%@ include file = "footer.jsp" %>
</div>
</body>
</html>