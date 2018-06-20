<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="dongsuh.vo.BrandVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/dongsuh/css/dongsuh.css">
<script>
	/* 페이지 접속 시 상품평 목록 초기화 기능 */
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
						/* 상품평 토글 기능 */
						$("#brand_sal_hide").hide();
						$("#brand_sal_div46").click(function() {
							$("#brand_sal_hide").toggle();
						});

						// 상품 선택시 생성되는 객체의 id를 달리하기위한 변수 count
						var count = 0;

						/* 목록에서 상품이 선택되면 div32를 보여주는 기능 */
						$("#brand_sal_select")
								.change(
										function() {
											if ($("#brand_sal_select").val() != "select"
													& $("#brand_sal_select")
															.val() != "**") {
												$("#brand_sal_div32").show();
											}
										});

						/* 목록에서 상품이 선택되면 목록 테이블에 동적으로 TR 추가 /삭제 하기 */
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
											/* 바로구매하기를 위한 눈에 보이는 테이블 생성 */
											/* 상품명 추가 기능 */
											$.inputText = $(document
													.createElement("input"));
											$.inputText.attr({
												type : "text",
												class : "nameeee",
												id : "sal" + count + "name",
												value : $(this).val(),
												disabled : "disabled"
											});
											// 상품명 위치
											$(
													"#brand_sal_table2 tr:last td:nth-child(1)")
													.html("");
											$(
													"#brand_sal_table2 tr:last td:nth-child(1)")
													.append($.inputText);
											/* 상품수량 추가 기능 */
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
											// 상품수량 위치
											$(
													"#brand_sal_table2 tr:last td:nth-child(2)")
													.html("");
											$(
													"#brand_sal_table2 tr:last td:nth-child(2)")
													.append($.uad);

											/* 행을 삭제하는 버튼 추가 */
											$.btnDelete = $(document
													.createElement("input"));
											$.btnDelete.attr({
												type : "button",
												class : "btttttt",
												id : "btnnnnn" + count
											});
											// 삭제버튼 위치
											$(
													"#brand_sal_table2 tr:last td:nth-child(3)")
													.html("");
											$(
													"#brand_sal_table2 tr:last td:nth-child(3)")
													.append($.btnDelete);
											// 삭제버튼에 기능 추가
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

																// 상품이 삭제되어 총 상품금액 재계산
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

											/* 가격 x 상품수 = 판매가 추가 기능 */
											$.price = $(document
													.createElement("input"));
											$.price.attr({
												type : "text",
												class : "testttt",
												disabled : "disabled",
												id : "sal" + count + "price",
											});
											//판매가 위치
											$(
													"#brand_sal_table2 tr:last td:nth-child(4)")
													.html("");
											$(
													"#brand_sal_table2 tr:last td:nth-child(4)")
													.append($.price);
											//판매가 계산 기능 (DB에서 상품명과 일치하는 낱개 가격을 비교함)
											<c:forEach var="vo" items="${list}">
											if ($(this).val() == "${vo.itemName }") {
												$("#sal" + count + "price")
														.val("${vo.itemPrice}");
											}
											</c:forEach>

											// 상품명을 hidden 타입으로 저장하는 기능
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

											// 낱개 가격을 hidden 타입으로 저장하는 기능
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
											/* 바로구매하기를 위한 테이블 생성 종료 */

											/* 장바구니담기를 위한 테이블 생성 (hidden 타입) */
											// 상품명
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

											// 상품수량
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

											// 상품 낱개가격
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
											/* 장바구니담기를 위한 테이블생성 종료 */

											// 상품 선택시 총 상품금액 계산 기능
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

											/* 상품 수량변경 시 일어나는 기능 */
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
																// 판매가 = 상품수 x 상품낱개 가격
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
																// 수량이 변경되었을때 전체 상품에대한 총 상품금액 계산 기능
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

						/* 바로구매하기 유효성 체크 */
						$("#brand_sal_div36").click(function() {
							if ($("#salSum").val() == 0) {
								alert("상품을 선택해 주세요.");
								return false;
							}
							salForm.submit();
						});

						/* 장바구니담기 유효성 체크 */
						$("#brand_sal_div38").click(function() {
							if ($("#salSum").val() == 0) {
								alert("상품을 선택해 주세요.");
								return false;
							}
							basketForm.submit();
						});

						/* 상품평 등록 기능 */
						$("#brandSalReply_btn")
								.click(
										function() {
											if ($("#brandSalReply_content")
													.val() == "") {
												alert("상품평을 입력해주세요.");
												$("#brandSalReply_content")
														.focus();
												return false;
											} else if ($(
													"#brandSalReply_writer")
													.val() == "") {
												alert("로그인이 필요한 서비스입니다.");
												$("#brandSalReply_writer")
														.focus();
												return false;
											}
											/* 상품평 등록 시작 */
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
																alert("댓글 등록 완료");
																// 상품평을 등록하면 상품평 목록을 갱신하는 기능 호출
																reply_view_load();
															}
														}
													});
											/* 상품평 등록 종료 */
										});

						/* 사용자 정의 함수 */
						/* 상품평 목록을 갱시하는 기능 */
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
													+ "<th style='width:70px;'>번호</th>"
													+ "<th style='width:640px;'>상품평</th>"
													+ "<th style='width:220px;'>작성자</th>"
													+ "<th style='width:150px;'>작성일</th>"
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
			<p id="title_p2">브랜드</p>
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
								<th scope="row">식품유형 :</th>
								<td><span style="font-size: 16px; color: #555555;">커피</span></td>
							</tr>
							<tr id="brand_sal_div22">
								<th scope="row">제조사 :</th>
								<td>동서식품</td>
							</tr>
							<tr id="brand_sal_div22">
								<th scope="row">제조원 :</th>
								<td>동서식품(주) 인천공장</td>
							</tr>
							<tr id="brand_sal_div22">
								<th scope="row">상품설명 :</th>
								<td>하단 상세정보 참고</td>
							</tr>
							<tr id="brand_sal_div22">
								<th scope="row">배송비 :</th>
								<td><span class="delv_price_B"><input
										id="delivery_cost_prepaid" name="delivery_cost_prepaid"
										value="P" type="hidden" />2500원</span></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div id="brand_sal_div3">
					<table id="brand_sal_div31">
						<hr width="500px">
						<th scope="row">상품선택 :</th>
						<td><select id="brand_sal_select">
								<option value="choice" id="sal_select" disabled selected>[필수]
									상품을 선택해 주세요</option>
								<optgroup label="----------------------------" value="**">
								</optgroup>
								<optgroup label="상품선택" id="sal_list">
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
								<caption id="brand_sal_div37">상품 목록</caption>
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
										<th scope="col">상품명</th>
										<th scope="col" colspan="2">상품수</th>
										<th scope="col">판매가</th>
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
								<td><strong>총 상품금액</strong>(수량) : <input type="text"
									id="salSum" value="0" disabled>원</td>
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
						<button type="button" id="brand_sal_div36">바로구매하기</button>
						<button type="button" id="brand_sal_div38">장바구니담기</button>
						<a href="http://localhost:8080/dongsuh/brand.do">
							<button type="button" id="brand_sal_div39">취소</button>
						</a>
					</div>
				</div>
			</div>
		</div>


		<div id="brand_sal_div6">
			<hr class="hr">
			<h3>상품의 상세정보입니다.</h3>
			<a><img src="http://localhost:8080/dongsuh/images/${vo.proinfo1}"></a>
			<a><img src="http://localhost:8080/dongsuh/images/${vo.proinfo2}"></a>
			<a><img src="http://localhost:8080/dongsuh/images/${vo.proinfo3}"></a>

		</div>
		<hr class="hr">

		<div id="brand_sal_div4">
			<div id="brand_sal_div41">
				<h3>상품사용후기</h3>
				<br>
			</div>
			<div id="brand_sal_div42">
				<table id="brand_sal_div44">
					<tr id="brand_sal_div43">
						<th style="width: 70px;">번호</th>
						<th style="width: 640px;">상품평</th>
						<th style="width: 220px;">작성자</th>
						<th style="width: 150px;">작성일</th>
					</tr>
				</table>
			</div>
		</div>
		<div>
			<button type="button" id="brand_sal_div46">상품평쓰기</button>
		</div>
		<div id="brand_sal_hide">
			<form name="brandSalReply"
				action="http://localhost:8080/dongsuh/brandSalReply.do?"
				method="get">
				<table id="brand_sal_table">
					<tr>
						<td style="width: 70px;">상품평</td>
						<td style="width: 620px;"><input type="text"
							style="width: 600px;" id="brandSalReply_content"></td>
						<td style="width: 90px;">작성자</td>
						<td style="width: 230px;"><input type="text"
							id="brandSalReply_writer" value="${sessionScope.sid}" disabled
							class="testttt"> <input type="hidden"
							id="brandSalReply_bname" value="${brandname}"></td>
						<td style="width: 70px;"><button id="brandSalReply_btn"
								type="button">등록</button>
					</tr>
				</table>
			</form>
		</div>
		<hr class="hr">
		<div id="brand_sal_div5">
			<div id="brand_sal_div51">
				<h3>배송, 교환반품, 문의 정보</h3>
			</div>

			<ul id="brand_sal_div52">
				<li>
					<h4 class="fa-calculator">상품결제정보</h4>
					<div class="TermsDesc">
						<p>
							고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.<br> 확인과정에서 도난 카드의
							사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.<br>
							무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.
							&nbsp;<br> 주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일
							이내로 입금을 하셔야 하며&nbsp;입금되지 않은 주문은 자동취소 됩니다. <br> <br>
						</p>
					</div>
				</li>
				<li>
					<h4 class="fa-truck">배송정보</h4>
					<div class="TermsDesc">
						<p>
							배송 방법 : 택배<br> 배송 지역 : 전국지역<br> 배송 비용 : 무료<br> 배송
							기간 : 1일 ~ 3일
						</p>
						<br>
					</div>
				</li>
				<li>
					<h4 class="fa-exchange">교환 및 반품정보</h4>
					<div class="TermsDesc">
						<p>
							<b>교환 및 반품이 가능한 경우</b><br> - 상품을 공급 받으신 날로부터 7일이내,&nbsp;포장을
							개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<br> - 공급받으신 상품
							및 용역의 내용이 표시.광고 내용과<br> &nbsp;&nbsp;다르거나 다르게 이행된 경우에는 공급받은
							날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내<br> <br> <b>교환 및
								반품이 불가능한 경우</b><br> - 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의
							내용을 확인하기 위하여<br> &nbsp;&nbsp;포장 등을 훼손한 경우는 제외<br> - 포장을
							개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<br>- 고객님의 사용 또는 일부 소비에 의하여 상품의
							가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을 <br> &nbsp;&nbsp;제공한 경우에 한
							합니다.<br> - 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
							- 복제가 가능한 상품등의 포장을 훼손한 경우<br> &nbsp;&nbsp;(자세한 내용은 고객만족센터
							1:1 E-MAIL상담을 이용해 주시기 바랍니다.)<br> <br> ※ 고객님의 단순변심의 경우
							교환/반품은 무료배송상품, 일반상품 왕복 5,000원(착불회송) 비용이 발생합니다.
						</p>
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp; 꼭, CJ대한통운택배 1588-1255을 이용해 주시고, 타 택배사
							이용시 타 택배사 요율적용으로 금액이 추가될 수 있습니다.<br>
						</p>
					</div>
				</li>
			</ul>
		</div>
	</div>

	</div><jsp:include page="../footer.jsp" />
</body>
</html>