<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="dongsuh.vo.BrandVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp" /><div class="bdiv">
		<div id="basket_div1">
			<div id="basket_div2">
				<p id="title_p1">/</p>
				<p id="title_p2">�ֹ�����</p>
			</div>
			<div id="basket_div3">
				<form name="basket" action="" method="post">
					<table id="basket_table1">
						<tr>
							<td width="260px">�����Ϸ�</td>
							<td width="460px">��ǰ��</td>
							<td width="150px">&nbsp;&nbsp;&nbsp;�ǸŰ�</td>
							<td width="80px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</td>
							<td width="150px">&nbsp;&nbsp;&nbsp;�հ�</td>
						</tr>

						<c:forEach items="${list }" var="vo">
							<tr>
								<td>${vo.odate }</td>
								<td>${vo.name }</td>
								<td><input type="text" value="${vo.price }" disabled
									class="basket_val">��</td>
								<td><input type="text" value="${vo.num }" max="999"
									min="1" class="basket_val" disabled></td>
								<td><input type="text" disabled class="basket_val"
									value="${vo.price*vo.num}">��</td>
							</tr>
						</c:forEach>

					</table>
				</form>
			</div>
		</div>
		<jsp:include page="../footer.jsp" />
</body>
</html>