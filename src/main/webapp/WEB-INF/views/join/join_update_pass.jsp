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
		
		$("#pass_success").click(function(){
			
			if($("#pass").val() == ""){
				alert("�� ��й�ȣ�� �Է��ϼ���.");
				$("#new_pass").focus();
				return false;
			}else if($("#pass_s").val() == ""){
				alert("�� ��й�ȣ Ȯ���� �Է��ϼ���.");
				$("#pass_s").focus();
				return false;
			}else{
				alert("��й�ȣ�� ����Ǿ����ϴ�.");
			}
				join_update_pass_n.submit();
			
		});	
	
	
	//�� ��й�ȣ & �� ��й�ȣ Ȯ�� üũ
	$("#pass_s").focusout(function(){
		
		if($("#pass").val() == ""){
            
		}else{
			if($("#pass_s").val() != ""){
				if($("#pass").val() == $("#pass_s").val()){
					$("#msg").css("display","block").css("font-size", "9pt")
	                .css("color","blue").css("padding","3px 0px 0px 120px");
					$("#msg").text("��й�ȣ�� �����մϴ�.");
					return false;
				}else{
					$("#msg").css("display","block").css("font-size", "9pt")
	                .css("color","blue").css("padding","3px 0px 0px 120px");
					$("#msg").text("��й�ȣ�� �ٸ��ϴ�.");
					return false;
				};			
			};
		};
	});   // �� ��� üũ
});
</script>
</head>   
<style>
#bdiv0{
border : 1px solid #EEEEEE;
margin : -25px 0px -25px 0px;
background-color : #f4f1e6;
}
#pdiv1{
block : inline-block;
margin : 50px 300px 100px 300px;
background-color : white;
border : 1px solid #dadada;
}
#pdiv2{
block : inline-block;
padding : 100px 0px 100px 100px;
}
#pdiv2 div.pass_header p.context{
font-size : 14px;
}
#pdiv2 div.pass_header p.context_list{
font-size : 12px;
}
input[type=text]{
width : 60%;
height : 40px;
}
.pass_header .context_list em{
font-color : #ff6020;
}
address, em{
font-style : normal;
}
#dlatl{
padding-top:100px;
}
</style>
<body>

   <jsp:include page="../header.jsp"></jsp:include>
   
	<div id="bdiv0">
		<div class="bdiv">
			<div id="pdiv1">          
				<div id="pdiv2">
			<form name="join_update_pass" action="http://localhost:8080/dongsuh/join_update_pass_n.do" method="POST">
			
				<div class="pass_header">
					<p class="context">��й�ȣ ����</p>
					<p class="context_list"><em>�ٸ� ���̵�/����Ʈ���� ����� �� ���� ��й�ȣ</em></p>
					<p class="context_list"><em>������ ����� �� ����</em> ��й�ȣ�� �����մϴ�.</p>
				</div>
				
				<br>
				<div>
	                 <input type="password" id="new_pass" name="pass" placeholder="�� ��й�ȣ">
				</div>
				<div>
	                 <input type="password" id="new_pass_s" name="pass_s" placeholder="�� ��й�ȣ Ȯ��">
	            </div>
	            <br>	            
	            	<input type="submit" id="pass_success" name="pass_success" value="Ȯ��" />
	            	<input type="reset" value="���" />	     
	            	       	
           	</form>
				</div>	  
			</div>
	   </div>
	</div>      
         
      <jsp:include page="../footer.jsp"></jsp:include>
      
</body>
</html>