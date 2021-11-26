<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 추가</title>
<style>
* { margin:0; padding:0; }
body, html { width:100%; }
ul { list-style:none; }
.hd { clear:both; height:100px; border-bottom:3px solid #f1f1f1; }
.gnb { width:1140px; margin:10px auto; }
.gnb li { float:left; margin:14px; }
.tit { padding-top:50px; line-height:50px; text-align:center; }
table { display:table; border-collapse:collapse; }
tr { display:table-row; }
th, td { display:table-cell; }
.tb { width:600px; margin:20px auto; }
.tb th, .tb td { line-height:42px; border-bottom:1px solid #333; }
.tb th { background:#ffd35e; }
.tb tr:first-child th, .tb tr:first-child td { border-top:1px solid #333; } 
.in_data { display:block; line-height:32px; height:32px; margin-left:10px; padding-left:5px; width:240px; }
.in_data_area { line-height:1.6; padding:5px; width:400px; margin-left:10px; }
.btn_wrap { width:220px; margin:20px auto; }
.btn_wrap .in_btn { display:block; width:80px; margin:15px; background-color:#333; color:#fff; 
text-align:center; border:0; outline:0; float:left; line-height:38px; }
.btn_wrap .in_btn:hover { background-color:deeppink; }
.in_comment { padding-left:18px; }
input[readonly] { background:#f1f1f1; }
</style>
</head>
<body>
<div class="wrap">
<%@ include file="admin_header.jsp" %>
<h2 class="tit">게시글 글 추가</h2>
<%    
      Connection con = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      int data;
      String url = "jdbc:oracle:thin:@localhost:1521:xe";
      String db_id = "scott";
      String db_pw = "tiger";
      String sql, num2="";
      try {
         Class.forName("oracle.jdbc.OracleDriver");      //드라이버 로딩
         con = DriverManager.getConnection(url, db_id, db_pw); //연결
         sql = "select substr(n_id, 2, 3) as num2 from notice where idx in (select max(idx) from notice)";      //notice 테이블 검색구문 //sql = "select * from notice2 order by par_idx";
         stmt = con.prepareStatement(sql);    //상태(200)연결자에 sql명령 저장
         rs = stmt.executeQuery();//실제 SQL명령을 실행하여 결과를 반환

         if(rs.next()) {      
            data = Integer.parseInt(rs.getString("num2"));      //"006" -> 6
            if(data+1<10){
               num2 = "A00"+(data+1);
            } else if(data+1<100){
               num2 = "A0"+(data+1);
            } else if(data+1<1000) {
               num2 = "A"+(data+1);
            }
%>
<form action="AddNoticeCtrl" method="post" id="frm" name="frm">
   <table class="tb">
      <tbody>
         <tr>
            <th class="col_hd">
               <label for="n_id">글번호</label>
            </th>
            <td class="col_data">
               <input type="text" id="n_id" name="n_id" class="in_data" value="<%=num2 %>" required readonly />
            </td>
         </tr>
         <tr>
            <th class="col_hd">
               <label for="title" >제목</label>
            </th>
            <td class="col_data">
               <input type="text" id="title" name="title" class="in_data"  required />
            </td>
         </tr>
         <tr>
            <th class="col_hd">
               <label for="content">글 내용</label>
            </th>
            <td class="col_data">
               <textarea id="content" name="content" class="in_data_area"  cols="60" rows="15" required>
               </textarea>
            </td>
         </tr>
      </tbody>
   </table>
    <hr />
   <div class="btn_wrap">   
      <button type="submit" class="in_btn" onclick="">등록</button>
      <button type="reset" class="in_btn" onclick="">취소</button>
   </div>   
</form>
<%            
         }
         rs.close();
         stmt.close();
         con.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
%>      
<%@ include file="admin_footer.jsp" %>
</div>
</body>
</html>