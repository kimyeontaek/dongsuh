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
      
         
      
      
      
      //주소 텍스트박스 선택 체크
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
   
      
      //text상자와 버튼 연결
      $(function () {
         $('#cs_fileName1').click(function (e) {
         e.preventDefault();
         $('#cs_hidden').click();
      });
      
      
      //파일 용량 제한
      
      $("#cs_hidden").bind( 'change', function (e)
            {
         if( !$(this).val() ) return;
         var f = this.files[0];
         var size = f.size || f.fileSize;
         var limit = 1500000;            
         //alert( id + ' / ' + limit );
      if( size > limit ){
         alert( '파일용량은 1.5mb 를 넘을수 없습니다.' );
         $(this).val('');
         return;
      }
            $(this).parent().find('#cs_hidden').val( $(this).val() );
      });
   });

//파일 삭제 누르면 파일 값 없어지고  noFile2로 값설정
      $('#file_delete_button').click(function (e) {
         $("#cs_fileName1").val("");
         //alert($("#file_check2").val());
      });
//수정완료 누르고 만약 파일 값이 없으면 noFile로 값설정
      $("#cs_update_button").click(function(){
         //내용 유효성 체크
         if($("#update_content").val()==""){
            alert("내용 입력은 필수입니다.");
            $("#update_content").focus();
            return false;
         }
         //파일 지울 때와 파일 변경 안할 때
         if($("input[type=file]").val() == "" && $("#cs_fileName1").val() == ""){
            $("#file_check2").val("noFile2");
         }else if($("input[type=file]").val() == ""){   
            $("#file_check").val("noFile");
         }
            //서버전송
            csBoard_update.submit();      
         
      });
});

</script>
<body>
<jsp:include page="../header.jsp"/>
   <div id="cs_div1">
   <div id="cs_div2">
   <p id = "slash_red">/</p>
   <p id = "cs_title">[관리자용]문의 내역 수정</p>
   <p class="wave"><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
   </div>
   <form name="csBoard_update" action = "http://localhost:8080/dongsuh/csAdminBoard_update_controller.do" method="post"
     enctype="multipart/form-data">
   <table id="csBoard_table1">
      <tr>
         <th>제목</th>
         <td id="csBoard_left2">
            <select name="gubun"  id="cs_select2">
            <option value="광고" >[광고 관련]</option>
            <option value="제품" >[제품 관련]</option>
            <option value="웹진">[웹진 관련]</option>
            <option value="홈페이지" >[홈페이지]</option>
            <option value="기타" >[기타]</option>
            </select>
         <input type="text" placeholder="${vo.gubun}"  readonly="readonly" id="gubun_text"></td>
         <th>조회 여부</th>
         <td id="csBoard_left3">
         <c:choose>
             <c:when test="${empty vo.reply}">N</c:when>
             <c:when test="${vo.reply == 'empty'}">N</c:when>
             <c:when test="${!empty vo.reply}">Y</c:when>
         </c:choose>
         </td>
      </tr>
      <tr>
         <th>등록일</th>
         <td id="csBoard_left2">${vo.bdate}</td>
         <th>등록자</th>
         <td id="csBoard_left3">${vo.name}</td>
      </tr>
      <tr>
         <th>첨부파일</th>
         <td id="csBoard_left3"><input type="text" name = "csForm_addfile_update"   
         id="cs_fileName1" value="${vo.fname}"> 
         <label id="myButton">파일수정
         <input type="file" name ="file" id="cs_hidden"
         onchange="javascript:document.getElementById('cs_fileName1').value = this.value" 
         accept=".jpg,.gif,.png">
         </label>&nbsp;&nbsp;
         <img src="http://localhost:8080/dongsuh/cs_image/filedelete.PNG" class="filePng" 
         id="file_delete_button"><br>
         <span id="cs_span3"> * 사진,이미지파일(JPG,GIF,PNG)만 첨부 가능하며 파일사이즈는 1.5mb 이하로 해주기시 바랍니다.</span>
         </td>
         <th>상태</th>
         <td id="csBoard_left3">
         <c:choose>
             <c:when test="${empty vo.reply}">진행중</c:when>
             <c:when test="${vo.reply == 'empty'}">진행중</c:when>
             <c:when test="${!empty vo.reply}">답변 완료</c:when>
         </c:choose>
         </td>
      </tr>
      <tr>
         <th>내용</th>
         <td colspan="3"  id="csBoard_left">
         <textarea rows="20" cols="119" name="content" id="update_content">${content}</textarea>
         <p id="cs_span3"> * 내용은 반드시 입력해주세요.
         </td>
      </tr>
   </table>
         <span id="csBoard_span2">
         <a href = "http://localhost:8080/dongsuh/csAdminBoard_list.do?rpage=${rpage}">
         <button type="button"  id="cs_button" class="cs_button">목록으로</button></a>
         <a href = "http://localhost:8080/dongsuh/csAdminBoard_content.do?no=${no}&rpage=${rpage}">
         <button type="button"  id="cs_button" class="cs_button">이전페이지</button></a>
         </span>
         <span id="csBoard_span3">
         <button type="reset"  id="cs_button" class="cs_button">다시 작성</button>
         <input type="hidden" name="file_check" id="file_check">
         <input type="hidden" name="file_check2" id="file_check2">
         <input type="hidden" name="no" value="${no}">
         <input type="hidden" name="rpage" value="${rpage}">
         <button type="button"  id="cs_update_button" class="cs_button">수정완료</button>
         </span>
      

   </form>
   <!-- footer -->
   <jsp:include page="../footer.jsp"/>
</body>
</html>