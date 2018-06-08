<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import="dongsuh.vo.*, dongsuh.dao.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/dongsuh/css/dongsuh.css">
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<script>

</script>
</head>
<body>
<jsp:include page="../header.jsp"/>
   <div id="cs_div1">
   <div id="cs_div2">
   <p id = "slash_red">/</p>
   <p id = "cs_title">[�����ڿ�] ���� ���� ��</p>
   <p class="wave"><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
   </div>
   <form name="csBoard_content" action = "http://localhost:8080/dongsuh/csAdminBoard_update.do" method="post">
   
   <table id="csBoard_table1">
      <tr>   
         <th>����</th>
         <td id="csBoard_left">[${vo.gubun }]</td>
         <th>��ȸ ����</th>
         <td>
         <c:choose>
             <c:when test="${empty vo.reply}">N</c:when>
             <c:when test="${vo.reply eq 'empty'}">N</c:when>
             <c:when test="${!empty vo.reply}">Y</c:when>
         </c:choose>
         </td>
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
         <td>
         <c:choose>
             <c:when test="${empty vo.reply}">������</c:when>
             <c:when test="${vo.reply eq 'empty'}">������</c:when>
             <c:when test="${!empty vo.reply}">�亯 �Ϸ�</c:when>
         </c:choose>
         </td>
      </tr>
      <tr>
         <th>����</th>
         <td colspan="3"  id="csBoard_left"><br>
         ${vo.content }<br>
         <br><br><br><br><br><br><br>
         </td>
      </tr><td></td>
   </table>
   
   <span id = "reply_btn">
   <a href = "http://localhost:8080/dongsuh/csAdminBoard_replyY.do?no=${no}&rpage=${rpage}">
   <button type="button" id="myButton">�亯�ޱ�</button></a></span>
   
   <table id="csBoard_table1">
      <tr>
         <th id="th_width">�亯</th>
         <td colspan="3"  id="csBoard_left">
         <c:choose>
             <c:when test="${vo.reply eq 'empty'}">
                 <br>
               <span id = "reply_font">�����ڿ� ���� �ۼ��� �亯�� �����ϴ�.</span>
               <br><br>
             </c:when>
             <c:when test="${empty vo.reply}">
                 <br>
               <span id = "reply_font">�����ڿ� ���� �ۼ��� �亯�� �����ϴ�.</span>
               <br><br>
             </c:when>
             <c:otherwise>
                <br>
               <span id = "reply_font">${vo.reply}</span>
               <br><br>
             </c:otherwise>
         </c:choose>
         </td>
      </tr>
      <tr>
         <td colspan="4"  id="csBoard_left">
         </td>
      </tr>
   </table>
         <input type ="hidden" name="no" value ="${no}">
         <input type ="hidden" name="fname" value ="${vo.fname}">
         <input type ="hidden" name="reply" value ="${vo.reply}">
         <input type ="hidden" name="rpage" value ="${rpage}">
         <span id="csBoard_span2">
         <a href = "http://localhost:8080/dongsuh/csAdminBoard_list.do?rpage=${rpage}">
         <button type="button"   id="cs_button" class="cs_button">��Ϻ���</button></a></span>
         <span id="csBoard_span1">
         <button type="submit"  id="cs_button" class="cs_button">�����ϱ�</button>
         <a href = "http://localhost:8080/dongsuh/csAdminBoard_delete.do?no=${no}&rpage=${rpage}">
         <button type="button"  id="cs_button" class="cs_button">�����ϱ�</button></a></span>


   </form>
   </div>
   <!-- footer -->
   <jsp:include page="../footer.jsp"/>
</body>
</html>