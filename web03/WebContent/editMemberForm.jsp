<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.company.model.MemberVO" %>
<%
	MemberVO mem = (MemberVO) request.getAttribute("mem");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 수정</title>
<style>
.tit { padding-top:50px; line-height:50px; text-align:center; }
table { display:table; border-collapse:collapse; }
tr { display:table-row; }
th, td { display:table-cell; }
.tb { width:600px; margin:20px auto; }
.tb th, .tb td { line-height:42px; border-bottom:1px solid #333; }
.tb th { background:#ffd35e; }
.tb tr:first-child th, .tb tr:first-child td { border-top:1px solid #333; } 
.in_data { display:block; line-height:32px; height:32px; margin-left:10px; padding-left:5px; width:240px; }
.btn_wrap { width:220px; margin:20px auto; }
.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
text-align:center; border:0; outline:0; float:left; line-height:38px; }
.btn_wrap .in_btn:hover { background-color:deeppink; }
.in_comment { padding-left:18px; }
input[readonly] { background:#f1f1f1; }
</style>
</head>
<body>
<h2 class="tit">상세 회원 정보 수정</h2>
<form action="EditMemberCtrl" method="post" id="frm" name="frm">
	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="uid">아이디</label>
				</th>
				<td class="col_data">
					<input type="text" id="uid" name="uid" class="in_data" value="<%=mem.getUserid() %>" readonly required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="upw" >비밀번호</label>
				</th>
				<td class="col_data">
					<input type="password" id="upw" name="upw" class="in_data" value="<%=mem.getPasswd() %>" readonly />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="uname">회원명</label>
				</th>
				<td class="col_data">
					<input type="text" id="uname" name="uname" class="in_data" value="<%=mem.getName() %>" />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="ubirth">출생년도</label>
				</th>
				<td class="col_data">
					<input type="text" id="ubirth" name="ubirth" class="in_data" value="<%=mem.getBirth() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="uregdate">가입일</label>
				</th>
				<td class="col_data">
					<input type="text" id="uregdate" name="uregdate" class="in_data" value="<%=mem.getRegdate() %>" readonly />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="upoint">포인트</label>
				</th>
				<td class="col_data">
					<input type="text" id="upoint" name="upoint" class="in_data" value="<%=mem.getPoint() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label>방문횟수</label>
				</th>
				<td class="col_data">
					<span class="in_comment"><%=mem.getVisited() %></span>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="uyesno">정회원 유무</label>
				</th>
				<td class="col_data">
					<span class="in_comment">
					<%
						if(mem.getYesno().equals("YES")) {
					%>		
						<input type="checkbox" id="uyesno" name="uyesno" checked value="yes"/>
					<%			
						} else {
					%>
						<input type="checkbox" id="uyesno" name="uyesno" value="no"/>
					<%		
						}
					 %>
					 </span>
				</td>
			</tr>
		</tbody>
	</table>
    <hr />
	<div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">수정</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
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
</body>
</html>