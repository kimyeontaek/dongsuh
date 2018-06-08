<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보 리스트</h1>
	<hr>
		<ul>
			<li><a href="http://localhost:8080/dongsuh/admin_member_list.do">회원정보 리스트</a></li>
			<li><a href="http://localhost:8080/dongsuh/admin_notice_list.do">공지사항 관리</a></li>
			<li><a href="http://localhost:8080/dongsuh/index.do">홈으로</a></li>
		</ul>
		<table border=1>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>폰번호</th>
				<th>주소</th>
				<th>이메일수신 동의</th>				
			</tr>
			
			<tr>
				<td>${vo.id}</td>
				<td>${vo.pass}</td>
				<td>${vo.name}</td>
				<td>${vo.calender}</td>
				<td>${vo.sumEmail}</td>
				<td>${vo.sumPhone}</td>
				<td>${vo.sumAd}</td>
				<td>${vo.agree}</td>
			</tr>
			
		</table>		
</body>
</html>