<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
<script>
	/* 달력 */
	$(function() {
		$("#calender")
				.datepicker(
						{
							showOn : "both",
							buttonImage : "http://localhost:8080/dongsuh/images/calender.png",
							buttonImageOnly : true,
							changeMonth : true,
							changeYear : true,
							YearRange : 'c-100:c+10',
							minDate : '-100y',
							nextText : '다음 달',
							prevText : '이전 달',
							showButtonPanel : true,
							currentText : '오늘 날짜',
							closeText : '닫기',
							dateFormat : "yy-mm-dd",
							dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일',
									'토요일', '일요일' ],
							dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
							monthNamesShort : [ '1', '2', '3', '4', '5', '6',
									'7', '8', '9', '10', '11', '12' ],
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ]
						});
	});
</script>
<script>
	/* 회원가입 유효성 체크 */
	$(document).ready(function() {

		$("#btnJoin1").click(function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return false;
			} else if ($("#pass").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("#pass").focus();
				return false;
			} else if ($("#cpass").val() == "") {
				alert("비밀번호 확인을 입력하세요.");
				$("#cpass").focus();
				return false;
			} else if ($("#name").val() == "") {
				alert("이름을 입력하세요.");
				$("#id").focus();
				return false;
			} else if ($("#calender").val() == "") {
				alert("생년월일을 입력하세요.");
				$("#calender").focus();
				return false;
			} else if ($("#email1").val() == "") {
				alert("이메일을 입력하세요.");
				$("#email1").focus();
				return false;
			} else if ($("#email2").val() == "") {
				alert("이메일을 입력하세요.");
				$("#email2").focus();
				return false;
			} else if ($("#phone1").val() == "") {
				alert("휴대폰번호를 입력하세요.");
				$("#phone1").focus();
				return false;
			} else if ($("#phone2").val() == "") {
				alert("휴대폰번호 뒷자리를 입력하세요.");
				$("#phone2").focus();
				return false;
			} else if ($("#ad5").val() == "") {
				alert("상세주소를 입력해 주세요.")
				$("#ad5").focus();
				return false;
			} else {
				alert("회원가입에 성공하셨습니다.");
			}
			joinform.submit();
		});

		//이메일 도메인 선택      
		$("#selectEmail").change(function() {

			var selectEmail = $(this).val();

			if (selectEmail == "self") { //직접입력
				$("input[name=email2]").val(''); //이메일 도메인 입력박스 초기화
				$("input[name=email2]").attr('readonly', false);
			} else {
				$("input[name=email2]").val(selectEmail); // 이메일 도메인 입력박스에 선택된 호스트 등록.
				$("input[name=email2]").attr('readonly', true);

			}
		});
	});
	/* 입력 제한 */
	$(document)
			.ready(
					function() {

						$("input[name=phone1]").keyup(function(event) {
							regexp4 = /[^0123456789]/g;
							v = $(this).val();
							if (regexp4.test(v)) {
								alert("숫자만 입력가능합니다.");
								$(this).val(v.replace(regexp4, ''));
							}
						});
						$("input[name=phone2]").keyup(function(event) {
							regexp5 = /[^0123456789]/g;
							v = $(this).val();
							if (regexp5.test(v)) {
								alert("숫자만 입력가능합니다.");
								$(this).val(v.replace(regexp5, ''));
							}
						});

						//비밀번호 & 비밀번호 확인 체크
						$("#cpass")
								.focusout(
										function() {
											if ($("#pass").val() == "") {

											} else {
												if ($("#cpass").val() != "") {
													if ($("#pass").val() == $(
															"#cpass").val()) {
														$("#msg")
																.css("display",
																		"block")
																.css(
																		"font-size",
																		"9pt")
																.css("color",
																		"blue")
																.css("padding",
																		"3px 0px 0px 120px");
														$("#msg").text(
																"비밀번호가 동일합니다.");
														return false;
													} else {
														$("#msg")
																.css("display",
																		"block")
																.css(
																		"font-size",
																		"9pt")
																.css("color",
																		"red")
																.css("padding",
																		"3px 0px 0px 120px");
														$("#msg")
																.text(
																		"비밀번호가 다릅니다. 다시 입력해 주세요.");
														$("#pass").focus();
														return false;
													}

												}
											}

											//아이디 중복체크 : Jquery + Ajax + JSP		
											$("#id")
													.focusout(
															function() {

																var id = $(
																		"#id")
																		.val();

																if (id != "") {

																	$
																			.ajax({
																				url : 'http://localhost:8080/dongsuh/id_check.do',
																				type : 'POST',
																				data : 'id='
																						+ id,
																				dataType : "json",
																				success : function(
																						data) {
																					if (data.length != 0) {
																						//alert("있음"+data);
																						if (data == 1) {
																							$(
																									"#id_msg")
																									.css(
																											"display",
																											"block")
																									.css(
																											"font-size",
																											"9pt")
																									.css(
																											"color",
																											"red")
																									.css(
																											"padding",
																											"3px 0px 0px 150px");
																							$(
																									"#id_msg")
																									.text(
																											"중복된 아이디가 있습니다. 다시 입력해주세요.");
																							$(
																									"#id")
																									.focus();

																							return false;
																						} else {
																							$(
																									"#id_msg")
																									.css(
																											"display",
																											"block")
																									.css(
																											"font-size",
																											"9pt")
																									.css(
																											"color",
																											"blue")
																									.css(
																											"padding",
																											"3px 0px 0px 150px");
																							$(
																									"#id_msg")
																									.text(
																											"아이디 사용이 가능합니다.");
																							$(
																									"#pass")
																									.focus();

																							return false;
																						}

																					}
																				}
																			}); //end ajax			
																}
															}); //end id_check

										});
					});
</script>
<script>
<!-- radio 체크 -->
	$("input:radio[name='bd']:radio[value='양력']").prop('checked', true);
	$("input:radio[name='bd']:radio[value='양력']").prop('checked', false);

	$("input:radio[name='agree']:radio[value='동의']").prop('checked', true);
	$("input:radio[name='agree']:radio[value='동의']").prop('checked', false);
</script>
</head>
<style>
/* radio 이미지 변경 */
input[type=radio] {
	display: none;
}

input[type=radio]+label {
	display: inline-block;
	min-width: 30px;
	height: 30px;
	background: url('http://localhost:8080/dongsuh/images/check_off.png')
		right/30px no-repeat;
}

input[type=radio]:checked+label {
	background: url('http://localhost:8080/dongsuh/images/check_on.png')
		right/30px no-repeat;
}

#durtmf {
	padding-top: 50px;
	color: #d0021b;
}
/* */
#join_check {
	text-align: center;
	margin-bottom: 70px;
}

#sf {
	width: 100%;
	padding: 0px;
}

#div1 label.bd {
	display: inline-block;
	padding: 1px;
	width: 10%;
}

#h8_1,#h8_3 {
	color: gray;
}

#h8_2 {
	color: red;
}

#ad1 {
	width: 300px;
}

#ad2,#ad3 {
	width: 60px;
}

#ad4 {
	width: 300px;
}

#ad5 {
	width: 200px;
}

#si2 {
	text-align: center;
	font-size: 15px;
}

#durtmf,#mj,#sub {
	text-align: center;
	font-size: 25px;
}

#sub1,#sub2 {
	background-color: #333;
	border-radius: 80px;
	font-size: 20px;
	display: inline-block;
	text-align: center;
	padding: 10px 30px 15px 30px;
}

#sub12 {
	text-align: center;
}

#sub1 {
	color: gray;
}

#sub2 {
	color: white;
}

#div1 {
	margin-top: 30px;
	padding: 30px 30px 30px 0px;
	border-radius: 25px;
	background-color: white;
}

#div2 {
	border-radius: 25px;
	margin-top: 20px;
	padding: 30px;
	background-color: white;
}

h5 {
	text-align: center;
}

#h4 {
	color: red;
}

#rn {
	padding-left: 120px;
}

#div3 {
	text-align: center;
	padding: 40px 0px 100px 0px;
}

#bdiv0 {
	margin: -25px 0px -25px 0px;
	background-color: #f4f1e6;
}

#btnJoin1 {
	border: 1px solid black;
	background-color: rgb(208, 2, 27);
	color: white;
	padding: 16px 0px;
	text-align: center;
	font-size: 16px;
	margin: center;
	transition-duration: 0.3s;
	display: inline-block;
	text-decoration: none;
	cursor: pointer;
	border-radius: 25px;
}

#btnJoin2 {
	background-color: white;
	padding: 16px 32px;
	text-align: center;
	font-size: 16px;
	margin: center;
	transition-duration: 0.3s;
	display: inline-block;
	text-decoration: none;
	cursor: pointer;
	border-radius: 25px;
}

#phone1,#phone2 {
	width: 10%;
}
</style>
<body>

	<jsp:include page="../header.jsp"></jsp:include>

	<div id="bdiv0">
		<div class="bdiv">
			<form name="joinform"
				action="http://localhost:8080/dongsuh/join_controller.do"
				method="POST">
				<p id="durtmf">/</p>
				<p id="mj">
					<b>회원가입</b>
				</p>
				<div id="sub12">
					<h1 id="sub1">약관동의</h1>
					>
					<h1 id="sub2">정보입력</h1>
				</div>

				<div id="div1">

					<ul>

						<li><h5>
								<b style="color: red;">*</b> 항목은 필수 입력사항 입니다.
							</h5></li>
						<hr>

						<li><label class="bd">아이디</label> <input type="text" id="id"
							name="id" maxlength="30"> <!-- <input type="button" value="중복확인" onclick="joinIdchk();"> -->
						</li>
						<hr>
						<li><label class="bd">비밀번호</label> <input type="password"
							id="pass" name="pass" maxlength="30"> <h8 id="h8_1">*비밀번호는
							</h8> <h8 id="h8_2">8자리 이상으로 영문과 숫자, 특수문자를 3가지 이상 조합</h8> <h8
								id="h8_3"> 하여 사용하세요.</h8></li>
						<hr>
						<li><label class="bd">비밀번호 확인</label> <input type="password"
							id="cpass" name="cpass" maxlength="30"> <span id="msg"></span>
						</li>
						<hr>

						<li><label class="bd"><b style="color: red;">*</b>이름</label>
							<input type="text" id="name" name="name" maxlength="10">
						</li>
						<hr>
						<li><label class="bd"><b style="color: red;">*</b>생년월일</label>
							<input type="text" id="calender" name="calender" readonly>
							<input type="radio" name="bd" value="양력" id="cb1" checked><label
							for="cb1"></label>양력 <input type="radio" name="bd" value="음력"
							id="cb2"><label for="cb2"></label>음력</li>
						<hr>
						<li><label class="bd"><b style="color: red;">*</b>이메일</label>
							<input type="text" id="email1" name="email1" maxlength="30" /> @
							<input type="text" id="email2" name="email2" maxlength="30" /> <select
							name="email3" id="selectEmail">
								<option value="self" selected="selected">직접입력</option>
								<option value="chol.com">천리안</option>
								<option value="daum.net">다음</option>
								<option value="dreamwiz.com">드림위즈</option>
								<option value="empal.com">엠팔</option>
								<option value="freechal.com">프리챌</option>
								<option value="hanafos.com">하나포스</option>
								<option value="hotmail.com">핫메일</option>
								<option value="intizen.com">인티즌</option>
								<option value="kebi.com">깨비</option>
								<option value="korea.com">코리아</option>
								<option value="lycos.co.kr">라이코스</option>
								<option value="nate.com">네이트</option>
								<option value="naver.com">네이버</option>
								<option value="paran.com">파란</option>
								<option value="yahoo.co.kr">야후</option>
						</select></li>
						<hr>
						<li><label class="bd"><b style="color: red;">*</b>휴대폰번호</label>
							<select id="phone" name="phone">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="019">019</option>
						</select> -&nbsp;<input type="text" id="phone1" name="phone1" maxlength="4">
							-&nbsp;<input type="text" id="phone2" name="phone2" maxlength="4">
						</li>
						<hr>
						<li><label class="bd">주소</label> <input type="text"
							name="ad1" id="ad1" class="postcodify_jibeon_address" value=""
							readonly /> <input type="text" name="ad2" id="ad2"
							class="postcodify_postcode6_1" value="" readonly /> - <input
							type="text" id="ad3" name="ad3" class="postcodify_postcode6_2"
							value="" readonly />
							<button type="button" id="postcodify_search_button">우편번호</button>
							<h8 style="color:gray;">*상세주소를 직접 입력해 주세요</h8></li>

						<li id="rn"><br> <label class="bd">도로명 주소</label><br>
							<input type="text" name="ad4" class="postcodify_address" id="ad4"
							readonly /> <input type="text" class="postcodify_details"
							id="ad5" name="ad5" maxlength="30" placeholder="상세주소를 입력해 주세요.">
							<p style="color: gray">*주소변경 시 지번주소와 도로명 주소의 상세주소를 함께 변경
								부탁드립니다.</p>
							<p style="color: gray">*이벤트 당첨시 경품발송을 위해 지번 또는 도로명 주소의 상세
								주소까지 필요합니다.</p></li>
					</ul>
				</div>
				<div id="div2">
					<div id="si2">
						<label class="bd">선택정보</label>
					</div>
					<hr>
					<label class="bd"><b style="color: red;">*</b>메일 수신 동의</label>
					&nbsp;&nbsp;<input type="radio" name="agree" value="동의" id="cb3"
						checked /><label for="cb3"></label>동의함 <input type="radio"
						name="agree" value="동의하지 않음" id="cb4" /><label for="cb4"></label>동의하지
					않음 <br>
				</div>
				<div id="div3">
					<input id="btnJoin1" value="다음단계" /> <a
						href="http://localhost:8080/dongsuh/index.do"><input
						style="float: right" type="button" id="btnJoin2" value="취소" /></a>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>