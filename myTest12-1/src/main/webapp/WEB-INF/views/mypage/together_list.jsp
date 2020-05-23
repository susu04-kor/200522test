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
<h2>내가 신청한 함께가요 리스트</h2>
<hr>
<table border="1" width="80%">
	<th>글번호</th><th>제목</th><th>신청인원</th><th>조회수</th><th>작성일</th>
	<c:forEach var="to" items="${mytogether }">
		<tr>
			<td>${to.t_num }</td>
			<td><a href="/together/detailTogether?t_num=${to.t_num}">${to.t_title }</a></td>
			<td>${to.t_attendee_cnt }</td>
			<td>${to.t_hit }</td>
			<td>${to.t_date }</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>