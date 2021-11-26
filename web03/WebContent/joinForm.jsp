<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<div class="container">
<%@ include file = "header.jsp" %>
	<div class="content">
	<h2 class="tit">회원가입</h2>
	<form action="JoinCtrl" method="post" class="frm" id="frm" name="frm">
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
			<tr>
				<th class="col_hd"><label for="upw2">비밀번호 재확인</label></th>
				<td class="col_data"><input type="password" name="upw2" id="upw2" class="in_data" required></td>
			</tr>	
			<tr>
				<th class="col_hd"><label for="uname">이름</label></th>
				<td class="col_dara"><input type="text" name="uname" id="uname" class="in_data" required></td>
			</tr>
			<tr>
				<th class="col_hd"><label for="ubirth">생년월일</label>
				<td class="col_data"><input type="text" name="ubirth" id="ubirth" class="in_data" required></td>
			</tr>>
			<tr>
				<th class="fr_col first">
				<input type="submit" value="회원가입" class="in_btn"/>
				</th>
			</tr>
			<tr>
				<th class="fr_col last">
				<input type="reset" value="취소" class="in_btn" />
			</th>	
		</tbody>
	</table>		
	</form>
	<script>
 		document.getElementById("uyesno").addEventListener("click", function(){
 			if(this.value=="yes") {
 				this.value = "no";
 				return false;
 			} else {
 				this.value = "yes";
 			}
 		});
 </script>
   
	<!-- 아이디 중복 체크 및 유효성 검증 체크 스크립트 -->
	<script>
	//window.open("팝업창으로 열어야 할 URL 또는 파일명", "현재창의이름", "환경변수")
	function idCheck() {
		var uid = document.frm.uid.value; 
		window.open("idCheckForm.jsp?id="+uid, "idwin", "width=400, height=350");
	}
/* 	function emailCheck() {
		window.open("emailCheckForm.jsp?email="+uemail, "emailwin", "width=400, height=350");
	} */
	function joinCheck(f){
		if(f.idck.value!="yes"){
			alert("아이디 중복 검사를 진행하지 않으셨습니다.");
			return false;
		}
		if(f.upw.value!=f.upw2.value) {
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			return false;
		}
	}
	</script>	
</body>
</html>