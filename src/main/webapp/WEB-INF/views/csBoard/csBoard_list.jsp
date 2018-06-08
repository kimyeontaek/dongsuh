<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="dongsuh.vo.CsBoardVO, java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/dongsuh/css/dongsuh.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/dongsuh/css/am-pagination.css">
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<script src="http://localhost:8080/dongsuh/js/paging.js"></script>
<script>
$(document).ready(function(){
   //üũ �ڽ� ���ý� ��ü ����
    $("#allCheck").click(function(){
        if($("#allCheck").prop("checked")){
            $("input[name=csBoard_checkbox]").prop("checked",true);
        }else{
            $("input[name=csBoard_checkbox]").prop("checked",false);
        }
   });
    //üũ �ڽ� ���ý� ��ü ���� (html�� value ���� �߰��ؼ� �����ͼ� true�� üũ�ϰ� �ٽ� false�� �ٲ���.)
    $("#all").click(function(){
        if($("#all").val()=="true"){
            $("input[name=csBoard_checkbox]").prop("checked",true);
            $("#all").val("false");
        }else if($("#all").val()=="false"){
            $("input[name=csBoard_checkbox]").prop("checked",false);
            $("#all").val("true");
        }
   });
    
    
    //���� ���� ������ alert
    $("#check_delete").click(function(){
       alert("���õ� ���ǰ� ���� �Ǿ����ϴ�");
       
       csBoard_list.submit();
       
    });

    
});//��ü ����
</script>
<!-- keyword�� ���ڷ� ������ ����¡ ajax-->
<script>
   $(document).ready(function(){
      var pager = jQuery('#ampaginationsm').pagination({
      
          maxSize: 7,             // max page size
          totals: '${dbCount}',   // total pages   
          page: '${rpage}',      // initial page      
          pageSize: 5,         // max number items per page
      
          // custom labels      
          lastText: '&raquo;&raquo;',       
          firstText: '&laquo;&laquo;',      
          prevText: '&laquo;',      
          nextText: '&raquo;',
                 
          btnSize:'sm'   // 'sm'  or 'lg'      
      });
      
      jQuery('#ampaginationsm').on('am.pagination.change',function(e){
         
            jQuery('.showlabelsm').text('The selected page no: '+e.page);
                 $(location).attr('href', "http://localhost:8080/dongsuh/csBoard_list.do?serch_word=${serch_word}&rpage="+e.page);         
                 
      });
      
    });
</script> 

</head>
<body>
<!-- header -->
<jsp:include page="../header.jsp"/><div class="bdiv">
<!-- body -->
<div id="cs_div1">
   <div id="cs_div2">
   <p id = "slash_red">/</p>
	<span id="cs_title"><span id="star">${sessionScope.sid}</span> ���� ���� ����</span>
   <p class="wave"><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
   </div>
      <form name="csBoard_serch" action ="http://localhost:8080/dongsuh/cs_serch_controller.do" method = "get">
         <span id = rjator>
         <input type="text" name = serch_word placeholder ="���� �˻�" style="height : 34px;">               
         <button type="submit"  class="myButton">�˻�</button></span>
      </form>
      <form name="csBoard_list" action ="http://localhost:8080/dongsuh/csForm_select_controller.do" method = "post">
      <table id="csBoard_table1">
      <tr>
         <th><input type="checkbox" name = "allCheck" id="allCheck"></th>
         <th>No.</th>
         <th>�Խó�¥</th>
         <th>����</th>
         <th>����</th>
         <th>�����</th>
         <th>����</th>
         <th>�亯��</th>
      </tr>
      <%-- for(CsBoardVO vo : ${list}){ --%>
      <c:forEach items="${list }" var="vo">
      <tr>
         <td><input type="checkbox" name = "csBoard_checkbox" id="csBoard_checkbox" value="${vo.no}"></td>
         <td>${vo.rno}</td>
         <td>${vo.bdate }</td>
         <td>${vo.gubun }</td>
         <c:choose>
             <c:when test="${empty vo.fname}">
                 <td id = "csBoard_left">
               <a href = "http://localhost:8080/dongsuh/csBoard_content.do?no=${vo.no}&rpage=${rpage}">
               ${vo.content } ...������</a>
               </td>
             </c:when>
             <c:when test="${!empty vo.fname}">
                 <td id = "csBoard_left">
               <a href = "http://localhost:8080/dongsuh/csBoard_content.do?no=${vo.no}&rpage=${rpage}">
               ${vo.content } ... <img src="http://localhost:8080/dongsuh/cs_image/file.PNG" class="filePng"> ������ </a>
               </td>
             </c:when>
         </c:choose>
         <td id="ekqqusdlf">${vo.name }</td>
         <td>
         <c:choose>
             <c:when test="${vo.reply eq 'empty'}">������</c:when>
             <c:when test="${empty vo.reply}">������</c:when>
             <c:otherwise>�亯 �Ϸ�</c:otherwise>
         </c:choose>
         </td>
         <td id="ekqqusdlf">
         <c:choose>
             <c:when test="${vo.rdate eq '1989-10-21'}">none</c:when>
             <c:when test="${vo.reply eq 'empty'}">none</c:when>
             <c:otherwise>${vo.rdate}</c:otherwise>
         </c:choose>
         </td>
      </tr>
      <%--} --%>
      </c:forEach>
      <tr>
         <td colspan="9" id="font-size25">
         <%-- ������ �׺���̼�--%><div id="ampaginationsm"></div></td>
      </tr>
   </table>
   
   <span id="csBoard_span2">
   <a href = "http://localhost:8080/dongsuh/csBoard_list.do">
   <button type="button" id="cs_button" class="cs_button">��� ����</button></a>
   </span>
   <span id="csBoard_span1"><button type="button"  id="all" class="cs_button" value="true">��ü ����</button>
   <input type="hidden" name="no" value="${no}">
   <button type="submit"  id="check_delete" class="cs_button">���� ����</button></span>
      </span>
   
</div>
   </form>

<!-- footer -->
</div><jsp:include page="../footer.jsp"/>
</body>
</html>