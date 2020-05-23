<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>내가 작성한 글 목록</h2>
<hr>
<table border="1" width="80%">
	<th>글번호</th><th>제목</th><th>조회수</th><th>작성일</th>
	<c:forEach var="b" items="${myboard }">
		<tr>
			<td>${b.board_no }</td>
			<td><a href="/board/get?board_no=${b.board_no}">${b.board_title }</a></td>
			<td>${b.board_hit }</td>
			<td>${b.board_date }</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>