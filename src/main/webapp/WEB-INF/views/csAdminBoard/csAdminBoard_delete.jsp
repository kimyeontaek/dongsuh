<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/dongsuh/css/dongsuh.css">
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
//�����ڿ� ������ alert
$(document).ready(function(){
   $("#cs_button").click(function(){
      alert("[������]�� ���� ������ ���ǰ� �����Ǿ����ϴ�!");
   });
   
});
   
   

</script>
</head>
<body>
<jsp:include page="../header.jsp"/>
   <div id = "cs_div1">
      <div id ="cs_div2">
      <br><br><br><br><br><br><br><br>
   <p class="wave"><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
      <br><br>
   <form name="csBoard_delete" action = "http://localhost:8080/dongsuh/csAdminBoard_delete_controller.do" method="post">
      <ul>
         
         <h1 id="font-size50"> [�����ڿ�]������ �����Ͻðڽ��ϱ�??</h1>
      </ul>
      <br><br>
      <input type="hidden" name="no" value="${no}">
      <button type="submit"  id="cs_button" class="cs_button">�����ϱ�</button>
      <a href ="http://localhost:8080/dongsuh/csAdminBoard_content.do?no=${no}&rpage=${rpage}">
      <button type="button"  id="cs_button1" class="cs_button">����������</button></a>
      <br><br><br><br><br><br>
   </form>
   </div> <!-- div2 -->
   </div>
   <!-- footer -->
   <jsp:include page="../footer.jsp"/>
</body>
</html>