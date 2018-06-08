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
/* Find 스타일*/
#idFindResult_div1 {
	text-align: center;
}

#idFindResult_div1 table {
	width: 960px;
	margin: auto;
	border-radius: 50px;
	background-color: rgb(244, 244, 230);
}

#idFindResult_div1 td {
	text-align: center;
}

#idFindResult_label1 {
	font-size: 25pt;
	text-align: center;
}

#idFindResult_btn1,#idFindResult_btn2 {
	width: 200px;
	height: 80px;
	background-color: rgb(208, 2, 27);
	color: white;
	border-radius: 70px;
	border-style: none;
	text-weight: bold;
	margin: 30px;
}

#idFindResult_btn1:hover,#idFindResult_btn2:hover {
	background-color: black;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="bdiv">
		<div id="title_div">
			<p id="title_p1">/</p>
			<p id="title_p2">아이디 찾기 결과</p>
			<p>
				<img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png">
			</p>
		</div>
		<div id="idFindResult_div1">
			<table>
				<c:choose>
					<c:when test="${!empty result}">
						<tr>
							<td><br>
							<br> <label id="idFindResult_label1">아이디는 ${result }입니다.</label>
							</td>
						</tr>
						<tr>
							<td>
								<!-- 로그인 modal -->
								<div class="w3-container">
									<button
										onclick="document.getElementById('id01').style.display='block'"
										id="idFindResult_btn1">로그인</button>
								</div>
							</td>
						</tr>
					</c:when>
					<c:when test="${empty result}">
						<tr>
							<td><br>
							<br> <label id="idFindResult_label1">입력하신 정보와 일치하는
									아이디가 없습니다.</label></td>
						</tr>
						<tr>
							<td>
								<!-- 아이디찾기 modal -->
								<div class="w3-container">
									<button
										onclick="document.getElementById('id01').style.display='block'"
										id="idFindResult_btn1">아이디 찾기</button>
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