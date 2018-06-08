<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/dongsuh/css/dongsuh.css">
</head>
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<script>
   $(document).ready(function(){
      
         
      
      
      
      //�ּ� �ؽ�Ʈ�ڽ� ���� üũ
      $("#cs_select2").change(function(){
         str=$("#cs_select2").val();
         if(str != "option_cho"){
            $("#gubun_text").val(str);
         }else if(str=="option_cho"){
            $("#gubun_text").focus();
         }else if(str=="option_cho"){
            $("#gubun_text").val("");
         }
      });
   
      
      //text���ڿ� ��ư ����
      $(function () {
         $('#cs_fileName1').click(function (e) {
         e.preventDefault();
         $('#cs_hidden').click();
      });
      
      
      //���� �뷮 ����
      
      $("#cs_hidden").bind( 'change', function (e)
            {
         if( !$(this).val() ) return;
         var f = this.files[0];
         var size = f.size || f.fileSize;
         var limit = 1500000;            
         //alert( id + ' / ' + limit );
      if( size > limit ){
         alert( '���Ͽ뷮�� 1.5mb �� ������ �����ϴ�.' );
         $(this).val('');
         return;
      }
            $(this).parent().find('#cs_hidden').val( $(this).val() );
      });
   });

//���� ���� ������ ���� �� ��������  noFile2�� ������
      $('#file_delete_button').click(function (e) {
         $("#cs_fileName1").val("");
         //alert($("#file_check2").val());
      });
//�����Ϸ� ������ ���� ���� ���� ������ noFile�� ������
      $("#cs_update_button").click(function(){
         //���� ��ȿ�� üũ
         if($("#update_content").val()==""){
            alert("���� �Է��� �ʼ��Դϴ�.");
            $("#update_content").focus();
            return false;
         }
         //���� ���� ���� ���� ���� ���� ��
         if($("input[type=file]").val() == "" && $("#cs_fileName1").val() == ""){
            $("#file_check2").val("noFile2");
         }else if($("input[type=file]").val() == ""){   
            $("#file_check").val("noFile");
         }
            //��������
            csBoard_update.submit();      
         
      });
});

</script>
<body>
<jsp:include page="../header.jsp"/>
   <div id="cs_div1">
   <div id="cs_div2">
   <p id = "slash_red">/</p>
   <p id = "cs_title">[�����ڿ�]���� ���� ����</p>
   <p class="wave"><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
   </div>
   <form name="csBoard_update" action = "http://localhost:8080/dongsuh/csAdminBoard_update_controller.do" method="post"
     enctype="multipart/form-data">
   <table id="csBoard_table1">
      <tr>
         <th>����</th>
         <td id="csBoard_left2">
            <select name="gubun"  id="cs_select2">
            <option value="����" >[���� ����]</option>
            <option value="��ǰ" >[��ǰ ����]</option>
            <option value="����">[���� ����]</option>
            <option value="Ȩ������" >[Ȩ������]</option>
            <option value="��Ÿ" >[��Ÿ]</option>
            </select>
         <input type="text" placeholder="${vo.gubun}"  readonly="readonly" id="gubun_text"></td>
         <th>��ȸ ����</th>
         <td id="csBoard_left3">
         <c:choose>
             <c:when test="${empty vo.reply}">N</c:when>
             <c:when test="${vo.reply == 'empty'}">N</c:when>
             <c:when test="${!empty vo.reply}">Y</c:when>
         </c:choose>
         </td>
      </tr>
      <tr>
         <th>�����</th>
         <td id="csBoard_left2">${vo.bdate}</td>
         <th>�����</th>
         <td id="csBoard_left3">${vo.name}</td>
      </tr>
      <tr>
         <th>÷������</th>
         <td id="csBoard_left3"><input type="text" name = "csForm_addfile_update"   
         id="cs_fileName1" value="${vo.fname}"> 
         <label id="myButton">���ϼ���
         <input type="file" name ="file" id="cs_hidden"
         onchange="javascript:document.getElementById('cs_fileName1').value = this.value" 
         accept=".jpg,.gif,.png">
         </label>&nbsp;&nbsp;
         <img src="http://localhost:8080/dongsuh/cs_image/filedelete.PNG" class="filePng" 
         id="file_delete_button"><br>
         <span id="cs_span3"> * ����,�̹�������(JPG,GIF,PNG)�� ÷�� �����ϸ� ���ϻ������ 1.5mb ���Ϸ� ���ֱ�� �ٶ��ϴ�.</span>
         </td>
         <th>����</th>
         <td id="csBoard_left3">
         <c:choose>
             <c:when test="${empty vo.reply}">������</c:when>
             <c:when test="${vo.reply == 'empty'}">������</c:when>
             <c:when test="${!empty vo.reply}">�亯 �Ϸ�</c:when>
         </c:choose>
         </td>
      </tr>
      <tr>
         <th>����</th>
         <td colspan="3"  id="csBoard_left">
         <textarea rows="20" cols="119" name="content" id="update_content">${content}</textarea>
         <p id="cs_span3"> * ������ �ݵ�� �Է����ּ���.
         </td>
      </tr>
   </table>
         <span id="csBoard_span2">
         <a href = "http://localhost:8080/dongsuh/csAdminBoard_list.do?rpage=${rpage}">
         <button type="button"  id="cs_button" class="cs_button">�������</button></a>
         <a href = "http://localhost:8080/dongsuh/csAdminBoard_content.do?no=${no}&rpage=${rpage}">
         <button type="button"  id="cs_button" class="cs_button">����������</button></a>
         </span>
         <span id="csBoard_span3">
         <button type="reset"  id="cs_button" class="cs_button">�ٽ� �ۼ�</button>
         <input type="hidden" name="file_check" id="file_check">
         <input type="hidden" name="file_check2" id="file_check2">
         <input type="hidden" name="no" value="${no}">
         <input type="hidden" name="rpage" value="${rpage}">
         <button type="button"  id="cs_update_button" class="cs_button">�����Ϸ�</button>
         </span>
      

   </form>
   <!-- footer -->
   <jsp:include page="../footer.jsp"/>
</body>
</html>