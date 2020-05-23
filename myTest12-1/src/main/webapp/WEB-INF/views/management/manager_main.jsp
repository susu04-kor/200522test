<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 민아) 5/19, 관리자페이지_메인 -->
<title>관리자페이지-메인</title>
<style type="text/css">
	#member{border: 1px solid gold; float: left; width: 33%; height: 500px; font-size: 30px;}
	#allBoard{border: 1px solid red; float: left; width: 33%; height: 500px; font-size: 30px;}
	#log{border: 1px solid blue; float: left; width: 33%; height: 500px; font-size: 30px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 회원관리 div를 누르면 회원관리페이지로 이동
		$("#member").click(function(){
			self.location="/management/manager_member";
		})
		
		$("#log").click(function(){
			self.location="/management/listLog";
		})
		
		//게시물관리에서 각각의 li를 누르면.... 각게시판 목록보기, 상세보기, 삭제로 이어져야함 
		
		// 공지사항
		$("#notice").click(function(){
			self.location="/customerservice/allNotice";
		})

		// 문의사항
		$("#qna").click(function(){
			self.location="/customerservice/List";
		})

		// 자유게시판
		$("#free").click(function(){
			self.location="/board/list";
		})
		
		// 함께가요
		$("#together").click(function(){
			self.location="/together/listTogether";
		})
		
		// sns게시판
		$("#sns").click(function(){
			self.location="/pic_board/list";
		})
		
	})
</script>
</head>
<body>
	
	<div id="member"><div>회원 관리</div></div>
	<div id="allBoard">게시판 관리	
		<ul>
			<li id="notice">공지사항</li>
			<li id="qna">문의사항</li>
			<li id="free">자유게시판</li>
			<li id="together">함께가요</li>
			<li id="sns">sns게시판</li>
		</ul>
	</div>
	<div id="log">Aop 로그</div>
	<br><br>

</body>
</html>