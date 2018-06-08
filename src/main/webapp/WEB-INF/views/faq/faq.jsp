<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
<head>
<meta name="viewport" content="width=device-width, maximum-scale=1, minimum-scale=1, user-scalable=no" />
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> FAQ  �� �� �� �� �� �� �� </title>
<link type="text/css" rel="stylesheet" href="css/reset.css" media="screen" />
<link type="text/css" rel="stylesheet" href="css/js-load.css" media="screen" />
<script src="../common/js/html5shiv.js"></script>
<script type="text/javascript" src="http://localhost:8080/dongsuh/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/js-load.js"></script>
<!-- ������ ��� ���� -->
<script>

$(window).on('load', function () {
    load('#js-load', '4');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '5', '#js-btn-wrap');
    });
});

</script>
<script>
$(document).ready(function(){
	$("#keyword").keyup(function(){
		var k = $(this).val();
		 $("#contents  li, #thebutton").hide();
	        //alert("����");
	        var temp = $("#contents li:contains('"+k+"')");
	        //alert("k");
	        $(temp).show();
	})
})
</script>
<script>

function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $(button).hide();
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}

    
    </script>
<!-- ���� -->
<style type="text/css">
/*��Ÿ�� ��ɺκ�*/
 .js-load {
        display: none;
    }
    .js-load.active {
        display: block;
    }
      
    .is_comp.js-load:after {
        display: none;
    }
        
    .btn-wrap, .lists, .main {
        display: block;
    }
   
       

/*��Ÿ�� ������ �κ�*/



 .main {
        max-width: 640px;
        margin: 0px;
        padding:0px;
        margin-right:-200px;
    }


 #ar3 {border-top-style: solid gray;
    border-bottom-style: solid gray;
 }

#big2 ul { list-style: none;
           padding:0px;
          margin-right:-159px;
          margin-bottom:5%;
          }


 .btn-wrap {height: 40px;
        text-align: center;
        width:100%;
          padding-left:172px;
          margin-right:-200px;     
    }

.lists { border-top-style: solid;
    border-bottom-style: solid;
        margin-bottom: 1rem;
       }
 .lists__item {
        padding: 40px;
       background-color: #fff;
   }

 .lists__item:nth-child(2n) {
        background-color: #eee;
        
    }



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

#ar2{
 
}
#c1{ float: left}
#c2{float: right}

#ar3{text-align: center;width: 100%;}


#a_table{width: 100%;
    border-color: gray;
    border-top-style: solid;
    border-bottom-style: solid;
    border-width: 4px;
    border-spacing: 0;
    table-layout: fixed;}
#a_table tr{height: 80px;}

.a1{width: 100%;
    border-color: gray;
    border-top-style: solid;
    border-bottom-style: solid;
    border-width: 4px;
    border-spacing: 0;
    table-layout: fixed;}
    th, td {
    border-bottom: 1px solid #ddd;
}
.a1 tr {height: 80px;}

.a11{width: 100%;
    border-color: gray;
    border-bottom-style: none;
    border-width: 8px;
    border-spacing: 0;
    table-layout: fixed;}

#as1{
top: 100px;  float: left;padding-top: 80px;width: 300px;
inline-size: 220px;text-align: center;
padding-right: 80px; }

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
#contents{
width: 100%;
}
#thebutton{width:200px}
</style>
</head>
<!-- �������  v�ٵ���� -->

<body>
<jsp:include page="../header.jsp"></jsp:include>
 <div id="big2">
 	<div id="title_div">
		<p id="title_p1">/</p>
		<p id="title_p2">F A Q</p>
		<p><img src="http://localhost:8080/dongsuh/cs_image/bg_tit_wave.png"></p>
	</div>
<div id="big">
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
 <input type="text" placeholder="�˻�� �Է��ϼ���" id="keyword"><button type="button" class="btt">�˻�</button>
</nav>
</div>
</article>



<br>
<!--������-->
<div id="ar3">


    <div id="contents">
        <div id="js-load" class="main">
          <ul class="lists">
       
          <li class="lists__item js-load">�� ��</li>
            <li class="lists__item js-load"><details>
        <summary>ȸ�� ������ �Ϸ��� ��� �ؾ��ϳ���? </summary>
        <p> ����� �޴��ٸ� ���ø�</p>
        <p> �����ʿ� ��ġ�� ȸ�������� �̿��Ͻñ� �ٶ��ϴ�</p>
      </details></li>
      
            <li class="lists__item js-load"><details>
        <summary>�α����� �Ϸ��� ��� �ؾ��ϳ���? </summary>
       <p> ����� �޴��ٸ� ���ø�</p>
        <p> �����ʿ� ��ġ�� �α����� �̿��Ͻñ� �ٶ��ϴ�</p>
      </details></li>
            <li class="lists__item js-load"><details>
        <summary>���� �������� �Ϸ��� ��� �ؾ��ϳ���? </summary>
         <p> ����� �޴��ٸ� ���ø�</p>
        <p> �����ʿ� ��ġ�� ���� �������� �̿��Ͻñ� �ٶ��ϴ�</p>
      </details></li>
            <li class="lists__item js-load"><details>
        <summary>5��° �������� �Դϴ� </summary>
        <p> �������Դϴ�</p>
        <p> �������Դϴ�</p>
      </details></li>
            <li class="lists__item js-load"><details>
        <summary>5��° �������� �Դϴ� </summary>
        <p> �������Դϴ�</p>
        <p> �������Դϴ�</p>
      </details></li>
            <li class="lists__item js-load">test4</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test5</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test6</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test7</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test8</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test9</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test10</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test11</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test12</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test13</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test14</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test15</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test16</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test17</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test18</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test19</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test20</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test21</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test22</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test23</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test24</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
            <li class="lists__item js-load">test25</li>
            <li class="lists__item js-load">txttxttxttxttxttxt</li>
          </ul>
          <div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button" id="thebutton">������</a> </div>
        
      
        
        </div>
       </div>
      </div>
      </div>
<!-- �翷 ���̵� �׸�-->
 <aside id="as1" class="sticky">
   
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


