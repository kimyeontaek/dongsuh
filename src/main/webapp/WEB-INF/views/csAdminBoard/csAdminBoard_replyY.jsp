<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/dongsuh/css/dongsuh.css">
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<script>
   $(document).ready(function(){
      $("#reply_button").click(function(){
      //���� ��ȿ�� üũ
      if($("#reply_content").val()==""){
      alert("�亯 ���� �Է��� �ʼ��Դϴ�.");
      $("#reply_content").focus();
      return false;
      }
      csBoard_update.submit();
   });

});
</script>
</head>
<body>
<jsp:include page="../header.jsp"/>
   <div id="cs_div1">
   <div id="cs_div2">
   <p id = "slash_red">/</p>
   <p id = "cs_title">[�����ڿ�]���� ���� ����</p>
   <p class="wave"><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
   </div>
   <table id="csBoard_table1">
      <tr>
         <th>����</th>
         <td id="csBoard_left">${vo.gubun}</td>
         <th>��ȸ ����</th>
         <td>N</td>
      </tr>
      <tr>
         <th>�����</th>
         <td id="csBoard_left">${vo.bdate }</td>
         <th>�����</th>
         <td>${vo.name }</td>
      </tr>
      <tr>
         <th>÷������</th>
         <td id="csBoard_left">
         <c:choose>
             <c:when test="${empty vo.fname}">÷�� ���� ����</c:when>
             <c:when test="${!empty vo.fname}">${vo.fname}</c:when>
         </c:choose>
         </td>
         <th>����</th>
         <td>����</td>
      </tr>
      <tr>
         <th>����</th>
         <td colspan="3"  id="csBoard_left">${vo.content}</td>
      </tr>
   </table>
   </form>
   
   <form name="csBoard_update" action = "http://localhost:8080/dongsuh/replyY_controller.do" method="post">
   <table id="csBoard_table1" >
      <tr>
         <th id = "th_width">�亯 ����</th>
         <td colspan="3"  id="csBoard_left">
         <textarea rows="10" cols="100" name="reply" id = reply_content placeholder="�̰��� �亯�� �����ϴ�."></textarea>
         </td>
      </tr>
   </table>
         <span id="csBoard_span2">
         <a href = "http://localhost:8080/dongsuh/csAdminBoard_list.do?no=${no }&rpage=${rpage}">
         <button type="button"  id="cs_button" class="cs_button">�������</button></a>
         <a href = "http://localhost:8080/dongsuh/csAdminBoard_content.do?no=${no }&rpage=${rpage}">
         <button type="button"  id="cs_button" class="cs_button">����������</button></a>
         </span>
         <span id="csBoard_span3">
         <button type="reset"  id="cs_button" class="cs_button">�ٽ� �ۼ�</button>
         <input type="hidden" name = "rpage" value="${rpage}">
         <input type="hidden" name = "no" value="${no}">
         <!-- input type="hidden" name = "fname" value="${fname}"-->
         <button type="button" id="reply_button" class="cs_button">�亯 �Ϸ�</button>
         </span>
   </form>
   <!-- footer -->
   <jsp:include page="../footer.jsp"/>
</body>
</html>