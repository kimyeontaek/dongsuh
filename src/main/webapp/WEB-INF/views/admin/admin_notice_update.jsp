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
				alert("제목을 입력하세요");
				$("#title").focus();
				return false;
			}else{
				alert("변경되었습니다.");
			}
			admin_notice.submit;
		});
	});
	
	function delete_button(){
		if(confirm("정말로 삭제하시겠습니까?") == true){
			
		}else{
			return;
		}
	}
</script>
</head>
<body>
	<h1>공지사항 수정</h1>
	<hr>
		<form name="admin_notice" action="http://localhost:8080/dongsuh/admin_notice_update.do" method="POST">
			<ul>
				<li><a href="http://localhost:8080/dongsuh/admin_member_list.do">회원정보 리스트</a></li>
				<li><a href="http://localhost:8080/dongsuh/admin_notice_list.do">공지사항 관리</a></li>
				<li><a href="http://localhost:8080/dongsuh/index.do">홈으로</a></li>
				<br>
			
				<li>
					<label>제목</label>
					<input type="text" id="title" name="title">
				</li>
				<li>
					<label>내용</label>
					<textarea cols="50" rows="10" name="content"></textarea>
				</li>
			</ul>
			<input type="submit" id="delete" value="삭제하기" onclick="delete_button();">
			<input type="submit" id="update" value="수정하기">
		</form>
	
</body>
</html>