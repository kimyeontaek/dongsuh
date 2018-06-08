<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>    
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> FAQ  �� �� �� �� �� �� �� </title>
<link type="text/css" rel="stylesheet" href="css/reset.css" media="screen" />
<link type="text/css" rel="stylesheet" href="css/js-load.css" media="screen" />
<script src="../common/js/html5shiv.js"></script>
<script type="text/javascript" src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/js-load.js"></script>
<!-- ������ ��� ���� -->
<script>
</script>
<!-- ���� -->
<style type="text/css">




/*��Ÿ�� ������ �κ�*/
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
<!-- �������  v�ٵ���� -->

<body>
<jsp:include page="../header.jsp"></jsp:include>
 <div id="big2">
 	<div id="title_div">
		<p id="title_p1">/</p>
		<p id="title_p2">�� �� �� ��</p>
		<p><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
	</div>
<div id="big" >
 <div id="ar1">


<!--ī�װ�-->
<article id="ar2">
    <div id="c1">
     <nav >
 <table id="cc1">
    <tr >
    <td class="cc2"><a href="http://localhost:8080/dongsuh/faq.do">F A Q</a></td> 
    <td class="cc2"><a href="http://localhost:8080/dongsuh/faqgon.do">��������</a></td>
    <td class="cc2"><a href="http://localhost:8080/dongsuh/faqform.do">������</a></td>
    <td class="cc2"><a href="#">���</a></td>
    <td class="cc2"><a href="#">��Ÿ</a></td>
    </tr>
    </table>
</div>
<div id="c2">
    <select name="Search">
        <option value="����">����</option>
        <option value="����">����</option>
       
      </select>
 <input type="text" placeholder="�˻�� �Է��ϼ���"><button type="button" class="btt">�˻�</button>
</nav>
</div>
</article>



<br>
<!--������-->
<div id="ar3" >


    <div id="contents" >
       <!-- formâ -->
       
      <table id="neyong" border=1>
                        <tr>
                          <th class="tt">����</th>
                          <th>�������</th> 
                        </tr>
                        <c:forEach items="${list}" var="vo">
                        <tr>
                          <td><a href="http://localhost:8080/dongsuh/faqcon.do?no=${vo.no}">${vo.title}</a></td>
                          <td>${vo.fdate}</td>
                        </tr>
                        </c:forEach>
                        <tr>
                                <td>
                                        <%-- ������ �׺���̼�--%>
                                </td>
                                <td></td>
                        </tr>
            </table>
        
       
       <!-- formâ ���� -->
       
       </div>
      </div>
      </div>
<!-- �翷 ���̵� �׸�-->
 <aside id="as1" class="sticky">
    <table id="as11">
    <tr>
        <td>����</td>
        <td>����</td>
    </tr>
    <tr><td>1</td><td>���̵�Խ���</td></tr>
    <tr><td>2</td><td><a href="http://localhost:8080/dongsuh/faq/faqqq.jsp">���̵�Խ���</a></td></tr>
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
     <img id="bh" src="http://localhost:8080/dongsuh/images/brand_logo_bean.png" alt="�귣�� ȫ��">
     <br>
     <p>coffee? <br> maxim coffee!</p>
     </a>
      <a href="http://localhost:8080/dongsuh/brand.do"> 
     <img id="bh" src="http://localhost:8080/dongsuh/images/brand_logo_post.png" alt="�귣�� ȫ��">
     <br>
     <p>cereal? <br> post cereal!</p>
     </a>
      <a href="http://localhost:8080/dongsuh/brand.do"> 
     <img id="bh" src="http://localhost:8080/dongsuh/images/brand_logo_kanu.png" alt="�귣�� ȫ��">
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

