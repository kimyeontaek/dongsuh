<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="dongsuh.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/dongsuh/css/dongsuh.css">

<script>
	$(document).ready(function() {

		/* �α��� ��ȿ�� üũ */
		$("#login_btn").click(function() {

			if ($("#loginForm_id").val() == "") {
				alert("���̵� �Է��ϼ���");
				$("#loginForm_id").focus();
				return false;
			} else if ($("#loginForm_pass").val() == "") {
				alert("�н����带 �Է��ϼ���");
				$("#loginForm_pass").focus();
				return false;
			}
			loginForm.submit();
		});

		/* ���̵�ã�� ��ȿ�� üũ */
		$("#find_btn1").click(function() {

			if ($("#idFindForm_name").val() == "") {
				alert("�̸��� �Է��ϼ���");
				$("#idFindForm_name").focus();
				return false;
			} else if ($("#idFindForm_phone").val() == "") {
				alert("�޴���ȭ��ȣ�� �Է��ϼ���");
				$("#idFindForm_phone").focus();
				return false;
			}

			$("#id1").val($("#idFindForm_name").val());
			$("#id2").val($("#idFindForm_phone").val());
			idFindForm.submit();
		});

		/* ��й�ȣã�� ��ȿ�� üũ */
		$("#find_btn2").click(function() {

			if ($("#passFindForm_id").val() == "") {
				alert("���̵� �Է��ϼ���");
				$("#passFindForm_id").focus();
				return false;
			} else if ($("#passFindForm_name").val() == "") {
				alert("�̸��� �Է��ϼ���");
				$("#passFindForm_name").focus();
				return false;
			} else if ($("#passFindForm_phone").val() == "") {
				alert("�޴���ȭ��ȣ �Է��ϼ���");
				$("#passFindForm_phone").focus();
				return false;
			} else if ($("#passFindForm_pnum").val() == "") {
				alert("��������� �Է��ϼ���");
				$("#passFindForm_pnum").focus();
				return false;
			}
			$("#pass1").val($("#passFindForm_id").val());
			$("#pass2").val($("#passFindForm_name").val());
			$("#pass3").val($("#passFindForm_phone").val());
			$("#pass4").val($("#passFindForm_pnum").val());
			passFindForm.submit();
		});

	});
</script>
</head>
<body>
	<header>
	<div class="div1">
		<a href="http://localhost:8080/dongsuh/index.do"> <img
			src="http://localhost:8080/dongsuh/images/logo.png" class="logo"></a>
		<c:choose>
			<c:when test="${sessionScope.sid == null}">
				<ul class="header_menu1">
					<li><a href="http://localhost:8080/dongsuh/brand.do"><label>�귣��</label></a>
					</li>
					<li><a href="http://localhost:8080/dongsuh/faq.do"><label>FAQ</label></a>
					</li>
					<li><a href="http://localhost:8080/dongsuh/csForm.do"><label
							class="label">������</label></a></li>
				</ul>
				<ul class="header_menu2">
					<li><a href="http://localhost:8080/dongsuh/join_check.do"><label>ȸ������</label></a>
					</li>
					<!-- �α��� modal -->
					<li>
						<div class="w3-container">
							<label
								onclick="document.getElementById('id01').style.display='block'">�α���</label>
							<div id="id01" class="w3-modal">
								<div class="w3-modal-content" id="loginModalBox">
									<div class="w3-container">
										<span
											onclick="document.getElementById('id01').style.display='none'"
											class="w3-button w3-display-topright">&times;</span>
										<!-- �α��� ��� ���� -->
										<p id="modal_title">�α���</p>
										<form name="loginForm"
											action="http://localhost:8080/dongsuh/login_check.do"
											method="post" class="loginForm">
											<div id="loginForm_div">
												<div id="loginForm_div1">
													<input type="text" name="id" placeholder="���̵�"
														id="loginForm_id"> 
														<input type="password"
														name="pass" placeholder="��й�ȣ" id="loginForm_pass">
												</div>
												<div id="loginForm_div2">
													<button id="login_btn" type="button">�α���</button>
												</div>
											</div>
											<div id="loginForm_div3">

												<!-- ���̵�/��й�ȣ ã�� modal -->
												<div class="w3-container">
													<p
														onclick="document.getElementById('id06').style.display='block'">
														<u>���̵�/��й�ȣ ã��</u>
													</p>
													<p>
														<a href="http://localhost:8080/dongsuh/join_check.do">ȸ������</a>
													</p>
													<br> <br> <br>
													<div id="id06" class="w3-modal">
														<div class="w3-modal-content" id="findModalBox">
															<div class="w3-container">
																<span
																	onclick="document.getElementById('id06').style.display='none'"
																	class="w3-button w3-display-topright">&times;</span>
																<!-- ���̵�/��й�ȣ ã�� ��� ���� -->
																<p id="modal_title">&nbsp;&nbsp;&nbsp;&nbsp;���̵�&nbsp;/&nbsp;��й�ȣ
																	ã��</p>
																<div id="find_div1">
																	<table>
																		<tr>
																			<td><input type="text" placeholder="�̸��� �Է��ϼ���"
																				id="idFindForm_name"><br> <input
																				type="text" placeholder="��ȭ��ȣ�� �Է��ϼ���(-���� 13�ڸ�)"
																				id="idFindForm_phone"><br>
																				<button id="find_btn1" type="button">���̵� ã��</button>
																			</td>
																			<td><input type="text" placeholder="���̵� �Է��ϼ���"
																				id="passFindForm_id"><br> <input
																				type="text" placeholder="�̸��� �Է��ϼ���"
																				id="passFindForm_name"><br> <input
																				type="text" placeholder="��ȭ��ȣ�� �Է��ϼ���(-���� 13�ڸ�)"
																				id="passFindForm_phone"><br> <input
																				type="password" placeholder="��������� �Է��ϼ���(-���� 10�ڸ�)"
																				id="passFindForm_pnum"><br>
																				<button id="find_btn2" type="button">��й�ȣ
																					ã��</button></td>
																		</tr>
																	</table>
																	<br> <br>
																</div>
															</div>
														</div>
													</div>
												</div>

											</div>

										</form>
										<form name="idFindForm"
											action="http://localhost:8080/dongsuh/idFindResult.do"
											method="POST">
											<input type="hidden" name="idFindForm_name" id="id1">
											<input type="hidden" name="idFindForm_phone" id="id2">
										</form>
										<form name="passFindForm"
											action="http://localhost:8080/dongsuh/passFindResult.do"
											method="POST">
											<input type="hidden" name="passFindForm_id" id="pass1">
											<input type="hidden" name="passFindForm_name" id="pass2">
											<input type="hidden" name="passFindForm_phone" id="pass3">
											<input type="hidden" name="passFindForm_pnum" id="pass4">
										</form>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li><a href="http://localhost:8080/dongsuh/notLogin.do"><label>����������</label></a>
					</li>
				</ul>
			</c:when>
			<c:when test="${sessionScope.sid != null}">
				<ul class="header_menu1">
					<li><a href="http://localhost:8080/dongsuh/brand.do"><label>�귣��</label></a>
					</li>
					<li><a href="http://localhost:8080/dongsuh/faq.do"><label>FAQ</label></a>
					</li>
					<li><a href="http://localhost:8080/dongsuh/csForm.do"><label
							class="label">������</label></a></li>
				</ul>
				<ul class="header_menu2">
					<li><a href="http://localhost:8080/dongsuh/join_check.do"><label>ȸ������</label></a>
					</li>
					<li><a href="http://localhost:8080/dongsuh/logout.do"><label>�α׾ƿ�</label></a>
					</li>
					<!-- ���������� modal -->
					<li>
						<div class="w3-container">
							<label
								onclick="document.getElementById('id05').style.display='block'">����������</label>
							<div id="id05" class="w3-modal">
								<div class="w3-modal-content" id="mypageModalBox">
									<div class="w3-container">
										<span
											onclick="document.getElementById('id05').style.display='none'"
											class="w3-button w3-display-topright">&times;</span>
										<!-- ���������� ��� ���� -->
										<p id="modal_title">My page</p>
										<div id="mypage_div1">
											<a href="http://localhost:8080/dongsuh/join_update_select.do"><div
													id="mypage_div2">
													<div id="mypage_div3">
														<label id="mypage_label1_1">INFO<br></label> <label
															id="mypage_label2">��������<br> <br></label> <label
															id="mypage_label3">������ ����������<br>�����Ͻ� ��
															�ֽ��ϴ�.
														</label>
													</div>
												</div></a> <a href="http://localhost:8080/dongsuh/basket.do"><div
													id="mypage_div2">
													<div id="mypage_div3">
														<label id="mypage_label1_2">BASKET<br></label> <label
															id="mypage_label2">��ٱ���<br> <br></label> <label
															id="mypage_label3">��ٱ��ϸ�<br>Ȯ���Ͻ� �� �ֽ��ϴ�.
														</label>
													</div>
												</div></a>
											<c:if test="${sessionScope.sid eq 'admin' }">
												<a href="http://localhost:8080/dongsuh/csAdminBoard_list.do"><div
														id="mypage_div2">
														<div id="mypage_div3">
															<label id="mypage_label1_3">INQUIRY<br></label> <label
																id="mypage_label2">���ǳ���<br> <br></label> <label
																id="mypage_label3">�����Ͻ� ������<br>Ȯ���Ͻ� �� �ֽ��ϴ�.
															</label>
														</div>
													</div></a>
											</c:if>
											<c:if test="${sessionScope.sid != 'admin' }">
												<a href="http://localhost:8080/dongsuh/csBoard_list.do"><div
														id="mypage_div2">
														<div id="mypage_div3">
															<label id="mypage_label1_3">INQUIRY<br></label> <label
																id="mypage_label2">���ǳ���<br> <br></label> <label
																id="mypage_label3">�����Ͻ� ������<br>Ȯ���Ͻ� �� �ֽ��ϴ�.
															</label>
														</div>
													</div></a>
											</c:if>
											<a href="http://localhost:8080/dongsuh/order_list.do"><div
													id="mypage_div2">
													<div id="mypage_div3">
														<label id="mypage_label1_4">ORDER<br></label> <label
															id="mypage_label2">�ֹ�����<br> <br></label> <label
															id="mypage_label3">�ֹ���ǰ������<br>Ȯ���Ͻ� �� �ֽ��ϴ�.
														</label>
													</div>
												</div></a> <br>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
   </c:when>
		</c:choose>
	</div>

	<hr class="hr">

	</header>
</body>
</html>