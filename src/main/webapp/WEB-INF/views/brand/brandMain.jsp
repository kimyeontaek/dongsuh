<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/dongsuh/css/dongsuh.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/dongsuh/css/dongsuh.css">
</head>
<body>
	<jsp:include page="../header.jsp" /><div class="bdiv">
		<div id="brand_main">

			<div id="title_div">

				<p id="title_p1">/</p>
				<p id="title_p2">브랜드</p>
				<p>
					<img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png">
				</p>
			</div>
			<c:forEach var="vo" items="${list}">
				<div id="brand_main_div2">
					<div id="brand_main_img_div1">
						<a
							href="http://localhost:8080/dongsuh/brandSal.do?brandname=${vo.brandname}">
							<img src="http://localhost:8080/dongsuh/images/${vo.brandimage}">
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<hr class="hr">

	</div><jsp:include page="../footer.jsp" />

</body>
</html>