<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="./css/common.css" />
<style>
.frm { width:1020px; margin:0 auto; border-top:3px solid #333; border-bottom:3px solid #333; }
.tb { width:960px; margin:20px auto; }
.fl_con { float:left; margin-right:15px; }
.fr_con { float:right; margin-left:15px; }
</style>
</head>
<body>
<div class="container">
<%@ include file="header.jsp" %>
<div class="content">
<h2 class="tit">회원 가입</h2>
<form action="JoinCtrl" method="post" id="frm" name="frm" onsubmit="return joinCheck(this)" class="frm">
	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="uid">아이디</label>
				</th>
				<td class="col_data">
					<input type="text" id="uid" name="uid" class="in_data fl_con" required />
					<input type="button" value="ID중복 확인" onclick="idCheck()" class="in_btn fl_con"/>
					<input type="hidden" value="" name="idck" id="idck" />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="upw" >비밀번호</label>
				</th>
				<td class="col_data">
					<input type="password" id="upw" name="upw" class="in_data" />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="upw2" >비밀번호 확인</label>
				</th>
				<td class="col_data">
					<input type="password" id="upw2" name="upw2" class="in_data" />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="uname">회원명</label>
				</th>
				<td class="col_data">
					<input type="text" id="uname" name="uname" class="in_data"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="ubirth">출생년도</label>
				</th>
				<td class="col_data">
					<input type="text" id="ubirth" name="ubirth" class="in_data"/>
				</td>
			</tr>
		</tbody>
	</table>
    <hr />
	<div class="fr_wrap">
		<ul>
			<li><button type="submit" class="in_btn" onclick="">가입</button></li>
			<li><button type="reset" class="in_btn" onclick="">취소</button></li>
		</ul>		
	</div>	
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
</div>	
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>