<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 민아) 5/10, 자유게시판 상세보기화면 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.25.0/moment.min.js"></script>
<script type="text/javascript">
	$(function(){
		var board_no = $("#board_no").val();

		// 수정버튼 누르면...
		$("#btnUpdate").click(function(){
			self.location = "/board/update?board_no="+board_no;
		})
		
		// 삭제버튼 누르면...
		$("#btnDelete").click(function(){
			var check = confirm("게시글을 삭제하시겠습니까?")
			if(check == true){
				self.location = "/board/delete?board_no="+board_no;
				alert("게시글을 삭제했습니다!");
			}
		});

		
		// 댓글작성버튼을 누르면!
		$("#comment").click(function(){

			var commCheck = confirm("한번 등록하면 수정할 수 없습니다. 이대로 등록하시겠습니까?");
			if(commCheck == true){
				var commSubmit = $("form[name='commentForm']");
				commSubmit.attr("action","/comment/insertComment");
				commSubmit.submit();
			}
		})
		
		// 댓글 목록
		$.ajax("/comment/listComment",{type:"GET",data:{board_no:board_no},success:function(comm){
			comm = JSON.parse(comm);
			$.each(comm, function(idx,c){						
				var tr = $("<tr></tr>");
				var td1 = $("<td></td>").html(c.comm_cont);
				var td2 = $("<td></td>").html( moment(c.comm_date).format('YYYY년 MM월 DD일 HH:mm:ss')	);
				var td3 = $("<td></td>").html(c.user_id);
				var delBtn = $("<button></button>").text("댓글삭제").attr("comm_num",c.comm_num);
				var td4 = $("<td></td>");
				td4.append(delBtn);
				tr.append(td1, td2, td3, td4);
				$("#comm_list").append(tr);

				//댓글 삭제
				$(delBtn).click(function(){
		 				//alert("버튼 누름");
						var delCheck = confirm("댓글을 삭제하시겠습니까?");
						if(delCheck == true){
							self.location = "/comment/commDeleteSubmit?comm_num="+c.comm_num;
							alert("댓글을 삭제했습니다!");
							location.reload();
						}
				})
			})
		}})


// 		// 댓글 삭제, 이 방식은 댓글 컨트롤러 따로 없이 board컨트롤러에서 상세보기 부분에 댓글목록 처리했을때 쓴 방식
// 		$("#delComment").click(function(){
// 				//[object HTMLInputElement] 오류가 떠서, 실제값을 가져옴
// 				var realComm_num = document.getElementById("comm_num").value;
// 				var delCheck = confirm("댓글을 삭제하시겠습니까?");
// 				if(delCheck == true){
// 					self.location = "/comment/commDeleteSubmit?comm_num="+realComm_num;
// 					alert("댓글을 삭제했습니다!");
// 					location.reload();
// 				}
// 			})
	});
</script>
</head>
<body>
<header></header>
	<h2>자유게시판 상세보기</h2>
	<hr>
	<a href="list">게시글 목록</a><br><br>
	<form id="f">
	<input type="hidden" id="board_no" value="${ detail.board_no }">
	<table border="1" width="70%">
		<tr>
			<td>카테고리</td>
			<td><input type="text" value="${detail.category }" name="category" readonly="readonly"></td>
		</tr>
		<tr>
			<td>글 제목</td>
			<td><input type="text" value="${detail.board_title }" name="board_title" readonly="readonly"></td>
		</tr>
		<tr>
			<td>등록일</td>	
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${detail.board_date }"/></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><input type="text" value="${detail.board_hit }" name="board_hit" readonly="readonly"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${detail.user_id }</td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><div>${detail.board_content }</div></td>
		</tr>
		
	</table>
	</form>
	<button id="btnUpdate">글 수정</button>
	<button id="btnDelete">글 삭제</button>
	<hr>
	<!-- 댓글입력 -->
	<form name="commentForm" method="post">
		<input type="hidden" id="board_no" name="board_no" value="${detail.board_no}">
		댓글 작성자 : <input type="text" name="user_id" required="required"><br>
		댓글 내용 : <textarea name="comm_cont" rows="5" cols="20"></textarea><br>
		<button type="submit" id="comment">댓글 등록</button>
	</form>
	
	<hr>
	<!-- 댓글 목록-->
	<table id="comm_list" border="1">
	</table>
	<footer></footer>
</body>
</html>