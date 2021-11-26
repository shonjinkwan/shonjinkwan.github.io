<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>  
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%

   request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
   String originalFile, uploadFile;
   try {
   int maxSize = 1024*1024*10;
   //String saveDirectory = config.getServletContext().getRealPath("/img");      //업로드할 디렉토리를 상대경로로 지정
   String saveDirectory = "D:\\shon\\Eclipse\\web\\web03\\WebContent\\img";
//   MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, "utf-8"); 덮어쓰기
   MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, "utf-8", new DefaultFileRenamePolicy());//파일을 지정된 경로에 업로드함
   originalFile = multi.getOriginalFileName("proimg");
   uploadFile = multi.getFilesystemName("proimg");
   //여러 파일인 경우 파일목록을 저장하기
   //Enumeration formName = multi.getFileNames();   //파일 이름 반환
      if (uploadFile==null) {
      out.println("<p>해당 이미지가 업로드 되지 못했습니다..</p>");
   } else {
      out.println("<p>해당 이미지가 업로드 되었습니다.</p>");
      out.println("<a href='javascript:apply(\"" + uploadFile + "\")'>" + uploadFile + "[적용]</a>");
      out.println("<p>적용을 눌러야 업로드 하신 이미지를 사용할 수 있습니다.</p>");
   %>
   <script>
      function apply(id) {
         //opener 부모창
         //opener.document.폼이름.컨트롤이름.value
         opener.document.form.proimg.value =id;
         opener.document.form.imgck.value = "yes";
         window.close();
      }
   </script>
   <%
   }
   }catch (Exception e) {
      System.out.println("파일 업로드가 실패되었습니다.");
      e.printStackTrace();
   } 
   %>