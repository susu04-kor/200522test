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
<h2>내가 작성한 sns 리스트</h2>
<hr>
<table border="1" width="80%">
	<th>글번호</th><th>작성일</th>
	<c:forEach var="sns" items="${mysns }">
		<tr>
			<td>${sns.photo_no }</td>
			<td>${sns.photo_date }</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>