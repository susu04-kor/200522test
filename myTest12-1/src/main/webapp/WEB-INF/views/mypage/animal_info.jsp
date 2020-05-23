<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#animal_insert{
	display: none;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//등록 폼
	$("#form_btn").click(function(){
			$("#animal_insert").css({"display":"block"});
			$("#animail_list").css({"display":"none"});
		});

	//등록
	$("#insert_btn").click(function(){
		$("#animal_insert").css({"display":"none"});
		$("#animail_list").css({"display":"block"});
		
// 		var data = $("#insert_animal").serialize();
// 		$.ajax("/mypage/animal_info_up",{data:data,success:function(re){
// 			alert("동물등록 성공");
// 			window.location.reload(true);
// 			}});
		});

});
</script>
</head>
<body>
<h2>동물 정보</h2>
<hr>

<section id="animail_list">
<h2>동물 리스트</h2>
<hr>
	 <table>
	 <th>동물번호</th><th>반려동물 이름</th><th>반려시작일</th><th>반려일수</th><th>동물종류</th><th>동물사진</th>
		 <c:forEach items="${animal_list }" var="al">
		 	<tr>
		 		<td>${al.pet_no }</td>
		 		<td>${al.pet_name }</td>
		 		<td>${al.pet_date }</td>
		 		<td>${al.day }</td>
		 		<td>${al.pet_type }</td>
		 		<td><img alt="사진이 없습니다" src="/img/animalImg/${al.pet_pic }"></td>
		 		<td><a href="/mypage/update_animal_form?user_id=${al.user_id }&pet_no=${al.pet_no}">반려동물 정보 수정</a></td>
		 		<td><a href="/mypage/delete_animal?user_id=${al.user_id }&pet_no=${al.pet_no}">반려동물 정보 삭제</a>
		 	</tr>
		 </c:forEach>
	 </table>
	 <button id="form_btn">반려동물 추가</button>
</section>



<section id="animal_insert">
<h2>동물 추가</h2>
<hr>
	<form action="/mypage/animal_info_up" id="insert_animal" enctype="multipart/form-data" method="post">
<%-- 		<input type="text" name="user_id" value="${animal_list[0].user_id}" readonly="readonly"><br> --%>
		반려인 <input type="text" name="user_id" value="${user_id.user_id }" readonly="readonly"><br>
		동물이름 <input type="text" name="pet_name"><br>
		반려일수 <input type="date" id="pet_date" name="pet_date"><br>
		동물종류 <input type="text" name="pet_type"><br>
		사진 <input type="file" name="aa"><br>
	<button id="insert_btn">반려동물 등록</button>
	</form>
</section>
</body>
</html>