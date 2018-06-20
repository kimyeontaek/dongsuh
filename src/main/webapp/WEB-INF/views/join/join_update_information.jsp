<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import = "java.util.ArrayList, dongsuh.vo.MemberVO, dongsuh.dao.MemberDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script> 
      /* 수정 버튼 */
      $(document).ready(function(){
		
		$("#btnJoin1").click(function(){
			
			if($("#update_name").val() == ""){
  			  alert("이름을 입력하세요.");
  			  $("#update_name").focus();  		  
  		  }  		  
  	  	
		
		if($("#update_email").val() == ""){
			  alert("이메일을 입력하세요.");
			  $("#update_email").focus();
		  }
	  	 
		
		if($("#update_phone").val() == ""){
			 alert("휴대폰번호를 입력하세요.");
			 $("#update_phone").focus();
			}else{
				alert("수정이 완료되었습니다.");
			}
   		 join_update_form.submit();
   	  });
		
});    
         
</script>
</head>   
<style>
/* */
#join_check{
text-align : center;
margin-bottom : 70px;
}
#sf{
width : 100%;
padding : 0px;
}
#div1 label.bd{
display : inline-block;
padding :1px;
width : 10%;
}
#h8_1, #h8_3{
color : gray;
}
#h8_2{
color : red;
}
#ad1 {
width : 300px;
}
#ad2, #ad3{
width : 60px;
}
#ad4{
width : 300px;
}
#ad5{
width : 200px;
}
#durtmf, #mj, #sub{
text-align : center;
font-size : 25px;
}
#div1{
margin-top : 30px;
padding : 30px 30px 30px 0px;
border-radius : 25px;
background-color : white;
}
h5{
text-align : center;
}
#rn{
padding-left : 120px;
}
#div3{
text-align : center;
padding : 40px 0px 100px 0px;
}
#bdiv0{
margin : -25px 0px -25px 0px;
background-color : #f4f1e6;
}
#btnJoin1{
background-color: rgb(208,2,27);
color: white;
padding: 16px 32px;
text-align: center;
font-size: 16px;
margin: center; 
transition-duration: 0.3s; 
display: inline-block; 
text-decoration: none; 
cursor: pointer; 
border-radius: 25px; 
}
#btnJoin2{
background-color: white;
padding: 16px 32px;
text-align: center;
font-size: 16px;
margin: center; 
transition-duration: 0.3s; 
display: inline-block; 
text-decoration: none; 
cursor: pointer; 
border-radius: 25px; 
}
/* 변경 */
#update_info{
padding : 20px 0px 0px 120px;
text-align : center;
}
#update_info2{
padding : 0px -30px 0px -30px;
width : 5%;
}
#update_p{
padding-left:120px;
font-size:12px;
}
#update_info3{
text-align : left;
padding-top:15px;
}
</style>
<body>

   <jsp:include page="../header.jsp"></jsp:include>
   
   <div id="bdiv0">
      <div class="bdiv">   
         
         <form name="join_update_form" action="http://localhost:8080/dongsuh/join_update_name.do" method="POST">
         
	         <p id="durtmf">/</p>
	         <p id="mj"><b>회원 정보 수정</b></p>
	     
	            <div id="div1">   
	               
	               <ul>
	                  
	                  <li><h5><b style="color:red;">*</b> 항목은 필수 입력사항 입니다.</h5></li>               
	                     <hr>                  
	                     
	                     <li>
	                        <label class="bd"><b style="color:red;">*</b>아이디</label>
	                        <input type="text" style="border: 0px;" id="id" name="id" maxlength="30" value="${sid}" readonly>                        
	                     </li>
	                                    
	                     <hr>                     
	                     
	                    <li> 
	                        <label class="bd"><b style="color:red;">*</b>이름</label>                        
	                        <input type="text" id="name" name="name" maxlength="10" value="${vo.name}">
	                        <p id="update_p"><font color ="#bebebe">실명 정보(이름, 생년월일, 성별, 개인 고유 식별 정보)가 변경된 경우 본인 확인을 통해 정보를 수정하실 수 있습니다.</font></p>
	                    </li>	                    
	                	
	                    <hr>                     
	
	                    <li>
	                        <label class="bd" >이메일</label>                  
	                        <input type="text" id="email1" name="email" maxlength="30" value="${vo.email}"/>	                        
	                        <p id="update_p"><font color ="#bebebe">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 사용할 이메일 주소입니다.</font></p>
	              		</li>
	              		
	                   	<hr>
	                   	
	                    <li>
	                       <label class="bd">휴대폰번호</label>
	                       <input type="text" name="phone" value="${vo.phone}" >	                       
	                       <p id="update_p"><font color ="#bebebe">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 또는 유료 결제 등 네이버로부터 알림을 받을 때 사용할 휴대전화입니다.</font></p>
	                    </li>	                    
	                       
	                  </ul>
	                       
	               </div>             
	                  <div id="div3">                     
                        <input id="btnJoin1" value="수정완료" />
                        <a href="http://localhost:8080/dongsuh/index.do"><input style="float:right" type="button" id="btnJoin2" value="취소" /></a>                  
                   </div>         
                         
            </form>
         </div>
      </div>      
         
      <jsp:include page="../footer.jsp"></jsp:include>
      
</body>
</html>