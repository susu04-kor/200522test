<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사진 등록</h2>
	<hr>
	<form action="/pic_board/insert" method="post" enctype="multipart/form-data">
		작성자 <br>
		<input type="text" name="user_id"><br>
		내용 <br>
		<textarea rows="8" cols="100" name="photo_detail"></textarea><br>
		사진<br>
		<input type="file" name="uploadFile"><br>
		<input type="submit" value="등록">
		<input type="submit" value="취소">
	</form>
</body>
</html>