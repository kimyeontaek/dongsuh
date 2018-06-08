<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="dongsuh.vo.BrandVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {

		/* 카드결제, 무통장 선택 토글 기능 */
		$("bank_order_div2").hide();
		$("input[type=radio]").click(function() {
			var id = $(this).attr("id");
			//alert(id);
			if (id == "bank") {

				$("#b").css("display", "none");
				$("#bank_order_div1").css("display", "block");
			} else if (id == "card") {
				$("#bank_order_div1").css("display", "none");
				$("#b").css("display", "block");
			}
		});

		/* 주문하기 유효성 체크 */
		$("#basket_button").click(function() {
			if ($("#adrss1").val() == "") {
				alert("주소를 입력해주세요.");
				$("#adrss1").focus();
				return false;
			} else if ($("#adrss3").val() == "") {
				alert("나머지주소를 입력해주세요.");
				$("#adrss3").focus();
				return false;
			} else if ($("#phone2").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#phone2").focus();
				return false;
			} else if ($("#phone3").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#phone3").focus();
				return false;
			} else if ($("#selectYear").val() == "select") {
				alert("배송일을 선택해주세요.");
				$("#selectYear").focus();
				return false;
			} else if ($("#selectMonth").val() == "select") {
				alert("배송일을 선택해주세요.");
				$("#selectMonth").focus();
				return false;
			} else if ($("#selectDay").val() == "select") {
				alert("배송일을 선택해주세요.");
				$("#selectDay").focus();
				return false;
			}

			if ($("#bank").is(":checked") == true) {
				if ($("#order_human").val() == "") {
					alert("입금자명을 입력해주세요.");
					$("#order_human").focus();
					return false;
				} else if ($("#Selectbank").val() == "select") {
					alert("입금은행을 선택해주세요.");
					$("#order_human").focus();
					return false;
				}
			} else if ($("#card").is(":checked") == true) {
				if ($("#order_human").val() == "") {
					alert("입금자명을 입력해주세요.");
					$("#order_human").focus();
					return false;
				}
			}
			basket2.submit();
		});

		/* 이메일 선택 시 자동 입력 기능 */
		$("#selectEmail").change(function() {

			str = $("#selectEmail").val();

			if (str != "choice" && str != "self") {
				$("#email2").val(str);
			} else if (str == "self") {
				$("#email2").val("");
				$("#email2").focus();
			} else if (str == "choice") {
				$("#email2").val("");
			}
		});

	});
</script>
</head>
<style>
#order_table3 {
	width: 1200px;
	margin: auto;
}

#order_table3 td {
	padding: 30px 0px 30px 0px;
}

#order_table3 td:nth-child(2) p {
	margin: 1px;
}

#order_table3 td:nth-child(4) p {
	margin-bottom: 1px;
}

#order_table3 {
	margin: 25px;
}

#adrss1,#adrss2 {
	margin-bottom: 10px;
}

#order_table3,#order_table3 td {
	border-collapse: collapse;
}

#order_table3 td {
	border-bottom: 1px solid black;
}

#order_table4 {
	width: 1200px;
	margin: auto;
}

#order_div1 {
	font-size: 14px;
	margin: auto;
	width: 1200px;
}

#order_div2 {
	text-align: center;
}

#order_div3 {
	border-bottom: 1px solid black;
	text-align: center;
}

#basket_button,#basket_button1 {
	background-color: rgb(208, 2, 27);
	border: none;
	color: white;
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

#basket_button:hover {
	background-color: black;
	color: white;
}

#basket_button1:hover {
	background-color: black;
	color: white;
}

#basket_button1 {
	position: relative;
	left: 920px;
}

#ad {
	width: 60px;
}

#input1 {
	width: 300px;
}

#input2 {
	width: 200px;
}

#b {
	display: none;
}

tesxarea {
	resize: none;
}

.chk_btn {
	background-color: white;
	position: relative;
	right: 570px;
	top: 10px;
}
</style>
<body>
	<jsp:include page="../header.jsp" /><div class="bdiv">
		<div id="basket_div1">
			<div id="basket_div2">
				<p id="title_p1">/</p>
				<p id="title_p2">주문하기</p>
			</div>
			<div id="basket_div3">
				<form name="basket" action="basket_check.do" method="post">
					<table id="basket_table1">
						<tr>
							<td width="50px">선택</td>
							<td width="450px">상품명</td>
							<td width="250px">&nbsp;&nbsp;&nbsp;판매가</td>
							<td width="140px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량</td>
							<td width="250px">&nbsp;&nbsp;&nbsp;합계</td>
						</tr>

						<c:forEach items="${list }" var="vo">
							<tr>
								<td><input type="checkbox" name="basketCheckbox"
									value="${vo.no }"></td>
								<td>${vo.names }</td>
								<td><input type="text" value="${vo.prices }" disabled
									class="basket_val">원</td>
								<td><input type="text" value="${vo.nums }" max="999"
									min="1" class="basket_val" disabled></td>
								<td><input type="text" disabled class="basket_val"
									value="${vo.prices*vo.nums}">원</td>
							</tr>
						</c:forEach>

					</table>
					<button type="submit" class="chk_btn">선택삭제</button>
				</form>
			</div>

			<form name="basket2" action="basket_order_list.do" method="post">
				<c:forEach items="${list }" var="vo">
					<input type="hidden" value="${vo.names }" name="hname">
					<input type="hidden" value="${vo.prices }" name="hprice">
					<input type="hidden" value="${vo.nums }" name="hnum">
				</c:forEach>
			</form>

			<div id="basket_div4">
				<table id="basket_table2">
					<tr>
						<td><b>총 상품금액</b></td>
						<td><b>+</b></td>
						<td><b>배송비</b></td>
						<td><b>=</b></td>
						<td><b>총결제금액</b></td>
					</tr>
					<tr>
						<td><input type="text" value="${sum}" disabled
							class="basket_val">원</td>
						<td></td>
						<td><input type="text" value="2500" disabled
							class="basket_val">원</td>
						<td></td>
						<td><input type="text" value="${sum+2500 }" disabled
							class="basket_val">원</td>
					</tr>
				</table>
			</div>
		</div>


		<h2 style="margin-top: 50px; padding-top: 50px;">주문자 정보 및 주문하기</h2>
		<h3>* 세일 상품의 교환은 1회만 가능하며, 환불은 불가합니다.</h3>
		</span>
		<form name="orderForm" action="order_Controller" method="post">
			<table id="order_table3"
				style="border-top: 1px solid black; margin-top: 50px;">
				<tr>
					<td style="font-weight: bold; margin: 0px 0px 0px 20px;">주문하시는분</td>
					<td style="width: 20px;"></td>
					<td><input type="text" id="adrss" disabled
						value="${sessionScope.sid}"></span></td>
				</tr>
				<tr id="adrss">
					<td style="font-weight: bold; margin: 0px 0px 0px 20px;">주소</td>
					<td style="width: 20px;"></td>
					<td><input type="text" name="" id="ad"
						class="postcodify_postcode6_1" value="" readonly /> - <input
						type="text" id="ad" class="postcodify_postcode6_2" value=""
						readonly />
						<button id="postcodify_search_button" type="button">우편번호</button>
						<br> <br> <input type="text" name=""
						class="postcodify_jibeon_address" value="" readonly
						style="width: 29%;" /> <h8 style="color:gray;">*상세주소를 직접 입력해
						주세요</h8><br> <br> <label>도로명 주소</label> <pre>
							<input type="text" name="" class="postcodify_address" id="input1"
								readonly style="width: 29%;" /> <input type="text"
								class="postcodify_details" id="input2"
								placeholder="상세주소 입력해주세요.">
						</pre>
						<p style="color: gray">*주소변경 시 지번주소와 도로명 주소의 상세주소를 함께 변경
							부탁드립니다.</p>
						<p style="color: gray">*이벤트 당첨시 경품발송을 위해 지번 또는 도로명 주소의 상세 주소까지
							필요합니다.</p></td>
				</tr>
				<tr>
					<td style="font-weight: bold; margin: 0px 0px 0px 20px;">일반전화</td>
					<td style="width: 20px;"></td>
					<td><select name="phone1" style="width: 10%; height: 28px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="019">019</option>
					</select> - <input type="text" name="phone2" id="phone2"> - <input
						type="text" name="phone3" id="phone3"></td>
				</tr>
				<tr>
					<td style="font-weight: bold; margin: 0px 0px 0px 20px;">이메일</td>
					<td style="width: 20px;"></td>
					<td><input type="text" name="email1" id="email1">@ <input
						type="text" name="email2" id="email2"> <select
						name="eaddr" id="selectEmail" style="width: 10%; height: 28px;">
							<option value="choice">선택</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">구글</option>
							<option value="self">직접입력</option>
					</select><br>
						<p style="color: gray">※메일을 통해 주문처리과정을 보내드립니다.</p>
						<p style="color: gray">※이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요</p></td>
				</tr>
				<tr>
					<td style="font-weight: bold; margin: 0px 0px 0px 20px;">배송메세지</td>
					<td style="width: 20px;"></td>
					<td><textarea cols="60" rows="5"></textarea></td>
				</tr>
				<tr>
					<td style="font-weight: bold; margin: 0px 0px 0px 20px;">희망배송일</td>
					<td style="width: 20px;"></td>
					<td><input type="checkbox" name="agree" id="agree" checked="1"
						value="T">가능한 빠른 배송 요망<br> <br> <fmt:formatDate
							value="${toDay}" pattern="yyyy년 MM월 dd일 이후 날짜를 입력해야 합니다." /><br>
						<br> <select name="year" id="selectYear" checked="1"
						value="T">
							<option value="select">선택</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
					</select>년&nbsp;&nbsp; <select name="month" id="selectMonth" checked="1"
						value="T">
							<option value="select">선택</option>
							<option value="1">&nbsp;1&nbsp;</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select>월&nbsp;&nbsp; <select name="day" id="selectDay" checked="1"
						value="T">
							<option value="select">선택</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
					</select>일</td>
				</tr>
				<tr>

				</tr>
				</div>
			</table>

			<h2 style="margin: 50px 0px 50px 0px;">결제수단</h2>
			<table id="order_table4"
				style="border-collapse: collapse; border-top: 1px solid gray;">
				<tr style="height: 150px;">
					<td><label name="pay_cash"><input type="radio"
							name="radio" id="bank" checked>무통장 입금</label></td>
					<td><label name="pay_card"><input type="radio"
							name="radio" id="card">카드 결제</label></td>
				</tr>
				<tr id="bank_name" style="height: 20px;">
					<td style="width: 15%;">입금자명</td>
					<td><input type="text" id="order_human"></td>
				</tr>
				<tr id="bank_money" style="height: 200px;">
					<td>입금은행</td>
					<td>
						<div id="bank_order_div1">
							<select name="bank" id="Selectbank">
								<option value="select">:::입금은행 선택:::</option>
								<option value="110340051076">신한은행</option>
							</select>
							<p>*당일 배송은 오후 2시 입금 혹은 카드결제건에 한하여 처리되오니 이점 양해 부탁드립니다.
							<p>*주문 후 24시간 이내에 미입금시 자동주문취소 처리되오니 이점 양해 부탁드립니다.
						</div> <span id="b">최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</span>
					</td>

				</tr>

			</table>
			<button type="button" id="basket_button">주문하기</button>
			<a href="dongsuh_index.jsp"><button type="button"
					id="basket_button1">취소하기</button></a>

		</form>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>