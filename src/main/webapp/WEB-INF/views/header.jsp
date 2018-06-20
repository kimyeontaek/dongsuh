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

		/* 로그인 유효성 체크 */
		$("#login_btn").click(function() {

			if ($("#loginForm_id").val() == "") {
				alert("아이디를 입력하세요");
				$("#loginForm_id").focus();
				return false;
			} else if ($("#loginForm_pass").val() == "") {
				alert("패스워드를 입력하세요");
				$("#loginForm_pass").focus();
				return false;
			}
			loginForm.submit();
		});

		/* 아이디찾기 유효성 체크 */
		$("#find_btn1").click(function() {

			if ($("#idFindForm_name").val() == "") {
				alert("이름를 입력하세요");
				$("#idFindForm_name").focus();
				return false;
			} else if ($("#idFindForm_phone").val() == "") {
				alert("휴대전화번호를 입력하세요");
				$("#idFindForm_phone").focus();
				return false;
			}

			$("#id1").val($("#idFindForm_name").val());
			$("#id2").val($("#idFindForm_phone").val());
			idFindForm.submit();
		});

		/* 비밀번호찾기 유효성 체크 */
		$("#find_btn2").click(function() {

			if ($("#passFindForm_id").val() == "") {
				alert("아이디를 입력하세요");
				$("#passFindForm_id").focus();
				return false;
			} else if ($("#passFindForm_name").val() == "") {
				alert("이름을 입력하세요");
				$("#passFindForm_name").focus();
				return false;
			} else if ($("#passFindForm_phone").val() == "") {
				alert("휴대전화번호 입력하세요");
				$("#passFindForm_phone").focus();
				return false;
			} else if ($("#passFindForm_pnum").val() == "") {
				alert("생년월일을 입력하세요");
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
					<li><a href="http://localhost:8080/dongsuh/brand.do"><label>브랜드</label></a>
					</li>
					<li><a href="http://localhost:8080/dongsuh/faq.do"><label>FAQ</label></a>
					</li>
					<li><a href="http://localhost:8080/dongsuh/csForm.do"><label
							class="label">고객문의</label></a></li>
				</ul>
				<ul class="header_menu2">
					<li><a href="http://localhost:8080/dongsuh/join_check.do"><label>회원가입</label></a>
					</li>
					<!-- 로그인 modal -->
					<li>
						<div class="w3-container">
							<label
								onclick="document.getElementById('id01').style.display='block'">로그인</label>
							<div id="id01" class="w3-modal">
								<div class="w3-modal-content" id="loginModalBox">
									<div class="w3-container">
										<span
											onclick="document.getElementById('id01').style.display='none'"
											class="w3-button w3-display-topright">&times;</span>
										<!-- 로그인 모달 내용 -->
										<p id="modal_title">로그인</p>
										<form name="loginForm"
											action="http://localhost:8080/dongsuh/login_check.do"
											method="post" class="loginForm">
											<div id="loginForm_div">
												<div id="loginForm_div1">
													<input type="text" name="id" placeholder="아이디"
														id="loginForm_id"> 
														<input type="password"
														name="pass" placeholder="비밀번호" id="loginForm_pass">
												</div>
												<div id="loginForm_div2">
													<button id="login_btn" type="button">로그인</button>
												</div>
											</div>
											<div id="loginForm_div3">

												<!-- 아이디/비밀번호 찾기 modal -->
												<div class="w3-container">
													<p
														onclick="document.getElementById('id06').style.display='block'">
														<u>아이디/비밀번호 찾기</u>
													</p>
													<p>
														<a href="http://localhost:8080/dongsuh/join_check.do">회원가입</a>
													</p>
													<br> <br> <br>
													<div id="id06" class="w3-modal">
														<div class="w3-modal-content" id="findModalBox">
															<div class="w3-container">
																<span
																	onclick="document.getElementById('id06').style.display='none'"
																	class="w3-button w3-display-topright">&times;</span>
																<!-- 아이디/비밀번호 찾기 모달 내용 -->
																<p id="modal_title">&nbsp;&nbsp;&nbsp;&nbsp;아이디&nbsp;/&nbsp;비밀번호
																	찾기</p>
																<div id="find_div1">
																	<table>
																		<tr>
																			<td><input type="text" placeholder="이름을 입력하세요"
																				id="idFindForm_name"><br> <input
																				type="text" placeholder="전화번호를 입력하세요(-포함 13자리)"
																				id="idFindForm_phone"><br>
																				<button id="find_btn1" type="button">아이디 찾기</button>
																			</td>
																			<td><input type="text" placeholder="아이디를 입력하세요"
																				id="passFindForm_id"><br> <input
																				type="text" placeholder="이름을 입력하세요"
																				id="passFindForm_name"><br> <input
																				type="text" placeholder="전화번호를 입력하세요(-포함 13자리)"
																				id="passFindForm_phone"><br> <input
																				type="password" placeholder="생년월일을 입력하세요(-포함 10자리)"
																				id="passFindForm_pnum"><br>
																				<button id="find_btn2" type="button">비밀번호
																					찾기</button></td>
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
					<li><a href="http://localhost:8080/dongsuh/notLogin.do"><label>마이페이지</label></a>
					</li>
				</ul>
			</c:when>
			<c:when test="${sessionScope.sid != null}">
				<ul class="header_menu1">
					<li><a href="http://localhost:8080/dongsuh/brand.do"><label>브랜드</label></a>
					</li>
					<li><a href="http://localhost:8080/dongsuh/faq.do"><label>FAQ</label></a>
					</li>
					<li><a href="http://localhost:8080/dongsuh/csForm.do"><label
							class="label">고객문의</label></a></li>
				</ul>
				<ul class="header_menu2">
					<li><a href="http://localhost:8080/dongsuh/join_check.do"><label>회원가입</label></a>
					</li>
					<li><a href="http://localhost:8080/dongsuh/logout.do"><label>로그아웃</label></a>
					</li>
					<!-- 마이페이지 modal -->
					<li>
						<div class="w3-container">
							<label
								onclick="document.getElementById('id05').style.display='block'">마이페이지</label>
							<div id="id05" class="w3-modal">
								<div class="w3-modal-content" id="mypageModalBox">
									<div class="w3-container">
										<span
											onclick="document.getElementById('id05').style.display='none'"
											class="w3-button w3-display-topright">&times;</span>
										<!-- 마이페이지 모달 내용 -->
										<p id="modal_title">My page</p>
										<div id="mypage_div1">
											<a href="http://localhost:8080/dongsuh/join_update_select.do"><div
													id="mypage_div2">
													<div id="mypage_div3">
														<label id="mypage_label1_1">INFO<br></label> <label
															id="mypage_label2">개인정보<br> <br></label> <label
															id="mypage_label3">고객님의 개인정보를<br>관리하실 수
															있습니다.
														</label>
													</div>
												</div></a> <a href="http://localhost:8080/dongsuh/basket.do"><div
													id="mypage_div2">
													<div id="mypage_div3">
														<label id="mypage_label1_2">BASKET<br></label> <label
															id="mypage_label2">장바구니<br> <br></label> <label
															id="mypage_label3">장바구니를<br>확인하실 수 있습니다.
														</label>
													</div>
												</div></a>
											<c:if test="${sessionScope.sid eq 'admin' }">
												<a href="http://localhost:8080/dongsuh/csAdminBoard_list.do"><div
														id="mypage_div2">
														<div id="mypage_div3">
															<label id="mypage_label1_3">INQUIRY<br></label> <label
																id="mypage_label2">문의내역<br> <br></label> <label
																id="mypage_label3">문의하신 내용을<br>확인하실 수 있습니다.
															</label>
														</div>
													</div></a>
											</c:if>
											<c:if test="${sessionScope.sid != 'admin' }">
												<a href="http://localhost:8080/dongsuh/csBoard_list.do"><div
														id="mypage_div2">
														<div id="mypage_div3">
															<label id="mypage_label1_3">INQUIRY<br></label> <label
																id="mypage_label2">문의내역<br> <br></label> <label
																id="mypage_label3">문의하신 내용을<br>확인하실 수 있습니다.
															</label>
														</div>
													</div></a>
											</c:if>
											<a href="http://localhost:8080/dongsuh/order_list.do"><div
													id="mypage_div2">
													<div id="mypage_div3">
														<label id="mypage_label1_4">ORDER<br></label> <label
															id="mypage_label2">주문내역<br> <br></label> <label
															id="mypage_label3">주문상품내역을<br>확인하실 수 있습니다.
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