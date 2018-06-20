<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="dongsuh.vo.BrandVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/dongsuh/css/dongsuh.css">
<script>
	/* ������ ���� �� ��ǰ�� ��� �ʱ�ȭ ��� */
	$(function() {
		var brandname = '${brandname}';
		$.ajax({
			url : 'http://localhost:8080/dongsuh/brandSalReply_list.do',
			method : 'GET',
			data : 'brandname=' + brandname,
			dataType : 'json',
			success : function(data) {
				$("#brand_sal_div43-1").remove();
				$("#brand_sal_div43-1 td").remove();
				for (i = 0; i < data.length; i++) {
					var code = "<tr id='brand_sal_div43-1'>" + "<td>"
							+ data[i].rno + "</td>" + "<td>" + data[i].content
							+ "</td>" + "<td>" + data[i].writer + "</td>"
							+ "<td>" + data[i].rdate + "</td>" + "</tr>";
					$("#brand_sal_div44 tr:last").after(code);
				}
			}
		});
	});

	$(document)
			.ready(
					function() {
						/* ��ǰ�� ��� ��� */
						$("#brand_sal_hide").hide();
						$("#brand_sal_div46").click(function() {
							$("#brand_sal_hide").toggle();
						});

						// ��ǰ ���ý� �����Ǵ� ��ü�� id�� �޸��ϱ����� ���� count
						var count = 0;

						/* ��Ͽ��� ��ǰ�� ���õǸ� div32�� �����ִ� ��� */
						$("#brand_sal_select")
								.change(
										function() {
											if ($("#brand_sal_select").val() != "select"
													& $("#brand_sal_select")
															.val() != "**") {
												$("#brand_sal_div32").show();
											}
										});

						/* ��Ͽ��� ��ǰ�� ���õǸ� ��� ���̺� �������� TR �߰� /���� �ϱ� */
						$("#brand_sal_select")
								.change(
										function() {
											count = count + 1;
											$.trClone = $(
													"#brand_sal_table2 tr:last")
													.clone().html();
											$.newTr = $("<tr>" + $.trClone
													+ "</tr>");
											$.btrClone = $(
													"#basketTable tr:last")
													.clone().html();
											$.bnewTr = $("<tr>" + $.btrClone
													+ "</tr>");
											$("#brand_sal_table2").append(
													$.newTr);
											$("#basketTable").append($.bnewTr);
											/* �ٷα����ϱ⸦ ���� ���� ���̴� ���̺� ���� */
											/* ��ǰ�� �߰� ��� */
											$.inputText = $(document
													.createElement("input"));
											$.inputText.attr({
												type : "text",
												class : "nameeee",
												id : "sal" + count + "name",
												value : $(this).val(),
												disabled : "disabled"
											});
											// ��ǰ�� ��ġ
											$(
													"#brand_sal_table2 tr:last td:nth-child(1)")
													.html("");
											$(
													"#brand_sal_table2 tr:last td:nth-child(1)")
													.append($.inputText);
											/* ��ǰ���� �߰� ��� */
											$.uad = $(document
													.createElement("input"));
											$.uad.attr({
												type : "number",
												id : "sal" + count,
												min : "1",
												max : "99",
												class : "uad",
												value : "1",
												name : "nums"
											});
											// ��ǰ���� ��ġ
											$(
													"#brand_sal_table2 tr:last td:nth-child(2)")
													.html("");
											$(
													"#brand_sal_table2 tr:last td:nth-child(2)")
													.append($.uad);

											/* ���� �����ϴ� ��ư �߰� */
											$.btnDelete = $(document
													.createElement("input"));
											$.btnDelete.attr({
												type : "button",
												class : "btttttt",
												id : "btnnnnn" + count
											});
											// ������ư ��ġ
											$(
													"#brand_sal_table2 tr:last td:nth-child(3)")
													.html("");
											$(
													"#brand_sal_table2 tr:last td:nth-child(3)")
													.append($.btnDelete);
											// ������ư�� ��� �߰�
											$(
													"#brand_sal_table2 tr>td:nth-child(3)>input[type='button']")
													.on(
															'click',
															function() {
																var did = $(
																		this)
																		.attr(
																				"id");
																var clone = "#"
																		+ did
																		+ "_clone";
																$(this)
																		.parent()
																		.parent()
																		.remove();
																$(clone)
																		.parent()
																		.parent()
																		.remove();

																// ��ǰ�� �����Ǿ� �� ��ǰ�ݾ� ����
																var dsum = 0;
																for (var i = 2; i < $("#brand_sal_table2 tr").length; i++) {
																	dsum = parseInt($(
																			"#brand_sal_table2 tr:nth-child("
																					+ i
																					+ ") td:nth-child(4) input[type=text]")
																			.val())
																			+ dsum;
																}
																$("#salSum")
																		.val(
																				dsum);
															});

											/* ���� x ��ǰ�� = �ǸŰ� �߰� ��� */
											$.price = $(document
													.createElement("input"));
											$.price.attr({
												type : "text",
												class : "testttt",
												disabled : "disabled",
												id : "sal" + count + "price",
											});
											//�ǸŰ� ��ġ
											$(
													"#brand_sal_table2 tr:last td:nth-child(4)")
													.html("");
											$(
													"#brand_sal_table2 tr:last td:nth-child(4)")
													.append($.price);
											//�ǸŰ� ��� ��� (DB���� ��ǰ��� ��ġ�ϴ� ���� ������ ����)
											<c:forEach var="vo" items="${list}">
											if ($(this).val() == "${vo.itemName }") {
												$("#sal" + count + "price")
														.val("${vo.itemPrice}");
											}
											</c:forEach>

											// ��ǰ���� hidden Ÿ������ �����ϴ� ���
											$.hidden1 = $(document
													.createElement("input"));
											$.hidden1.attr({
												type : "hidden",
												name : "names",
												value : $(this).val()
											});

											$(
													"#brand_sal_table2 tr:last td:nth-child(5)")
													.html("");
											$(
													"#brand_sal_table2 tr:last td:nth-child(5)")
													.append($.hidden1);

											var asdf = $(
													"#sal" + count + "price")
													.val();

											// ���� ������ hidden Ÿ������ �����ϴ� ���
											$.hidden2 = $(document
													.createElement("input"));
											$.hidden2.attr({
												type : "hidden",
												id : "sal" + count + "sprice",
												name : "prices",
												value : asdf
											});

											$(
													"#brand_sal_table2 tr:last td:nth-child(6)")
													.html("");
											$(
													"#brand_sal_table2 tr:last td:nth-child(6)")
													.append($.hidden2);
											/* �ٷα����ϱ⸦ ���� ���̺� ���� ���� */

											/* ��ٱ��ϴ�⸦ ���� ���̺� ���� (hidden Ÿ��) */
											// ��ǰ��
											$.basket1 = $(document
													.createElement("input"));
											$.basket1.attr({
												type : "hidden",
												name : "baname",
												value : $(this).val(),
												id : "btnnnnn" + count
														+ "_clone"
											});

											$(
													"#basketTable tr:last td:nth-child(1)")
													.html("");
											$(
													"#basketTable tr:last td:nth-child(1)")
													.append($.basket1);

											// ��ǰ����
											$.basket2 = $(document
													.createElement("input"));
											$.basket2.attr({
												type : "hidden",
												name : "banum",
												id : "bsal" + count,
												value : "1"
											});

											$(
													"#basketTable tr:last td:nth-child(2)")
													.html("");
											$(
													"#basketTable tr:last td:nth-child(2)")
													.append($.basket2);

											// ��ǰ ��������
											$.basket3 = $(document
													.createElement("input"));
											$.basket3.attr({
												type : "hidden",
												id : "bsal" + count + "price",
												name : "baprice"
											});

											$(
													"#basketTable tr:last td:nth-child(3)")
													.html("");
											$(
													"#basketTable tr:last td:nth-child(3)")
													.append($.basket3);
											<c:forEach var="vo" items="${list}">
											if ($(this).val() == "${vo.itemName }") {
												$("#bsal" + count + "price")
														.val("${vo.itemPrice}");
											}
											</c:forEach>
											/* ��ٱ��ϴ�⸦ ���� ���̺���� ���� */

											// ��ǰ ���ý� �� ��ǰ�ݾ� ��� ���
											var sum = 0;
											for (var i = 2; i < $("#brand_sal_table2 tr").length; i++) {
												sum = parseInt($(
														"#brand_sal_table2 tr:nth-child("
																+ i
																+ ") td:nth-child(4) input[type=text]")
														.val())
														+ sum;
											}
											$("#salSum").val(sum);

											/* ��ǰ �������� �� �Ͼ�� ��� */
											$("input[type=number")
													.change(
															function() {

																var id = $(this)
																		.attr(
																				"id");
																var sprice = "#"
																		+ id
																		+ "sprice";
																var price = "#"
																		+ id
																		+ "price";
																// �ǸŰ� = ��ǰ�� x ��ǰ���� ����
																var totsum = $(
																		sprice)
																		.val()
																		* $(
																				this)
																				.val();
																var bsal = "#b"
																		+ id;

																$(bsal)
																		.val(
																				$(
																						this)
																						.val());
																$(price).val(
																		totsum);
																// ������ ����Ǿ����� ��ü ��ǰ������ �� ��ǰ�ݾ� ��� ���
																var rsum = 0;
																for (var i = 2; i < $("#brand_sal_table2 tr").length; i++) {
																	rsum = parseInt($(
																			"#brand_sal_table2 tr:nth-child("
																					+ i
																					+ ") td:nth-child(4) input[type=text]")
																			.val())
																			+ rsum;
																}
																$("#salSum")
																		.val(
																				rsum);
															});

										});

						/* �ٷα����ϱ� ��ȿ�� üũ */
						$("#brand_sal_div36").click(function() {
							if ($("#salSum").val() == 0) {
								alert("��ǰ�� ������ �ּ���.");
								return false;
							}
							salForm.submit();
						});

						/* ��ٱ��ϴ�� ��ȿ�� üũ */
						$("#brand_sal_div38").click(function() {
							if ($("#salSum").val() == 0) {
								alert("��ǰ�� ������ �ּ���.");
								return false;
							}
							basketForm.submit();
						});

						/* ��ǰ�� ��� ��� */
						$("#brandSalReply_btn")
								.click(
										function() {
											if ($("#brandSalReply_content")
													.val() == "") {
												alert("��ǰ���� �Է����ּ���.");
												$("#brandSalReply_content")
														.focus();
												return false;
											} else if ($(
													"#brandSalReply_writer")
													.val() == "") {
												alert("�α����� �ʿ��� �����Դϴ�.");
												$("#brandSalReply_writer")
														.focus();
												return false;
											}
											/* ��ǰ�� ��� ���� */
											var content = $(
													"#brandSalReply_content")
													.val();
											var writer = $(
													"#brandSalReply_writer")
													.val();
											var bname = $(
													"#brandSalReply_bname")
													.val();

											$
													.ajax({
														url : 'http://localhost:8080/dongsuh/brandSalReply.do',
														type : 'GET',
														data : 'content='
																+ content
																+ '&writer='
																+ writer
																+ '&bname='
																+ bname,
														dataType : 'json',
														contentType : 'application/x-www-form-urlencoded;charset=utf-8',
														success : function(data) {
															if (data.length != 0) {
																alert("��� ��� �Ϸ�");
																// ��ǰ���� ����ϸ� ��ǰ�� ����� �����ϴ� ��� ȣ��
																reply_view_load();
															}
														}
													});
											/* ��ǰ�� ��� ���� */
										});

						/* ����� ���� �Լ� */
						/* ��ǰ�� ����� �����ϴ� ��� */
						reply_view_load = function() {
							var brandname = $("#brandSalReply_bname").val();
							$
									.ajax({
										url : 'http://localhost:8080/dongsuh/brandSalReply_list.do',
										method : 'GET',
										data : 'brandname=' + brandname,
										dataType : 'json',
										success : function(data) {
											$("#brand_sal_div44").remove();
											var table = "<table id='brand_sal_div44'>"
													+ "<tr id='brand_sal_div43'>"
													+ "<th style='width:70px;'>��ȣ</th>"
													+ "<th style='width:640px;'>��ǰ��</th>"
													+ "<th style='width:220px;'>�ۼ���</th>"
													+ "<th style='width:150px;'>�ۼ���</th>"
													+ "</tr>" + "</table>"
											$("#brand_sal_div42").append(table);
											for (i = 0; i < data.length; i++) {
												var code = "<tr id='brand_sal_div43-1'>"
														+ "<td>"
														+ data[i].rno
														+ "</td>"
														+ "<td>"
														+ data[i].content
														+ "</td>"
														+ "<td>"
														+ data[i].writer
														+ "</td>"
														+ "<td>"
														+ data[i].rdate
														+ "</td>" + "</tr>";
												$("#brand_sal_div44 tr:last")
														.after(code);
											}
										}
									});
						};
					});
</script>
<style>
.uad {
	width: 30px;
	height: 18px;
	border: 1px solid #BCBCBC;
	margin-left: 30px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/dongsuh.css">
</head>
<body>
	<jsp:include page="../header.jsp" /><div id="brand_sal_div">

		<div id="title_div">
			<p id="title_p1">/</p>
			<p id="title_p2">�귣��</p>
			<p>
				<img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png">
			</p>
		</div>

		<div id="brand_sal_div0">
			<div id="brand_sal_div1">
				<div>
					<a><img
						src="http://localhost:8080/dongsuh/images/${vo.brandinfo}" /></a>
				</div>
			</div>
			<div id="brand_sal_div2_0">
				<div id="brand_sal_div2">
					<table id="brand_sal_div21">
						<caption></caption>
						<tbody>
							<tr id="brand_sal_div22">
								<th scope="row">��ǰ���� :</th>
								<td><span style="font-size: 16px; color: #555555;">Ŀ��</span></td>
							</tr>
							<tr id="brand_sal_div22">
								<th scope="row">������ :</th>
								<td>������ǰ</td>
							</tr>
							<tr id="brand_sal_div22">
								<th scope="row">������ :</th>
								<td>������ǰ(��) ��õ����</td>
							</tr>
							<tr id="brand_sal_div22">
								<th scope="row">��ǰ���� :</th>
								<td>�ϴ� ������ ����</td>
							</tr>
							<tr id="brand_sal_div22">
								<th scope="row">��ۺ� :</th>
								<td><span class="delv_price_B"><input
										id="delivery_cost_prepaid" name="delivery_cost_prepaid"
										value="P" type="hidden" />2500��</span></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div id="brand_sal_div3">
					<table id="brand_sal_div31">
						<hr width="500px">
						<th scope="row">��ǰ���� :</th>
						<td><select id="brand_sal_select">
								<option value="choice" id="sal_select" disabled selected>[�ʼ�]
									��ǰ�� ������ �ּ���</option>
								<optgroup label="----------------------------" value="**">
								</optgroup>
								<optgroup label="��ǰ����" id="sal_list">
									<c:forEach var="vo" items="${list}">
										<option value="${vo.itemName }">${vo.itemName}</option>

									</c:forEach>
								</optgroup>
						</select></td>
					</table>
					<br>


					<div id="brand_sal_div32">
						<form name=salForm action="http://localhost:8080/dongsuh/order.do"
							method="POST">
							<table border="0" summary="" id="brand_sal_table2">
								<caption id="brand_sal_div37">��ǰ ���</caption>
								<colgroup>
									<col style="width: 200px;" />
									<col style="width: 70px;" />
									<col style="width: 70px;" />
									<col style="width: 110px;" />
									<col style="width: 1px;" />
									<col style="width: 1px;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">��ǰ��</th>
										<th scope="col" colspan="2">��ǰ��</th>
										<th scope="col">�ǸŰ�</th>
									</tr>
								</thead>
								<tr id="brand_sal_div34_2">
									<td id="brand_sal_div33"></td>
									<td id="brand_sal_div34"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</form>
						<table id="brand_sal_div34_1">
							<tr>
								<td><strong>�� ��ǰ�ݾ�</strong>(����) : <input type="text"
									id="salSum" value="0" disabled>��</td>
							</tr>
						</table>
					</div>
					<form name="basketForm"
						action="http://localhost:8080/dongsuh/basket_insert.do"
						method="post">
						<table border="0" id="basketTable">
							<tr></tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</form>
					<div id="brand_sal_div35">
						<button type="button" id="brand_sal_div36">�ٷα����ϱ�</button>
						<button type="button" id="brand_sal_div38">��ٱ��ϴ��</button>
						<a href="http://localhost:8080/dongsuh/brand.do">
							<button type="button" id="brand_sal_div39">���</button>
						</a>
					</div>
				</div>
			</div>
		</div>


		<div id="brand_sal_div6">
			<hr class="hr">
			<h3>��ǰ�� �������Դϴ�.</h3>
			<a><img src="http://localhost:8080/dongsuh/images/${vo.proinfo1}"></a>
			<a><img src="http://localhost:8080/dongsuh/images/${vo.proinfo2}"></a>
			<a><img src="http://localhost:8080/dongsuh/images/${vo.proinfo3}"></a>

		</div>
		<hr class="hr">

		<div id="brand_sal_div4">
			<div id="brand_sal_div41">
				<h3>��ǰ����ı�</h3>
				<br>
			</div>
			<div id="brand_sal_div42">
				<table id="brand_sal_div44">
					<tr id="brand_sal_div43">
						<th style="width: 70px;">��ȣ</th>
						<th style="width: 640px;">��ǰ��</th>
						<th style="width: 220px;">�ۼ���</th>
						<th style="width: 150px;">�ۼ���</th>
					</tr>
				</table>
			</div>
		</div>
		<div>
			<button type="button" id="brand_sal_div46">��ǰ�򾲱�</button>
		</div>
		<div id="brand_sal_hide">
			<form name="brandSalReply"
				action="http://localhost:8080/dongsuh/brandSalReply.do?"
				method="get">
				<table id="brand_sal_table">
					<tr>
						<td style="width: 70px;">��ǰ��</td>
						<td style="width: 620px;"><input type="text"
							style="width: 600px;" id="brandSalReply_content"></td>
						<td style="width: 90px;">�ۼ���</td>
						<td style="width: 230px;"><input type="text"
							id="brandSalReply_writer" value="${sessionScope.sid}" disabled
							class="testttt"> <input type="hidden"
							id="brandSalReply_bname" value="${brandname}"></td>
						<td style="width: 70px;"><button id="brandSalReply_btn"
								type="button">���</button>
					</tr>
				</table>
			</form>
		</div>
		<hr class="hr">
		<div id="brand_sal_div5">
			<div id="brand_sal_div51">
				<h3>���, ��ȯ��ǰ, ���� ����</h3>
			</div>

			<ul id="brand_sal_div52">
				<li>
					<h4 class="fa-calculator">��ǰ��������</h4>
					<div class="TermsDesc">
						<p>
							��װ����� ��� ������ ���� ī��翡�� Ȯ����ȭ�� �帱 ���� �ֽ��ϴ�.<br> Ȯ�ΰ������� ���� ī����
							����̳� Ÿ�� ������ �ֹ��� �������� �ֹ��� �ƴ϶�� �Ǵܵ� ��� ���Ƿ� �ֹ��� ���� �Ǵ� ����� �� �ֽ��ϴ�.<br>
							������ �Ա��� ��ǰ ���� ����� PC��ŷ, ���ͳݹ�ŷ, �ڷ���ŷ Ȥ�� ����� ���࿡�� ���� �Ա��Ͻø� �˴ϴ�.
							&nbsp;<br> �ֹ��� �Է���&nbsp;�Ա��ڸ�� �����Ա����� ������ �ݵ�� ��ġ�Ͽ��� �ϸ�, 7��
							�̳��� �Ա��� �ϼž� �ϸ�&nbsp;�Աݵ��� ���� �ֹ��� �ڵ���� �˴ϴ�. <br> <br>
						</p>
					</div>
				</li>
				<li>
					<h4 class="fa-truck">�������</h4>
					<div class="TermsDesc">
						<p>
							��� ��� : �ù�<br> ��� ���� : ��������<br> ��� ��� : ����<br> ���
							�Ⱓ : 1�� ~ 3��
						</p>
						<br>
					</div>
				</li>
				<li>
					<h4 class="fa-exchange">��ȯ �� ��ǰ����</h4>
					<div class="TermsDesc">
						<p>
							<b>��ȯ �� ��ǰ�� ������ ���</b><br> - ��ǰ�� ���� ������ ���κ��� 7���̳�,&nbsp;������
							�����Ͽ��ų� ������ �ѼյǾ� ��ǰ��ġ�� ��ǵ� ��쿡�� ��ȯ/��ǰ�� �Ұ����մϴ�.<br> - ���޹����� ��ǰ
							�� �뿪�� ������ ǥ��.���� �����<br> &nbsp;&nbsp;�ٸ��ų� �ٸ��� ����� ��쿡�� ���޹���
							���κ��� 3���̳�, �׻���� �˰� �� ���κ��� 30���̳�<br> <br> <b>��ȯ ��
								��ǰ�� �Ұ����� ���</b><br> - ������ å�� �ִ� ������ ��ǰ���� ��� �Ǵ� �Ѽյ� ���. ��, ��ǰ��
							������ Ȯ���ϱ� ���Ͽ�<br> &nbsp;&nbsp;���� ���� �Ѽ��� ���� ����<br> - ������
							�����Ͽ��ų� ������ �ѼյǾ� ��ǰ��ġ�� ��ǵ� ���<br>- ������ ��� �Ǵ� �Ϻ� �Һ� ���Ͽ� ��ǰ��
							��ġ�� ������ ������ ��� ��, ȭ��ǰ���� ��� �ÿ���ǰ�� <br> &nbsp;&nbsp;������ ��쿡 ��
							�մϴ�.<br> - �ð��� ����� ���Ͽ� ���ǸŰ� ����� ������ ��ǰ���� ��ġ�� ������ ������ ���<br>
							- ������ ������ ��ǰ���� ������ �Ѽ��� ���<br> &nbsp;&nbsp;(�ڼ��� ������ ����������
							1:1 E-MAIL����� �̿��� �ֽñ� �ٶ��ϴ�.)<br> <br> �� ������ �ܼ������� ���
							��ȯ/��ǰ�� �����ۻ�ǰ, �Ϲݻ�ǰ �պ� 5,000��(����ȸ��) ����� �߻��մϴ�.
						</p>
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp; ��, CJ��������ù� 1588-1255�� �̿��� �ֽð�, Ÿ �ù��
							�̿�� Ÿ �ù�� ������������ �ݾ��� �߰��� �� �ֽ��ϴ�.<br>
						</p>
					</div>
				</li>
			</ul>
		</div>
	</div>

	</div><jsp:include page="../footer.jsp" />
</body>
</html>