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
      //내용 유효성 체크
      if($("#reply_content").val()==""){
      alert("답변 내용 입력은 필수입니다.");
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
   <p id = "cs_title">[관리자용]문의 내역 수정</p>
   <p class="wave"><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
   </div>
   <table id="csBoard_table1">
      <tr>
         <th>주제</th>
         <td id="csBoard_left">${vo.gubun}</td>
         <th>조회 여부</th>
         <td>N</td>
      </tr>
      <tr>
         <th>등록일</th>
         <td id="csBoard_left">${vo.bdate }</td>
         <th>등록자</th>
         <td>${vo.name }</td>
      </tr>
      <tr>
         <th>첨부파일</th>
         <td id="csBoard_left">
         <c:choose>
             <c:when test="${empty vo.fname}">첨부 파일 없음</c:when>
             <c:when test="${!empty vo.fname}">${vo.fname}</c:when>
         </c:choose>
         </td>
         <th>상태</th>
         <td>진행</td>
      </tr>
      <tr>
         <th>내용</th>
         <td colspan="3"  id="csBoard_left">${vo.content}</td>
      </tr>
   </table>
   </form>
   
   <form name="csBoard_update" action = "http://localhost:8080/dongsuh/replyY_controller.do" method="post">
   <table id="csBoard_table1" >
      <tr>
         <th id = "th_width">답변 내용</th>
         <td colspan="3"  id="csBoard_left">
         <textarea rows="10" cols="100" name="reply" id = reply_content placeholder="이곳에 답변을 적습니다."></textarea>
         </td>
      </tr>
   </table>
         <span id="csBoard_span2">
         <a href = "http://localhost:8080/dongsuh/csAdminBoard_list.do?no=${no }&rpage=${rpage}">
         <button type="button"  id="cs_button" class="cs_button">목록으로</button></a>
         <a href = "http://localhost:8080/dongsuh/csAdminBoard_content.do?no=${no }&rpage=${rpage}">
         <button type="button"  id="cs_button" class="cs_button">이전페이지</button></a>
         </span>
         <span id="csBoard_span3">
         <button type="reset"  id="cs_button" class="cs_button">다시 작성</button>
         <input type="hidden" name = "rpage" value="${rpage}">
         <input type="hidden" name = "no" value="${no}">
         <!-- input type="hidden" name = "fname" value="${fname}"-->
         <button type="button" id="reply_button" class="cs_button">답변 완료</button>
         </span>
   </form>
   <!-- footer -->
   <jsp:include page="../footer.jsp"/>
</body>
</html>