<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/dongsuh/css/dongsuh.css">
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="index_div1">
		<div class="div1">
			<a href="http://localhost:8080/dongsuh/brandSal.do?brandname=maxim">
				<img src="http://localhost:8080/dongsuh/images/maxim_main.jpg">
			</a>
		</div>
		<div class="div2">
			<a
				href="http://localhost:8080/dongsuh/brandSal.do?brandname=starbucks">
				<img src="http://localhost:8080/dongsuh/images/starbucks_main.jpg">
			</a>
		</div>
		<div class="div3">
			<a href="http://localhost:8080/dongsuh/brandSal.do?brandname="> <img
				src="http://localhost:8080/dongsuh/images/top_main.jpg">
			</a>
		</div>
		<div class="div4">
			<a href="http://localhost:8080/dongsuh/brandSal.do?brandname="> <img
				src="http://localhost:8080/dongsuh/images/tassimo_main.jpg">
			</a>
		</div>
		<div class="div5">
			<a href="http://localhost:8080/dongsuh/brandSal.do?brandname=kanu">
				<img src="http://localhost:8080/dongsuh/images/kanu_main.jpg">
			</a>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>