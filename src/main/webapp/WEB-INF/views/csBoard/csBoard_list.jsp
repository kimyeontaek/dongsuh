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
   //체크 박스 선택시 전체 선택
    $("#allCheck").click(function(){
        if($("#allCheck").prop("checked")){
            $("input[name=csBoard_checkbox]").prop("checked",true);
        }else{
            $("input[name=csBoard_checkbox]").prop("checked",false);
        }
   });
    //체크 박스 선택시 전체 선택 (html에 value 값을 추가해서 가져와서 true면 체크하고 다시 false로 바꿔줌.)
    $("#all").click(function(){
        if($("#all").val()=="true"){
            $("input[name=csBoard_checkbox]").prop("checked",true);
            $("#all").val("false");
        }else if($("#all").val()=="false"){
            $("input[name=csBoard_checkbox]").prop("checked",false);
            $("#all").val("true");
        }
   });
    
    
    //선택 문의 삭제시 alert
    $("#check_delete").click(function(){
       alert("선택된 문의가 삭제 되었습니다");
       
       csBoard_list.submit();
       
    });

    
});//전체 종료
</script>
<!-- keyword를 인자로 포함한 페이징 ajax-->
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
	<span id="cs_title"><span id="star">${sessionScope.sid}</span> 님의 문의 내역</span>
   <p class="wave"><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
   </div>
      <form name="csBoard_serch" action ="http://localhost:8080/dongsuh/cs_serch_controller.do" method = "get">
         <span id = rjator>
         <input type="text" name = serch_word placeholder ="내용 검색" style="height : 34px;">               
         <button type="submit"  class="myButton">검색</button></span>
      </form>
      <form name="csBoard_list" action ="http://localhost:8080/dongsuh/csForm_select_controller.do" method = "post">
      <table id="csBoard_table1">
      <tr>
         <th><input type="checkbox" name = "allCheck" id="allCheck"></th>
         <th>No.</th>
         <th>게시날짜</th>
         <th>주제</th>
         <th>제목</th>
         <th>등록자</th>
         <th>상태</th>
         <th>답변일</th>
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
               ${vo.content } ...더보기</a>
               </td>
             </c:when>
             <c:when test="${!empty vo.fname}">
                 <td id = "csBoard_left">
               <a href = "http://localhost:8080/dongsuh/csBoard_content.do?no=${vo.no}&rpage=${rpage}">
               ${vo.content } ... <img src="http://localhost:8080/dongsuh/cs_image/file.PNG" class="filePng"> 더보기 </a>
               </td>
             </c:when>
         </c:choose>
         <td id="ekqqusdlf">${vo.name }</td>
         <td>
         <c:choose>
             <c:when test="${vo.reply eq 'empty'}">진행중</c:when>
             <c:when test="${empty vo.reply}">진행중</c:when>
             <c:otherwise>답변 완료</c:otherwise>
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
         <%-- 페이지 네비게이션--%><div id="ampaginationsm"></div></td>
      </tr>
   </table>
   
   <span id="csBoard_span2">
   <a href = "http://localhost:8080/dongsuh/csBoard_list.do">
   <button type="button" id="cs_button" class="cs_button">목록 보기</button></a>
   </span>
   <span id="csBoard_span1"><button type="button"  id="all" class="cs_button" value="true">전체 선택</button>
   <input type="hidden" name="no" value="${no}">
   <button type="submit"  id="check_delete" class="cs_button">선택 삭제</button></span>
      </span>
   
</div>
   </form>

<!-- footer -->
</div><jsp:include page="../footer.jsp"/>
</body>
</html>