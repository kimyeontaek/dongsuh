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
	/* �޷� */
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
							nextText : '���� ��',
							prevText : '���� ��',
							showButtonPanel : true,
							currentText : '���� ��¥',
							closeText : '�ݱ�',
							dateFormat : "yy-mm-dd",
							dayNames : [ '������', 'ȭ����', '������', '�����', '�ݿ���',
									'�����', '�Ͽ���' ],
							dayNamesMin : [ '��', 'ȭ', '��', '��', '��', '��', '��' ],
							monthNamesShort : [ '1', '2', '3', '4', '5', '6',
									'7', '8', '9', '10', '11', '12' ],
							monthNames : [ '1��', '2��', '3��', '4��', '5��', '6��',
									'7��', '8��', '9��', '10��', '11��', '12��' ]
						});
	});
</script>
<script>
	/* ȸ������ ��ȿ�� üũ */
	$(document).ready(function() {

		$("#btnJoin1").click(function() {
			if ($("#id").val() == "") {
				alert("���̵� �Է��ϼ���.");
				$("#id").focus();
				return false;
			} else if ($("#pass").val() == "") {
				alert("��й�ȣ�� �Է��ϼ���.");
				$("#pass").focus();
				return false;
			} else if ($("#cpass").val() == "") {
				alert("��й�ȣ Ȯ���� �Է��ϼ���.");
				$("#cpass").focus();
				return false;
			} else if ($("#name").val() == "") {
				alert("�̸��� �Է��ϼ���.");
				$("#id").focus();
				return false;
			} else if ($("#calender").val() == "") {
				alert("��������� �Է��ϼ���.");
				$("#calender").focus();
				return false;
			} else if ($("#email1").val() == "") {
				alert("�̸����� �Է��ϼ���.");
				$("#email1").focus();
				return false;
			} else if ($("#email2").val() == "") {
				alert("�̸����� �Է��ϼ���.");
				$("#email2").focus();
				return false;
			} else if ($("#phone1").val() == "") {
				alert("�޴�����ȣ�� �Է��ϼ���.");
				$("#phone1").focus();
				return false;
			} else if ($("#phone2").val() == "") {
				alert("�޴�����ȣ ���ڸ��� �Է��ϼ���.");
				$("#phone2").focus();
				return false;
			} else if ($("#ad5").val() == "") {
				alert("���ּҸ� �Է��� �ּ���.")
				$("#ad5").focus();
				return false;
			} else {
				alert("ȸ�����Կ� �����ϼ̽��ϴ�.");
			}
			joinform.submit();
		});

		//�̸��� ������ ����      
		$("#selectEmail").change(function() {

			var selectEmail = $(this).val();

			if (selectEmail == "self") { //�����Է�
				$("input[name=email2]").val(''); //�̸��� ������ �Է¹ڽ� �ʱ�ȭ
				$("input[name=email2]").attr('readonly', false);
			} else {
				$("input[name=email2]").val(selectEmail); // �̸��� ������ �Է¹ڽ��� ���õ� ȣ��Ʈ ���.
				$("input[name=email2]").attr('readonly', true);

			}
		});
	});
	/* �Է� ���� */
	$(document)
			.ready(
					function() {

						$("input[name=phone1]").keyup(function(event) {
							regexp4 = /[^0123456789]/g;
							v = $(this).val();
							if (regexp4.test(v)) {
								alert("���ڸ� �Է°����մϴ�.");
								$(this).val(v.replace(regexp4, ''));
							}
						});
						$("input[name=phone2]").keyup(function(event) {
							regexp5 = /[^0123456789]/g;
							v = $(this).val();
							if (regexp5.test(v)) {
								alert("���ڸ� �Է°����մϴ�.");
								$(this).val(v.replace(regexp5, ''));
							}
						});

						//��й�ȣ & ��й�ȣ Ȯ�� üũ
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
																"��й�ȣ�� �����մϴ�.");
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
																		"��й�ȣ�� �ٸ��ϴ�. �ٽ� �Է��� �ּ���.");
														$("#pass").focus();
														return false;
													}

												}
											}

											//���̵� �ߺ�üũ : Jquery + Ajax + JSP		
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
																						//alert("����"+data);
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
																											"�ߺ��� ���̵� �ֽ��ϴ�. �ٽ� �Է����ּ���.");
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
																											"���̵� ����� �����մϴ�.");
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
<!-- radio üũ -->
	$("input:radio[name='bd']:radio[value='���']").prop('checked', true);
	$("input:radio[name='bd']:radio[value='���']").prop('checked', false);

	$("input:radio[name='agree']:radio[value='����']").prop('checked', true);
	$("input:radio[name='agree']:radio[value='����']").prop('checked', false);
</script>
</head>
<style>
/* radio �̹��� ���� */
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
					<b>ȸ������</b>
				</p>
				<div id="sub12">
					<h1 id="sub1">�������</h1>
					>
					<h1 id="sub2">�����Է�</h1>
				</div>

				<div id="div1">

					<ul>

						<li><h5>
								<b style="color: red;">*</b> �׸��� �ʼ� �Է»��� �Դϴ�.
							</h5></li>
						<hr>

						<li><label class="bd">���̵�</label> <input type="text" id="id"
							name="id" maxlength="30"> <!-- <input type="button" value="�ߺ�Ȯ��" onclick="joinIdchk();"> -->
						</li>
						<hr>
						<li><label class="bd">��й�ȣ</label> <input type="password"
							id="pass" name="pass" maxlength="30"> <h8 id="h8_1">*��й�ȣ��
							</h8> <h8 id="h8_2">8�ڸ� �̻����� ������ ����, Ư�����ڸ� 3���� �̻� ����</h8> <h8
								id="h8_3"> �Ͽ� ����ϼ���.</h8></li>
						<hr>
						<li><label class="bd">��й�ȣ Ȯ��</label> <input type="password"
							id="cpass" name="cpass" maxlength="30"> <span id="msg"></span>
						</li>
						<hr>

						<li><label class="bd"><b style="color: red;">*</b>�̸�</label>
							<input type="text" id="name" name="name" maxlength="10">
						</li>
						<hr>
						<li><label class="bd"><b style="color: red;">*</b>�������</label>
							<input type="text" id="calender" name="calender" readonly>
							<input type="radio" name="bd" value="���" id="cb1" checked><label
							for="cb1"></label>��� <input type="radio" name="bd" value="����"
							id="cb2"><label for="cb2"></label>����</li>
						<hr>
						<li><label class="bd"><b style="color: red;">*</b>�̸���</label>
							<input type="text" id="email1" name="email1" maxlength="30" /> @
							<input type="text" id="email2" name="email2" maxlength="30" /> <select
							name="email3" id="selectEmail">
								<option value="self" selected="selected">�����Է�</option>
								<option value="chol.com">õ����</option>
								<option value="daum.net">����</option>
								<option value="dreamwiz.com">�帲����</option>
								<option value="empal.com">����</option>
								<option value="freechal.com">����ç</option>
								<option value="hanafos.com">�ϳ�����</option>
								<option value="hotmail.com">�ָ���</option>
								<option value="intizen.com">��Ƽ��</option>
								<option value="kebi.com">����</option>
								<option value="korea.com">�ڸ���</option>
								<option value="lycos.co.kr">�����ڽ�</option>
								<option value="nate.com">����Ʈ</option>
								<option value="naver.com">���̹�</option>
								<option value="paran.com">�Ķ�</option>
								<option value="yahoo.co.kr">����</option>
						</select></li>
						<hr>
						<li><label class="bd"><b style="color: red;">*</b>�޴�����ȣ</label>
							<select id="phone" name="phone">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="019">019</option>
						</select> -&nbsp;<input type="text" id="phone1" name="phone1" maxlength="4">
							-&nbsp;<input type="text" id="phone2" name="phone2" maxlength="4">
						</li>
						<hr>
						<li><label class="bd">�ּ�</label> <input type="text"
							name="ad1" id="ad1" class="postcodify_jibeon_address" value=""
							readonly /> <input type="text" name="ad2" id="ad2"
							class="postcodify_postcode6_1" value="" readonly /> - <input
							type="text" id="ad3" name="ad3" class="postcodify_postcode6_2"
							value="" readonly />
							<button type="button" id="postcodify_search_button">�����ȣ</button>
							<h8 style="color:gray;">*���ּҸ� ���� �Է��� �ּ���</h8></li>

						<li id="rn"><br> <label class="bd">���θ� �ּ�</label><br>
							<input type="text" name="ad4" class="postcodify_address" id="ad4"
							readonly /> <input type="text" class="postcodify_details"
							id="ad5" name="ad5" maxlength="30" placeholder="���ּҸ� �Է��� �ּ���.">
							<p style="color: gray">*�ּҺ��� �� �����ּҿ� ���θ� �ּ��� ���ּҸ� �Բ� ����
								��Ź�帳�ϴ�.</p>
							<p style="color: gray">*�̺�Ʈ ��÷�� ��ǰ�߼��� ���� ���� �Ǵ� ���θ� �ּ��� ��
								�ּұ��� �ʿ��մϴ�.</p></li>
					</ul>
				</div>
				<div id="div2">
					<div id="si2">
						<label class="bd">��������</label>
					</div>
					<hr>
					<label class="bd"><b style="color: red;">*</b>���� ���� ����</label>
					&nbsp;&nbsp;<input type="radio" name="agree" value="����" id="cb3"
						checked /><label for="cb3"></label>������ <input type="radio"
						name="agree" value="�������� ����" id="cb4" /><label for="cb4"></label>��������
					���� <br>
				</div>
				<div id="div3">
					<input id="btnJoin1" value="�����ܰ�" /> <a
						href="http://localhost:8080/dongsuh/index.do"><input
						style="float: right" type="button" id="btnJoin2" value="���" /></a>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>