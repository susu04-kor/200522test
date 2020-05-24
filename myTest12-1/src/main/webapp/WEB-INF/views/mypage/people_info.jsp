<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#u_p_form{
	display: none;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){



	//비밀번호 변경창
	$("#update_pwd").click(function(){
		$("#u_p_form").css({"display":"block"});
		$("#o_from").css({"display":"none"});



		//비밀번호 변경 버튼
		$("#up_btn").click(function(){
			$("#u_p_form").css({"display":"none"});
			var data = $("#update_pwd_form").serialize();
			$.ajax("/mypage/update_pwd",{data:data,success:function(re){
				alert("비밀번호가 변경됐습니다");
				$("#u_p_form").css({"display":"none"});
				$("#o_from").css({"display":"block"});
				}});
			});
		});
	
		
	/*	
	//비밀번호 변경창
	$("#update_pwd").click(function(){
		$("#u_p_form").css({"display":"block"});
		$("#o_from").css({"display":"none"});

		

		//비밀번호 변경 버튼
		$("#up_btn").click(function(){
			$.ajax({
				url: "/join/passCheck",
				type: "POST",
				dataType: "json",
				data: $("#u_p_form").serializeArray(),
				success: function(data) {
					if(data==true){
						if(confirm("비밀번호를 변경하시겠습니까?")){
								$("#u_p_form").css({"display":"none"});
								var data = $("#update_pwd_form").serialize();
								$.ajax("/mypage/update_pwd",{data:data,success:function(re){
									alert("비밀번호가 변경됐습니다");
									$("#u_p_form").css({"display":"none"});
									$("#o_from").css({"display":"block"});
									}});
								})
							}
						}else{
							alert("비밀번호가 틀렸습니다.");
							return; //false - 내일 실험해보자 false - 이거 기반으로 회원가입도 가입버튼 수정해보자;
							}
					}	
			})
*/
			
});



$(document).ready(function(){
		$("#submit").on("click", function(){
			$.ajax({
				url: "/join/passCheck",
				type: "POST",
				dataType: "json",
				data: $("#updateForm").serializeArray(),
				success: function(data) {
					if(data==true){
						if(confirm("회원 수정하시겠습니까?")){
							$("#updateForm").submit();
							}
						}else{
							alert("비밀번호가 틀렸습니다.");
							return /*false - 내일 실험해보자 false - 이거 기반으로 회원가입도 가입버튼 수정해보자*/;
							}
					}	
			})
		})
})



</script>
</head>
<body>
<h2>사람 정보 수정</h2>
<hr>
<section id="o_from">
	<form id="updateForm" action="/mypage/people_info_up" method="post" enctype="multipart/form-data">
	<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		아이디 <input type="text" value="${m.user_id }" readonly="readonly" name="user_id"><br>
		닉네임 <input type="text" value="${m.nick_name }" name="nick_name"><br>
		비밀번호를 입력하셔야 정보를 수정할 수 있습니다<br>
		비밀번호 <input type="text" name="pwd" required="required"><br>
		
		<button id="update_pwd">비밀번호 변경</button><br>
		
		전화번호 <input type="text" value="${m.tel }" name="tel"><br>
		<%-- 생일 <input type="text" value="${m.birth }" name="birth"><br> --%>
		이름 <input type="text" value="${m.name }" name="name"><br>
		주소 <input type="text" value="${m.address }" name="address"><br>
		성별 <input type="text" value="${m.gender }" name="gender"><br>
		사진 <img alt="사진이 없습니다" src="/img/peopleImg/${m.fname }"><br>
		<a href="/mypage/delete_people_pic?user_id=${m.user_id }">사진 삭제</a><br>
		<input type="hidden" value="${m.fname }" name="fname"> <br>
		<input type="file" name="aa"><br>
		소개 <input type="text" value="${m.intro }" name="intro"><br>
		가입일 <input type="text" value="${m.info_create_date }" readonly="readonly"><br>
	</form>
		<button id="submit" type="button">수정</button>
</section>
<section id="u_p_form">
	<form id="update_pwd_form" method="post">
	<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="o_user_id" value="${m.user_id }"><br>
		기존 비밀번호 <input type="text" name="o_pwd"><br>
		변경할 비밀번호 <input type="text" name="pwd2"><br>
	</form>
	<button id="up_btn">비밀번호 변경하기</button>
</section>
</body>
</html>