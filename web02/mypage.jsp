<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shop.model.*"  %>
<%
	CustomVO custom = (CustomVO) request.getAttribute("custom");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="content">	
		<form action="UpdateCtrl" method="post" id="frm" name="frm" class="frm">
   <table class="tb">
      <tbody>
         <tr>
            <th class="col_hd">
               <label for="cid">아이디</label>
            </th>
            <td class="col_data">
               <input type="text" id="cid" name="cid" class="in_data"  value='<%=custom.getCid() %>'  readonly required />
            </td>
         </tr>
         <tr>
            <th class="col_hd">
               <label for="cpw" >비밀번호</label>
            </th>
            <td class="col_data">
               <input type="password" id="cpw" name="cpw" class="in_data" value='<%=custom.getCpw() %>'/>
            </td>
         </tr>
         <tr>
            <th class="col_hd">
               <label for="mname">회원명</label>
            </th>
            <td class="col_data">
               <input type="text" id="cname" name="cname" class="in_data" value='<%=custom.getCname() %>'/>
            </td>      
         <tr>
            <th class="col_hd">
               <label for="czip">우편번호</label>
            </th>
            <td class="col_data">
               <input type="text" id="czip" name="czip" class="in_data" value='<%=custom.getCzip() %>'/>
            </td>
         </tr>
         <tr>
            <th class="col_hd">
               <label for="caddr1">주소</label>
            </th>
            <td class="col_data">
               <input type="text" id="caddr1" name="caddr1" class="in_data" value='<%=custom.getCaddr1() %>'/>
            </td>
         </tr>
         <tr>
            <th class="col_hd">
               <label for="caddr2">상세주소</label>
            </th>
            <td class="col_data">
               <input type="text" id="caddr2" name="caddr2" class="in_data" value='<%=custom.getCaddr2() %>'/>
            </td>
         </tr>
         <tr>
            <th class="col_hd">
               <label for="ctel">연락처</label>
            </th>
            <td class="col_data">
               <input type="text" id="ctel" name="ctel" class="in_data" value='<%=custom.getCtel() %>'/>
            </td>
         </tr>  
         <tr>
            <th class="col_hd">
               <label for="cemail">이메일</label>
            </th>
            <td class="col_data">
               <input type="text" id="cemail" name="cemail" class="in_data" value='<%=custom.getCemail() %>'/>
            </td>
         </tr>
         <tr>
            <th class="col_hd">
               <label for="cbirth">생년월일</label>
            </th>
            <td class="col_data">
               <input type="text" id="cbirth" name="cbirth" class="in_data" value='<%=custom.getCbirth() %>'/>
            </td>
         </tr>
         
      </tbody>
   </table>
    <hr />
   <div class="fr_wrap">
      <ul>
         <li><button type="submit" class="in_btn" onclick="">정보수정</button></li>
         <li><button type="reset" class="in_btn" onclick="">취소</button></li>
         <li><a href="OutCtrl" class="in_btn">회원 탈퇴</a></li>
      </ul>      
   </div>   
</form>

</div>
</body>
</html>