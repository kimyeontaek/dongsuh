<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/dongsuh/css/dongsuh.css">
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<style>
/* passFind ��Ÿ��*/
#passFindResult_div1 {
	text-align: center;
}

#passFindResult_div1 table {
	width: 960px;
	margin: auto;
	border-radius: 50px;
	background-color: rgb(244, 244, 230);
}

#passFindResult_div1 td {
	text-align: center;
}

#passFindResult_label1 {
	font-size: 25pt;
	text-align: center;
}

#passFindResult_btn1,#passFindResult_btn2 {
	width: 200px;
	height: 80px;
	background-color: rgb(208, 2, 27);
	color: white;
	border-radius: 70px;
	border-style: none;
	text-weight: bold;
	margin: 30px;
}

#passFindResult_btn1:hover,#passFindResult_btn2:hover {
	background-color: black;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="bdiv">
		<div id="title_div">
			<p id="title_p1">/</p>
			<p id="title_p2">��й�ȣ ã�� ���</p>
			<p>
				<img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png">
			</p>
		</div>
		<div id="passFindResult_div1">
			<table>
				<c:choose>
					<c:when test="${!empty result}">
						<tr>
							<td><br>
							<br> <label id="passFindResult_label1">��й�ȣ��${result }�Դϴ�.</label>
							</td>
						</tr>
						<tr>
							<td>
								<!-- �α��� modal -->
								<div class="w3-container">
									<button
										onclick="document.getElementById('id01').style.display='block'"
										id="passFindResult_btn1">�α���</button>
								</div>
							</td>
						</tr>
					</c:when>
					<c:when test="${empty result}">
						<tr>
							<td><br>
							<br> <label id="passFindResult_label1">�Է��Ͻ� ������ ��ġ�ϴ�
									��й�ȣ�� �����ϴ�.</label></td>
						</tr>
						<tr>
							<td>
								<!-- ���̵�ã�� modal -->
								<div class="w3-container">
									<button
										onclick="document.getElementById('id01').style.display='block'"
										id="passFindResult_btn1">��й�ȣ ã��</button>
								</div>
							</td>
						</tr>
					</c:when>
				</c:choose>
			</table>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>