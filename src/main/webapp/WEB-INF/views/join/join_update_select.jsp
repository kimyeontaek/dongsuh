<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
div.join_select{
text-align : center;
padding-top : 300px;
padding-bottom : 300px;
background-color : #f4f1e6;
margin : -25px 0px -25px 0px;
}
div.join_select span.select1, span.select2{
padding : 100px 100px 100px 100px;
background-color : white;
border-radius : 25px;
font-size : 25px;
}
div.join_select span.select1{
margin-right : 50px;
}
</style>
<body>
	
	<jsp:include page="../header.jsp"></jsp:include>
	
			<div class="join_select">	

					<a href="http://localhost:8080/dongsuh/join_update_information.do"><span class="select1">개인정보 수정</span></a>
					<a href="http://localhost:8080/dongsuh/join_update_pass.do"><span class="select2">비밀번호 변경</span></a>
				
			</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>