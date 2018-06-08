<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#chk1").click(function(){
        //클릭되었으면
        if($("#chk1").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[type=checkbox]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[type=checkbox]").prop("checked",false);
        }
    });
});
</script>
<script>
//체크박스
$(document).ready(function(){
   var frm = document.frmJoin;
   
    $('#btnCheck').click(function(){
       
       if($("input[type=checkbox]").prop("checked") == false){          
         alert("모든 이용약관에 동의하시기 바랍니다.");
         $("input[type=checkbox]").focus();
         return;
      }       
       frm.action = "http://localhost:8080/dongsuh/join.do";
       frm.submit();
    });
});
</script>
</head>
<style>
input[type=checkbox] { display:none; }
input[type=checkbox] + label{
padding : 20px 20px 20px 30px;
display : inline-block;
float : right;
cursor : pointer;
min-width : 30px;
height : 33px;
background : url('http://localhost:8080/dongsuh/images/check_off.png') right/50px no-repeat;
}
input[type=checkbox]:checked + label { background-image : url('http://localhost:8080/dongsuh/images/check_on.png'); }
#textarea{
margin : 30px 0px 40px 0px;
width : 100%;
}
#jlabel{
font-size : 25px;
}
#durtmf, #mj, #sub{
text-align : center;
font-size : 25px;
}
#durtmf{
padding-top : 50px;
color : #d0021b;
}
#sub1, #sub2{
background-color : #333; 
border-radius : 80px;
font-size : 20px;
display : inline-block;
text-align : center;
padding : 10px 30px 15px 30px;
}
#sub12{
text-align : center;
}
#sub1{
color : white;
}
#sub2{
color : gray;
}
#bdiv0{
margin : -25px 0px -25px 0px;
background-color : #f4f1e6;
}
#div1_ch{
padding : 50px 50px 30px 50px;
background-color : white;
border-radius : 25px;
margin-top : 30px;
}
#div2_ch1{
text-align : center;
padding : 40px 0px 100px 0px;
}
#btnCheck {
background-color: rgb(208,2,27); 
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
#cs_submit_button1{
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
</style>
<body>

   <jsp:include page="../header.jsp"></jsp:include>
   <div id="bdiv0">
      <div class="bdiv">
         <p id="durtmf">/</p>      
         <p id="mj"><b>회원가입</b></p>
         <div id="sub12"><h1 id="sub1">약관동의</h1> > <h1 id="sub2">정보입력</h1></div>
   <form name="frmJoin" id="frmJoin" action=""  onSubmit="return CheckForm(this)">         
      <div id="div1_ch">   
         <label style="color:gray;">이용약관, 개인정보 수집 및 이용에 대한 동의사항, 수집한 개인정보의 위탁에 모두 동의합니다.</label>
         <span><input type="checkbox" id="chk1" name="chk1"><label for="chk1"></label></span>
         <hr>   
      
         <strong><label id="jlabel">이용약관</label></strong>
         <input type="checkbox" id="chk2" name="chk2" /><label for="chk2"></label>      
               
         <textarea style="resize:none" rows="14" cols="132" readonly id="textarea">
<p>
제1조(목적 등)
① 동서식품 (www.dongsuh.co.kr) 이용자 약관(이하 "본 약관"이라 합니다)은 이용자가 동서식품㈜(이하 "동서식품"이라 합니다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 합니다)를 이용함에 있어 이용자와 동서의 권리·의무 및 책임사항을 규정함을 목적으로 합니다. 
② 이용자가 되고자 하는 자가 동서식품이 정한 소정의 절차를 거쳐서 "등록하기" 단추를 누르면 본 약관에 동의하는 것으로 간주합니다. 
본 약관에 정하는 이외의 이용자와 동서식품의 권리, 의무 및 책임사항에 관해서는 전기통신사업법 기타 대한민국의 관련 법령과 상관습에 의합니다.

제2조(이용자의 정의)
"이용자"란 동서식품 사이트에 접속하여 본 약관에 따라 동서식품 회원으로 가입하여 동서식품이 제공하는 서비스를 받는 자를 말합니다.

제3조 (회원 가입)
① 이용자가 되고자 하는 자는 동서식품이 정한 가입 양식에 따라 회원정보를 기입하고 "등록하기" 단추를 누르는 방법으로 회원 가입을 신청합니다.
② 동서식품은 제1항과 같이 회원으로 가입할 것을 신청한 자가 다음 각 호에 해당하지 않는 한 신청한 자를 회원으로 등록합니다.
1. 가입신청자가 본 약관 제6조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만 제6조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 동서식품의 회원재가입 승낙을 얻은 경우에는 예외로 합니다.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 동서식품의 기술상 현저히 지장이 있다고 판단되는 경우
③ 회원가입계약의 성립시기는 동서식품의 승낙이 가입신청자에게 도달한 시점으로 합니다.
④ 회원은 제1항의 회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다.

제4조(서비스의 제공 및 변경)
① 동서식품은 이용자에게 아래와 같은 서비스를 제공합니다.
1. 인터넷커뮤니티 카페 이용서비스
2. 칼럼 서비스
3. 회원을 위한 섹션 및 컨텐트 서비스, 맞춤 서비스
4. 기타 동서식품이 자체 개발하거나 다른 회사와의 협력계약 등을 통해 회원들에게 제공할 일체의 서비스
② 동서식품은 그 변경될 서비스의 내용 및 제공일자를 제7조 제2항에서 정한 방법으로 이용자에게 통지하고, 제1항에 정한 서비스를 변경하여 제공할 수 있습니다.

제5조(서비스의 중단)
① 동서식품은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있고, 새로운 서비스로의 교체 기타 동서식품이 적절하다고 판단하는 사유에 기하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.
② 제1항에 의한 서비스 중단의 경우에는 동서식품은 제7조 제2항에서 정한 방법으로 이용자에게 통지합니다.
다만, 동서식품이 통제할 수 없는 사유로 인한 서비스의 중단 (시스템 관리자의 고의, 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다.

제6조(이용자 탈퇴 및 자격 상실 등)
① 이용자는 동서식품에 언제든지 자신의 회원 등록을 말소해 줄 것(이용자 탈퇴)을 요청할 수 있으며 동서식품은 위 요청을 받은 즉시 해당 이용자의 회원 등록 말소를 위한 절차를 밟습니다.
② 이용자가 다음 각 호의 사유에 해당하는 경우, 동서식품은 이용자의 회원자격을 적절한 방법으로 제한 및 정지,상실시킬 수 있습니다.
1. 가입 신청 시에 허위 내용을 등록한 경우
2. 다른 사람의 동서식품 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우
3. 동서식품을 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
③ 동서식품이 이용자의 회원자격을 상실시키기로 결정한 경우에는 회원등록을 말소합니다. 이 경우 이용자인 회원에게 회원등록 말소 전에 이를 통지하고, 소명할 기회를 부여합니다.

제7조(이용자에 대한 통지)
① 동서식품이 특정 이용자에 대한 통지를 하는 경우 동서식품이 부여한 메일주소로 할 수 있습니다.
② 동서식품이 불특정다수 이용자에 대한 통지를 하는 경우 1주일이상 동서식품 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.

제8조(이용자의 개인정보보호)
동서식품은 관련법령이 정하는 바에 따라서 이용자 등록정보를 포함한 이용자의 개인정보를 보호하기 위하여 노력합니다. 이용자의 개인정보보호에 관해서는 관련법령 및 동서식품이 정하는 "개인정보보호정책"에 정한 바에의합니다.

제9조(동서식품의 의무)
① 동서식품은 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다.
② 동서식품은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를위한 보안 시스템을 구축합니다.
③ 동서식품은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
④ 동서식품은 이용자가 서비스를 이용함에 있어 동서식품의 고의 또는 중대한 과실로 인하여 입은 손해를 배상할 책임을 부담합니다.

제10조(이용자의 ID 및 비밀번호에 대한 의무)
① 동서식품이 관계법령, "개인정보보호정책"에 의해서 그 책임을 지는 경우를 제외하고, 자신의 ID와 비밀번호에관한 관리책임은 각 이용자에게 있습니다.
② 이용자는 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
③ 이용자는 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 동서식품에 통보하고 동서식품의 안내가 있는 경우에는 그에 따라야 합니다.

제11조(이용자의 의무)
① 이용자는 다음 각 호의 행위를 하여서는 안됩니다.
1. 회원가입신청 또는 변경시 허위내용을 등록하는 행위
2. 동서식품에 게시된 정보를 변경하는 행위
3. 동서식품 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위
4. 다른 회원의 ID를 도용하는 행위
5. 정크메일(junk mail), 스팸메일(spam mail), 행운의 편지(chain letters), 피라미드 조직에 가입할 것을 권유하는 메일, 외설 또는 폭력적인 메시지 ·화상·음성 등이 담긴 메일을 보내거나 기타 공서양속에 반하는 정보를 공개 또는게시하는 행위.
6. 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)의 전송 또는 게시하는 행위
7. 동서식품의 직원이나 동서식품 서비스의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 모용하여 글을 게시하거나 메일을 발송하는 행위
8. 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 전자우편으로 발송하는 행위
9. 스토킹(stalking) 등 다른 이용자를 괴롭히는 행위
10. 다른 이용자에 대한 개인정보를 그 동의 없이 수집,저장,공개하는 행위
11. 불특정 다수의 자를 대상으로 하여 광고 또는 선전을 게시하거나 스팸메일을 전송하는 등의 방법으로 동서식품의 서비스를 이용하여 영리목적의 활동을 하는 행위
12. 동서식품이 제공하는 서비스에 정한 약관 기타 서비스 이용에 관한 규정을 위반하는 행위
② 제1항에 해당하는 행위를 한 이용자가 있을 경우 동서식품은 본 약관 제6조 제2, 3항에서 정한 바에 따라 이용자의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.
③ 이용자는 그 귀책사유로 인하여 동서식품이나 다른 이용자가 입은 손해를 배상할 책임이 있습니다.

제 12조 (공개게시물의 삭제)
이용자의 공개게시물의 내용이 다음 각 호에 해당하는 경우 동서식품은 이용자에게 사전 통지 없이 해당 공개게시물을 삭제할 수 있고, 해당 이용자의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다.
1. 다른 이용자 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용
2. 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용
3. 범죄행위와 관련이 있다고 판단되는 내용
4. 다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용
5. 기타 관계 법령에 위배된다고 판단되는 내용

제13조(저작권의 귀속 및 이용제한)
① 동서식품이 작성한 저작물에 대한 저작권 기타 지적재산권은 동서식품에 귀속합니다.
② 이용자는 동서식품을 이용함으로써 얻은 정보를 동서식품의 사전승낙 없이 복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.

제14조 (약관의 개정)
① 동서식품은 약관의규제등에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
② 동서식품이 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
③ 동서식품이 본 약관을 개정할 경우에는 그 개정약관은 개정된 내용이 관계 법령에 위배되지 않는 한 개정 이전에 회원으로 가입한 이용자에게도 적용됩니다.
④ 변경된 약관에 이의가 있는 이용자는 제6조 제1항에 따라 탈퇴할 수 있습니다.

제15조(재판관할)
동서식품과 이용자간에 발생한 서비스 이용에 관한 분쟁으로 인한 소는 민사소송법상의 관할을 가지는 대한민국의 법원에 제기합니다.

부칙 본 약관은 2012. 8. 18. 부터 적용합니다.
</p>
         </textarea>         
         
         <strong><label id="jlabel">개인정보 수집 및 이용에 대한 동의사항</label></strong>      
         <input type="checkbox" id="chk3" name="chk3"><label for="chk3"></label>         
         
         <textarea style="resize:none" rows="14" cols="132" readonly id="textarea">      
<p>   
동서식품(주)'은 (이하 '회사'는)고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.
회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며,개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

ο 본 방침은 : 2013 년 04 월 12 일 부터 시행됩니다.

■ 수집하는 개인정보 항목
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
ο 수집항목 : 이름 , 생년월일 , 로그인ID , 비밀번호 , 주소 , 휴대전화번호 , 이메일 , 실명인증값 이메일 수신여부
ο 개인정보 수집방법 : 홈페이지(회원가입)

■ 개인정보의 수집 및 이용목적
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산콘텐츠 제공
ο 회원 관리회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지,가입 의사 확인 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달ο 마케팅 및 광고에 활용 신규 서비스(제품) 개발 및 특화 , 이벤트 등 광고성 정보 전달 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계

■ 개인정보의 보유 및 이용기간
회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
</p>
         </textarea>         
         
         <strong><label id="jlabel">수집한 개인정보 위탁</label></strong>
         <input type="checkbox" id="chk4" name="chk4"><label for="chk4"></label>         
         
         <textarea style="resize:none" rows="14" cols="132" readonly id="textarea">
<p>
회사는 서비스 이행 및 향상을 위해서 아래와 같이 개인정보를 외부 전문업체에 운영을 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.
회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.

- 수탁업체 : (주) 인스팟
- 위탁업무 내용 : 웹사이트 및 시스템 관리, 웹진 운영, 서비스 운영, 이벤트 운영 및 경품 배송, 고객상담 지원
- 개인정보의 보유 및 이용기간 : 회원탈퇴 시 혹은 위탁계약 종료시까지
- 수탁업체 : 케이아트만(주)
- 위탁업무 내용 : 웹진 제작,발송
- 개인정보의 보유 및 이용기간 : 회원탈퇴 시 혹은 위탁계약 종료시까지
- 수탁업체 : NICE 신용평가정보㈜
- 위탁업무 내용 : 실명확인
- 개인정보의 보유 및 이용기간 : 해당 업체에서 이미 보유하고 있는 개인정보이므로 별도로 저장하지 않음
</p>
         </textarea>
         
      </div>
            <div id="div2_ch1">
               <a href="http://localhost:8080/dongsuh/index.do"><input type="submit" id="btnCheck" value="다음단계" /></a>            
               <a href="http://localhost:8080/dongsuh/index.do"><input style="float:right" type="button" id="cs_submit_button1" value="취소" /></a>            
            </div>
            </form>
      </div>
      
   </div>
   <jsp:include page="../footer.jsp"></jsp:include>
   
</body>
</html>