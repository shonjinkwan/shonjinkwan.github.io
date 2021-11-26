<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("id");
	if(uid==null || uid=="") uid = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 중복 체크</title>
</head>
<body>
	<div class="wrap">
		<h3 class="pop_tit">아이디 중복 확인</h3>
		<form action="idCheckPro.jsp" method="post" onsubmit="return invalidCheck(this)">
			<div class="item_fr">	
				<label for="id" class="lb">아이디 : </label>
				<input type="text" name="id" id="id" placeholder="8~12 문자 및 숫자로 입력" value="<%=uid %>" required autofocus />
				<input type="submit" value="중복확인"/>
			</div>	
		</form>
		<script>
		function invalidCheck(f) {
			var id = f.id.value;
			id = id.trim();
			if(id.length<8 || id.length>12) {
				alert("아이디는 글자수가 8이상~12이하 이어야 합니다.");
				return false;
			}
		}
		</script>
	</div>	
</body>
</html>