<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "dongsuh.vo.*, dongsuh.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Cho DongSuh</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/dongsuh/css/dongsuh.css">
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<!-- �ּ�ã�� �� 3�� -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
   $(document).ready(function(){
      //ȸ������ ��ȿ��(�̸�, ����, ����������å üũ) üũ
      $("#cs_button").click(function(){
         if($("#cs_name").val()==""){
            alert("�̸��� �Է��ϼ���");
            $("#cs_name").focus();
            return false;
         }else if($("#cs_textarea").val()==""){
            alert("������ �Է��ϼ���");
            $("#cs_textarea").focus();
            return false;
         } else if($("#cs_agreeCheck").is(":checked")==false){
            alert("����������å�� �������ּ���.");
            $("#cs_agreeCheck").focus();
            return false;
         }
         //��������
         csForm.submit();
         
      });//end of click         
   //�̸��� �ּ� ��� ����� �ؽ�Ʈ���ڿ� �� �Է�
   $("#cs_select1").change(function(){
      //alert($("#selectEmail").val());
      str=$("#cs_select1").val();
      if(str != "self"){
         $("#cs_email2").val(str);
      }else if(str=="self"){
         $("#cs_email2").focus();
      }else if(str=="self"){
         $("#cs_email2").val("");
      }
   });
});      
      
   //��ư(CSS ���� ��ư) ���� �� ���� ��ư ����
   $(function () {
      $('#cs_fileName').click(function (e) {
         e.preventDefault();
         $('#cs_hidden').click();
      });
      
   $('#cs_addr1').click(function (e) {
      e.preventDefault();
      $('#postcodify_search_button').click();
      });
      $('#cs_addr2').click(function (e) {
      e.preventDefault();
      $('#postcodify_search_button').click();
      });
         
   //���ε� ���� �뷮 ����     
   $("#cs_hidden").bind( 'change', function (e)
         {
            if( !$(this).val() ) return;
            var f = this.files[0];
            var size = f.size || f.fileSize;
            var limit = 1500000;            
            //alert( id + ' / ' + limit );
            if( size > limit )
            {
               alert( '���Ͽ뷮�� 1.5mb �� ������ �����ϴ�.' );
               $(this).val('');
               return;
            }
         $(this).parent().find('#cs_hidden').val( $(this).val() );
   });
   
   
   //���̵� �ߺ�üũ : Ajax
   $("#join_button").hide()
   $("#cs_name").focusout(function(){
      //alert("���̵� �ߺ�");
      var id = $("#cs_name").val();
      //alert(name);
      
      $.ajax({
         url : 'http://localhost:8080/dongsuh/name_check.do',
         type :'POST',
         data : 'id='+id,
         dataType : "json",
         contentType : 'application/x-www-form-urlencoded;charset=utf-8', //�ѱ�
         success : function(data){
            if(data.length != 0){   
               //alert("���� "+data);
               if(data == 1){
                  $("#join_button").hide()
                  $("#id_msg").css("display","inline-block").css("font-size","9pt")
                  .css("color","blue").css("padding","3px 0px 0px 30px");
                  $("#id_msg").text("�Է��Ͻ� ȸ�������� �ֽ��ϴ�.");
                  $("#cs_email1").focus();
      
                  return false;
               }else{
                  $("#id_msg").css("display","inline-block").css("font-size","9pt")
                  .css("color","red").css("padding","3px 0px 0px 30px");
                  $("#id_msg").text("�Է��Ͻ� ȸ�������� �����ϴ�.");
                  $("#join_button").show();
                  $("#cs_name").val("").focus();

                  return false;
               }
         
            }
         }, error: function(xhr, status, error) {
               alert(error);
           }  

      });   //Ajax of ==      
   });   //end of id_check
   
});

</script>

</head>
<body>
<jsp:include page="../header.jsp"/>
<div id = "cs_div1">
      <div id ="cs_div2">
   <p id = "slash_red">/</p>
   <p id = "cs_title">������</p>
   <p id = "font_size20">���� ���� ��Ҹ� �ϳ������� �� ����̰ڽ��ϴ�</p>
   <p class="wave"><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
      </div> <!-- div2 -->
   <div id = "cs_div3">
   <p id = "cs_p1"><span id="star">*</span>
   ���̵� ��Ȯ�� �Է����ּ���(��ҹ��� ����)
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*���� ���� �� �亯�� �������������� Ȯ�� �����մϴ�.</p>
      
   <form id = "cs_form" name="csForm" action = "http://localhost:8080/dongsuh/cs_form_controller.do" method="post"  enctype="multipart/form-data">
   <table id ="cs_table1">
      <tr>
         <th id="only_left">����</th>
         <td id ="cs_td2">
         <div id="cs_label">
         <input type="radio" id="cs_ad" name="gubun" value = "����" checked = "checked"/><label for="cs_ad"> ���� </label> 
          <input type="radio" id="cs_product" value = "��ǰ" name="gubun"/><label for="cs_product"> ��ǰ </label> 
          <input type="radio" id="cs_home"  value = "Ȩ������" name="gubun"/><label for="cs_home"> Ȩ������ </label> 
          <input type="radio" id="cs_web"  value = "����" name="gubun"/><label for="cs_web"> ����������� </label> 
          <input type="radio" id="cs_etc"  value = "��Ÿ" name="gubun"/><label for="cs_etc"> ��Ÿ </label>
          </div>
         </td>
         
      </tr>
      <tr>
         <th id="only_left"><span id="star">*</span> ȸ�� ���̵�</th>
            <td>
               <input type="text" name ="name" id="cs_name" value="${sessionScope.sid}">
               <span id="id_msg"></span>
               <a href ="http://localhost:8080/dongsuh/join_check.do">
               <span id="join_button">
               <label id="myButton">ȸ������ �Ϸ�����</label>
               </span>
               </a>
            </td>
      </tr>
      <tr>
         <th id="only_left">�̸���</th>
         <td>
            <input type="text" name ="email1" id="cs_email1"> @ <input type="text" name ="email2" id="cs_email2">
            <select name = "email3" class="cs_select1" id="cs_select1">
            <option value="self">�����Է�</option>
            <option value="chol.com">chol.com</option>
            <option value="daum.net">daum.net</option>
            <option value="dreamwiz.com">dreamwiz.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="nate.com">nate.com</option>
            <option value="naver.com">naver.com</option>
            <option value="yahoo.co.kr">yahoo.co.kr</option>
            </select>
         </td>
      </tr>
      <tr>
         <th id="only_left">�޴�����ȣ</th>
         <td>
         <input type="text" name ="phone1" id = "cs_phone1"> - <input type="text" name ="phone2" id="cs_phone2">
          - <input type="text" name ="phone3" id="cs_phone3">
         </td>
      </tr>
      <tr>
         <th id="only_left1">�ּ�</th>
         <td>
         <input type="text" name ="cs_addr1" readonly="readonly" id="cs_addr1" class="postcodify_jibeon_address">
         &nbsp;&nbsp;
         <button type="button" id="postcodify_search_button" class="myButton" > �����ȣ</button>
         &nbsp;<span id="cs_span3">*���ּҴ� ���� �Է����ּ���<br>
         ���θ� �ּ�<br></span>
         <input type="text" name ="cs_addr2" id="cs_addr2" readonly="readonly" class="postcodify_address"> &nbsp;
         <input type="text" name ="cs_addr3" placeholder ="���ּҸ� �Է����ּ���" id="cs_addr3">
         </td>
      </tr>
      <tr>
         <th id="only_left2"><span id="star">*</span> �󼼳���</th>
         <td>
            <textarea name = "content" cols="100" class = "cs_textarea" id="cs_textarea"></textarea>
         </td>
      </tr>
      <tr>
         <th id="only_left3">����÷��</th>
         <td colspan="5">
         <input type="text" id="cs_fileName" readonly="readonly" name = "file">
         <label id="myButton">���ϼ���
         <input type="file" name ="file" id="cs_hidden"
         onchange="javascript:document.getElementById('cs_fileName').value = this.value" accept=".jpg,.gif,.png">
         </label><br>
         <span id="cs_span3">*����,�̹�������(JPG,GIF,PNG)�� ÷�� �����ϸ� ���ϻ������ 1.5mb ���Ϸ� ���ֱ�� �ٶ��ϴ�.</span>
         </td>
      </tr>
      <tr>
         <td colspan="2" id="cs_td1">
            <span id=cs_span2>
            <input type="checkbox" name="cs_agreeCheck" checked="checked" id="cs_agreeCheck">
            <label for="cs_agreeCheck">����������å�� �����մϴ�</label></span><br>
            <span id="cs_span3"><br>���� ��ǰ(��)�� ������ ���������� �߿���ϰ� �ֽ��ϴ�.
            <br>�̿��� ���Ͽ� ����������޹�Ŀ� �������ּ���.</span>
         </td>
      <tr>
         <th id="only_left">�������� ��޹�ħ</th>
         <td>
            <ul id="cs_ul1">
               <li>
               <strong>*���������� ���� �� �̿����</strong><br>
               �������ǡ�, ��ǰ���̵��, ��ǰ ������� ���񽺸� �̿��Ͻð��� �� ���, �ش� ���񽺸� ���� �ּ����� ������������ �����մϴ�
               </li>
               <br>
               <li>
               <strong>*�����ϴ� ���������� �׸�</strong><br>
               �̸�, �ּ�, ��ȭ��ȣ, �̸���<br>
               ��, �̿����� �⺻�� �α� ħ���� ����� �ִ� �ΰ��� �������� (���� �� ����, ��� �� ����, ����� �� ������, ��ġ�� ���� �� ���˱��,
               �ǰ����� �� ����Ȱ ��)�� �������� �ʽ��ϴ�.
               </li>
               <br>
               <li>
               <strong>*���������� ���� �� �̿�Ⱓ</strong><br>
               ������ �������� �����Ⱓ�� ���� ���� �Ű� �� ���� ��û������ �Դϴ�. ���� ���� �� ȸ������ ���������� ����� �Ұ����� �������
               ��� �ı��մϴ�.
               </li>
               <br>
            </ul>
         </td>
      </tr>
   </table>   
   <input type = "hidden" name ="no" value="${vo.no}">
   <span id="cs_span1"><button type="button" class="cs_button" id="cs_button">Ȯ��</button></span>
   </div>
</div>
   </form>
   <!-- footer -->
   <jsp:include page="../footer.jsp"/>
</body>
</html>