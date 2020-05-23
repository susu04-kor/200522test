<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
		
		
})



</script>
</head>
<body>
	<h2>사진 수정</h2>
	<hr>
	<form action="/pic_board/update" method="post" enctype="multipart/form-data">
		작성자 <br>
		<input type="text" name="user_id"><br>
		내용 <br>
		<textarea rows="8" cols="100" name="photo_detail"></textarea><br>
		사진<br>
		<input type="file" name="uploadFile"><br>
		<button type="submit" id="btnUp">수정</button>
	</form>
</body>
</html>