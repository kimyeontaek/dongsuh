<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>    
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> FAQ  자 주 묻 는 게 시 판 </title>
<link type="text/css" rel="stylesheet" href="css/reset.css" media="screen" />
<link type="text/css" rel="stylesheet" href="css/js-load.css" media="screen" />
<script src="../common/js/html5shiv.js"></script>
<script type="text/javascript" src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/js-load.js"></script>
<!-- 더보기 기능 구현 -->
<script>
</script>
<!-- 종료 -->
<style type="text/css">




/*스타일 디자인 부분*/
h1{font-size: 160px}
table,tr,td{border-collapse: collapse;
}
#big{ margin: auto;
width: 1500px;

}
#big2{ margin: auto;
width: 1500px;
}
#ar1{
display: inline-block; margin:100px;
width: 800px; text-align: center;
}
#cc1{width: 350px; margin: 0px;padding: 0px} 
.cc2{}
table.a1 tr:nth-child(even) {
    background-color: #fff;
}
table.a1 tr:nth-child(odd) {
   background-color: #eee;
}

.tt{ width: 600px;}
#c1{ float: left}
#c2{float: right}

#as1{
top: 100px;  float: left;padding-top: 80px;width: 300px;
inline-size: 220px;text-align: center;
padding-right: 80px;
}
#as2{
padding-top: 100px;width: 250px;
float: right;text-align: center;}
#bh{width:240px;}
.btt{
height: 30px;
	width: 82px;
	font-size: 12pt;
	color: white;
	border-style: none;
	text-weight: bold;
	background-color: rgb(208, 2, 27);
	transition-duration: 0.3s;
	text-decoration: none;
	cursor: pointer;
	border-radius: 25px;
}
.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  padding: 5px; 
}
#neyong{
block : inline-block;
width : 100%;
    border: 1px solid #ddd;
    border-bottom-style: solid gray;
    background-color: #fff;
  }
  
  
  
  
  
  
  
  
  .jb-th-1, .jb-td-1 {
    width: 800px;
  }
  
  
  
</style>
</head>
<!-- 상단종료  v바디시작 -->

<body>
<jsp:include page="../header.jsp"></jsp:include>
 <div id="big2">
 	<div id="title_div">
		<p id="title_p1">/</p>
		<p id="title_p2">공 지 사 항</p>
		<p><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
	</div>
<div id="big" >
 <div id="ar1">


<!--카테고리-->
<article id="ar2">
    <div id="c1">
     <nav >
 <table id="cc1">
    <tr >
    <td class="cc2"><a href="http://localhost:8080/dongsuh/faq.do">F A Q</a></td> 
    <td class="cc2"><a href="http://localhost:8080/dongsuh/faqgon.do">공지사항</a></td>
    <td class="cc2"><a href="http://localhost:8080/dongsuh/faqform.do">관리자</a></td>
    <td class="cc2"><a href="#">등등</a></td>
    <td class="cc2"><a href="#">기타</a></td>
    </tr>
    </table>
</div>
<div id="c2">
    <select name="Search">
        <option value="제목">제목</option>
        <option value="내용">내용</option>
       
      </select>
 <input type="text" placeholder="검색어를 입력하세요"><button type="button" class="btt">검색</button>
</nav>
</div>
</article>



<br>
<!--본내용-->
<div id="ar3" >


    <div id="contents" >
       <!-- form창 -->
       
      <table id="neyong" border=1>
                        <tr>
                          <th class="tt">제목</th>
                          <th>등록일자</th> 
                        </tr>
                        <c:forEach items="${list}" var="vo">
                        <tr>
                          <td><a href="http://localhost:8080/dongsuh/faqcon.do?no=${vo.no}">${vo.title}</a></td>
                          <td>${vo.fdate}</td>
                        </tr>
                        </c:forEach>
                        <tr>
                                <td>
                                        <%-- 페이지 네비게이션--%>
                                </td>
                                <td></td>
                        </tr>
            </table>
        
       
       <!-- form창 종료 -->
       
       </div>
      </div>
      </div>
<!-- 양옆 사이드 항목-->
 <aside id="as1" class="sticky">
    <table id="as11">
    <tr>
        <td>순위</td>
        <td>제목</td>
    </tr>
    <tr><td>1</td><td>사이드게시판</td></tr>
    <tr><td>2</td><td><a href="http://localhost:8080/dongsuh/faq/faqqq.jsp">사이드게시판</a></td></tr>
    <tr><td>3</td><td></td></tr>
    <tr><td>4</td><td></td></tr>
    </table>
    <table> 
        <tr><a href="#">T O P</a></tr><br>
        <tr><a href="#gotobottom">Down</a></tr>
    </table>
     </aside>
  <banner id="as2" class="sticky">
     <a href="http://localhost:8080/dongsuh/brand.do"> 
     <img id="bh" src="http://localhost:8080/dongsuh/images/brand_logo_bean.png" alt="브랜드 홍보">
     <br>
     <p>coffee? <br> maxim coffee!</p>
     </a>
      <a href="http://localhost:8080/dongsuh/brand.do"> 
     <img id="bh" src="http://localhost:8080/dongsuh/images/brand_logo_post.png" alt="브랜드 홍보">
     <br>
     <p>cereal? <br> post cereal!</p>
     </a>
      <a href="http://localhost:8080/dongsuh/brand.do"> 
     <img id="bh" src="http://localhost:8080/dongsuh/images/brand_logo_kanu.png" alt="브랜드 홍보">
     <br>
     <p>maxim? <br> post kanu!</p>
     </a>
     
    </banner>


</div>
</div>
<div id='gotobottom' />
</body>
 <br>
<jsp:include page="../footer.jsp"></jsp:include>
</html>

