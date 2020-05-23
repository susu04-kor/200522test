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
<h2>나의 결제 내역</h2>
<hr>
<h2>${search_pay[0].user_id }님의 결제내역입니다</h2>  
	<table border="1">
	<tr>
		<th>고유결제번호</th><th>상점거래id</th><th>결제금액</th><th>결제수단</th><th>카드승인번호</th><th>결제승인시각</th><th>결제상태</th><th>예약번호</th><th>아이디</th>
	</tr>
	<c:forEach items="${search_pay }" var="search_pay">
		<tr>
			<td>${search_pay.imp_uid }</td>
			<td>${search_pay.merchant_uid }</td>
			<td>${search_pay.paid_amount }</td>
			<td>${search_pay.pay_method }</td>
			<td>${search_pay.apply_num }</td>
			<td>${search_pay.paid_time }</td>
			<td>${search_pay.status }</td>
			<td>${search_pay.rsv_no }</td>
			<td>${search_pay.user_id }</td>
		</tr>	
	</c:forEach>
	</table>
</body>
</html>