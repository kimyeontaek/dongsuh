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
		
		$("#update").click(function(){
			if($("#title").val() == ""){
				alert("������ �Է��ϼ���");
				$("#title").focus();
				return false;
			}else{
				alert("����Ǿ����ϴ�.");
			}
			admin_notice.submit;
		});
	});
	
	function delete_button(){
		if(confirm("������ �����Ͻðڽ��ϱ�?") == true){
			
		}else{
			return;
		}
	}
</script>
</head>
<body>
	<h1>�������� ����</h1>
	<hr>
		<form name="admin_notice" action="http://localhost:8080/dongsuh/admin_notice_update.do" method="POST">
			<ul>
				<li><a href="http://localhost:8080/dongsuh/admin_member_list.do">ȸ������ ����Ʈ</a></li>
				<li><a href="http://localhost:8080/dongsuh/admin_notice_list.do">�������� ����</a></li>
				<li><a href="http://localhost:8080/dongsuh/index.do">Ȩ����</a></li>
				<br>
			
				<li>
					<label>����</label>
					<input type="text" id="title" name="title">
				</li>
				<li>
					<label>����</label>
					<textarea cols="50" rows="10" name="content"></textarea>
				</li>
			</ul>
			<input type="submit" id="delete" value="�����ϱ�" onclick="delete_button();">
			<input type="submit" id="update" value="�����ϱ�">
		</form>
	
</body>
</html>