<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.company.model.MemberVO" %> 
<%
	ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList");
	//MemberVO mem = (MemberVO) request.getAttribute("memberList");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<style>
	.tit { text-align:center; }
	.lst { list-style:none; clear:both; border-top:1px solid #333; width:800px; margin:0 auto;  
	height:36px; }
	.lst li { float:left; width:100px; line-height:36px; }
	.lst.lh { border-top:3px solid #333; }
	.lst:last-child { border-bottom:3px solid #333; }
	.btn_wrap { width:220px; margin:20px auto; }
	.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
	text-align:center; border:0; outline:0; float:left; line-height:38px; }
	.btn_wrap .in_btn:hover { background-color:deeppink; }
	.ft { clear:both; height: 120px; background-color: #333; }
    .ft_wrap { width: 1000px; margin: 0 auto; padding-top:20px; padding-bottom:20px; color:#fff; }
</style>
</head>
<body>
<div class="wrap">
<%@ include file="admin_header.jsp" %>
<h2 class="tit">회원 목록</h2>
<ul class="lst lh">
	<li class="item1">회원아이디 </li>
	<li class="item2">회원비밀번호</li>
	<li class="item3">출생년도</li>
	<li class="item4">가입일</li>
	<li class="item5">회원명</li>
	<li class="item6">포인트</li>
	<li class="item7">방문횟수</li>
	<li class="item8">편집</li>
</ul>
<form action="deleteMemberCtrl" method="post" name="delForm" onsubmit="return frm_submit(this)">
<%	
	for(int i=0;i<memberList.size();i++){
		MemberVO mem = memberList.get(i);
%>	
 	<ul class="lst">
		<li class="item1"><a href="EditMemberFormCtrl?id=<%=mem.getUserid() %>"><%=mem.getUserid() %></a></li>
		<li class="item2"><%=mem.getPasswd() %></li>
		<li class="item3"><%=mem.getBirth() %></li>
		<li class="item4"><%=mem.getRegdate() %></li>
		<li class="item5"><a href="EditMemberFormCtrl?id=<%=mem.getUserid() %>"><%=mem.getName() %></a></li>
		<li class="item6"><%=mem.getPoint() %></li>
		<li class="item7"><%=mem.getVisited() %></li>
		<li class="item8">
			<input type="checkbox"  name="ck"  id="ck<%=i %>"  class="ck_item" value="<%=mem.getUserid() %>"/>
		</li>
	</ul>
	
<%
	}
%>
    <hr />
	<div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">삭제</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
	</div>	
</form>
<script>
function frm_submit(f){	//f:form태그에서 보내온 데이터
	var sel = 'input[name="ck"]:checked';	//sel = document.getElementsByClass("ck_item"); var<<선언
	var item = document.querySelectorAll(sel);
	var cnt = item.length;
	if(cnt==0){	//선택체크한 체크박스가 없으면
		alert("삭제할 요소를 선택하지 않았습니다.");//메시지만 띄우고 끝남
		return false;
	} else{	//선택체크된 체크박스가 있으면
		var qt = confirm("정말로 삭제하시겠습니까?");	//지우기 전에 정말로 삭제할 것인지 물어서 [확인]선택
		if(qt){	//qt가 true(확인 대화상자에서[확인]을 누른 경우)이면 폼 데이터 전송
			f.submit();
		} else{	//qt가 false(확인 대화상자에서 [취소]를 누른 경우)이면 아무 일도 일어나지 않음
			return false;
		}
	}
}
</script>
<%@ include file="admin_footer.jsp" %>
</div>
</body>
</html>
	