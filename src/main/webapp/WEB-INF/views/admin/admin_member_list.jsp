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
	<h1>ȸ������ ����Ʈ</h1>
	<hr>
		<ul>
			<li><a href="http://localhost:8080/dongsuh/admin_member_list.do">ȸ������ ����Ʈ</a></li>
			<li><a href="http://localhost:8080/dongsuh/admin_notice_list.do">�������� ����</a></li>
			<li><a href="http://localhost:8080/dongsuh/index.do">Ȩ����</a></li>
		</ul>
		<table border=1>
			<tr>
				<th>���̵�</th>
				<th>��й�ȣ</th>
				<th>�̸�</th>
				<th>�������</th>
				<th>�̸���</th>
				<th>����ȣ</th>
				<th>�ּ�</th>
				<th>�̸��ϼ��� ����</th>				
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