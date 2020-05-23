<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 민아) 5/19, 관리자페이지_회원관리 -->
<meta charset="UTF-8">
<title>관리자페이지-회원상세</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		var user_id = $("#user_id").val();

		
		//회원 강퇴를 누르면
		$("#btnDelete").click(function(){
			var check = confirm("회원을 강퇴시키시겠습니까?")
			if(check == true){
				var check2 = confirm("돌이킬 수 없습니다. 정말 강퇴하시겠습니까?")
				if(check2 == true){
					self.location = "/management/manager_deleteMember?user_id="+user_id;
					alert("회원을 강퇴시켰습니다!");
				}
			}
		});
	})

</script>
</head>
<body>
	<h2>회원정보 상세보기</h2>
	<hr>
	<a href="/management/manager_member">회원 목록</a><br><br>
	<input type="hidden" id="user_id" value="${detail_Info.user_id }">
	<table border="1" width="70%">
		<tr>
			<td>아이디</td>
			<td><input type="text" value="${detail_Info.user_id }" name="user_id" readonly="readonly"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" value="${detail_Info.name }" name="name" readonly="readonly"></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" value="${detail_Info.nick_name }" name="nick_name" readonly="readonly"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" value="${detail_Info.tel }" name="tel" readonly="readonly"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${detail_Info.birth }"/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" value="${detail_Info.address }" name="address" readonly="readonly"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="text" value="${detail_Info.gender }" name="gender" readonly="readonly"></td>
		</tr>
		<tr>
			<td>프로필 사진</td>
			<td>굳이 봐야하나?? </td>
		</tr>
		<tr>
			<td>자기소개</td>
			<td><input type="text" value="${detail_Info.intro }" name="intro" readonly="readonly"></td>
		</tr>
		<tr>
			<td>가입일</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${detail_Info.info_create_date }"/></td>
		</tr>
		<tr>
			<td>정보수정일</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${detail_Info.info_update_date }"/></td>
		</tr>
	</table>
	<button id="btnDelete">회원 강퇴</button>
	<hr>
</body>
</html>