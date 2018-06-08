<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "dongsuh.vo.*, dongsuh.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Cho DongSuh</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/dongsuh/css/dongsuh.css">
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<!-- 주소찾기 밑 3개 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
   $(document).ready(function(){
      //회원정보 유효성(이름, 내용, 개인정보정책 체크) 체크
      $("#cs_button").click(function(){
         if($("#cs_name").val()==""){
            alert("이름을 입력하세요");
            $("#cs_name").focus();
            return false;
         }else if($("#cs_textarea").val()==""){
            alert("내용을 입력하세요");
            $("#cs_textarea").focus();
            return false;
         } else if($("#cs_agreeCheck").is(":checked")==false){
            alert("개인정보정책에 동의해주세요.");
            $("#cs_agreeCheck").focus();
            return false;
         }
         //서버전송
         csForm.submit();
         
      });//end of click         
   //이메일 주소 목록 변경시 텍스트상자에 값 입력
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
      
   //버튼(CSS 적용 버튼) 선택 시 히든 버튼 선택
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
         
   //업로드 파일 용량 제한     
   $("#cs_hidden").bind( 'change', function (e)
         {
            if( !$(this).val() ) return;
            var f = this.files[0];
            var size = f.size || f.fileSize;
            var limit = 1500000;            
            //alert( id + ' / ' + limit );
            if( size > limit )
            {
               alert( '파일용량은 1.5mb 를 넘을수 없습니다.' );
               $(this).val('');
               return;
            }
         $(this).parent().find('#cs_hidden').val( $(this).val() );
   });
   
   
   //아이디 중복체크 : Ajax
   $("#join_button").hide()
   $("#cs_name").focusout(function(){
      //alert("아이디 중복");
      var id = $("#cs_name").val();
      //alert(name);
      
      $.ajax({
         url : 'http://localhost:8080/dongsuh/name_check.do',
         type :'POST',
         data : 'id='+id,
         dataType : "json",
         contentType : 'application/x-www-form-urlencoded;charset=utf-8', //한글
         success : function(data){
            if(data.length != 0){   
               //alert("있음 "+data);
               if(data == 1){
                  $("#join_button").hide()
                  $("#id_msg").css("display","inline-block").css("font-size","9pt")
                  .css("color","blue").css("padding","3px 0px 0px 30px");
                  $("#id_msg").text("입력하신 회원정보가 있습니다.");
                  $("#cs_email1").focus();
      
                  return false;
               }else{
                  $("#id_msg").css("display","inline-block").css("font-size","9pt")
                  .css("color","red").css("padding","3px 0px 0px 30px");
                  $("#id_msg").text("입력하신 회원정보가 없습니다.");
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
   <p id = "cs_title">고객문의</p>
   <p id = "font_size20">고객의 작은 목소리 하나까지도 귀 기울이겠습니다</p>
   <p class="wave"><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
      </div> <!-- div2 -->
   <div id = "cs_div3">
   <p id = "cs_p1"><span id="star">*</span>
   아이디를 정확히 입력해주세요(대소문자 구분)
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*문의 내역 및 답변은 마이페이지에서 확인 가능합니다.</p>
      
   <form id = "cs_form" name="csForm" action = "http://localhost:8080/dongsuh/cs_form_controller.do" method="post"  enctype="multipart/form-data">
   <table id ="cs_table1">
      <tr>
         <th id="only_left">구분</th>
         <td id ="cs_td2">
         <div id="cs_label">
         <input type="radio" id="cs_ad" name="gubun" value = "광고" checked = "checked"/><label for="cs_ad"> 광고 </label> 
          <input type="radio" id="cs_product" value = "제품" name="gubun"/><label for="cs_product"> 제품 </label> 
          <input type="radio" id="cs_home"  value = "홈페이지" name="gubun"/><label for="cs_home"> 홈페이지 </label> 
          <input type="radio" id="cs_web"  value = "웹진" name="gubun"/><label for="cs_web"> 웹진삶의향기 </label> 
          <input type="radio" id="cs_etc"  value = "기타" name="gubun"/><label for="cs_etc"> 기타 </label>
          </div>
         </td>
         
      </tr>
      <tr>
         <th id="only_left"><span id="star">*</span> 회원 아이디</th>
            <td>
               <input type="text" name ="name" id="cs_name" value="${sessionScope.sid}">
               <span id="id_msg"></span>
               <a href ="http://localhost:8080/dongsuh/join_check.do">
               <span id="join_button">
               <label id="myButton">회원가입 하러가기</label>
               </span>
               </a>
            </td>
      </tr>
      <tr>
         <th id="only_left">이메일</th>
         <td>
            <input type="text" name ="email1" id="cs_email1"> @ <input type="text" name ="email2" id="cs_email2">
            <select name = "email3" class="cs_select1" id="cs_select1">
            <option value="self">직접입력</option>
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
         <th id="only_left">휴대폰번호</th>
         <td>
         <input type="text" name ="phone1" id = "cs_phone1"> - <input type="text" name ="phone2" id="cs_phone2">
          - <input type="text" name ="phone3" id="cs_phone3">
         </td>
      </tr>
      <tr>
         <th id="only_left1">주소</th>
         <td>
         <input type="text" name ="cs_addr1" readonly="readonly" id="cs_addr1" class="postcodify_jibeon_address">
         &nbsp;&nbsp;
         <button type="button" id="postcodify_search_button" class="myButton" > 우편번호</button>
         &nbsp;<span id="cs_span3">*상세주소는 직접 입력해주세요<br>
         도로명 주소<br></span>
         <input type="text" name ="cs_addr2" id="cs_addr2" readonly="readonly" class="postcodify_address"> &nbsp;
         <input type="text" name ="cs_addr3" placeholder ="상세주소를 입력해주세요" id="cs_addr3">
         </td>
      </tr>
      <tr>
         <th id="only_left2"><span id="star">*</span> 상세내용</th>
         <td>
            <textarea name = "content" cols="100" class = "cs_textarea" id="cs_textarea"></textarea>
         </td>
      </tr>
      <tr>
         <th id="only_left3">파일첨부</th>
         <td colspan="5">
         <input type="text" id="cs_fileName" readonly="readonly" name = "file">
         <label id="myButton">파일선택
         <input type="file" name ="file" id="cs_hidden"
         onchange="javascript:document.getElementById('cs_fileName').value = this.value" accept=".jpg,.gif,.png">
         </label><br>
         <span id="cs_span3">*사진,이미지파일(JPG,GIF,PNG)만 첨부 가능하며 파일사이즈는 1.5mb 이하로 해주기시 바랍니다.</span>
         </td>
      </tr>
      <tr>
         <td colspan="2" id="cs_td1">
            <span id=cs_span2>
            <input type="checkbox" name="cs_agreeCheck" checked="checked" id="cs_agreeCheck">
            <label for="cs_agreeCheck">개인정보정책에 동의합니다</label></span><br>
            <span id="cs_span3"><br>동서 식품(주)은 고객님의 개인정보를 중요시하고 있습니다.
            <br>이용을 위하여 개인정보취급방식에 동의해주세요.</span>
         </td>
      <tr>
         <th id="only_left">개인정보 취급방침</th>
         <td>
            <ul id="cs_ul1">
               <li>
               <strong>*개인정보의 수집 및 이용목적</strong><br>
               ‘고객문의’, 제품아이디어, 제품 불편사항 서비스를 이용하시고자 할 경우, 해당 서비스를 위한 최소한의 개인정보만을 수집합니다
               </li>
               <br>
               <li>
               <strong>*수집하는 개인정보의 항목</strong><br>
               이름, 주소, 전화번호, 이메일<br>
               단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보 (인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록,
               건강상태 및 성생활 등)는 수집하지 않습니다.
               </li>
               <br>
               <li>
               <strong>*개인정보의 보유 및 이용기간</strong><br>
               수집된 개인정보 보유기간은 부정 제보 신고 후 삭제 요청때까지 입니다. 또한 삭제 시 회원님의 개인정보는 재싱이 불가능한 방법으로
               즉시 파기합니다.
               </li>
               <br>
            </ul>
         </td>
      </tr>
   </table>   
   <input type = "hidden" name ="no" value="${vo.no}">
   <span id="cs_span1"><button type="button" class="cs_button" id="cs_button">확인</button></span>
   </div>
</div>
   </form>
   <!-- footer -->
   <jsp:include page="../footer.jsp"/>
</body>
</html>