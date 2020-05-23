<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.25.0/moment.min.js"></script>
<script type="text/javascript">
	$(function(){

		// 민아) 5/17, 좋아요기능 추가, user_id 는 임의로 멤버인포에 추가한 user1으로 해둠 
		var photo_no = $("#photo_no").val();
		var user_id = "user1";
		$("#clickLike").hide();
		
		//이 사진에 좋아요를 눌렀는지 체크 
		var okLike = function(user_id, photo_no){
			$.ajax("/pic_board/okLike",{data: {user_id:user_id, photo_no:photo_no}, success:function(re){
				if( re == 1 ){				//좋아요를 눌렀다면
					$("#clickLike").show();	//좋아요 눌러서 바뀐 사진을 보여주고
					$("#like").hide();		//안눌린상태의 좋아요사진은 숨겨줘 
				}
			}})
		}

		okLike(user_id, photo_no);

		// 좋아요 insert
		$(document).on("click","#like",function(){	// 좋아요를 클릭했을때
			$.ajax("/pic_board/insertLike",{data: {user_id:user_id, photo_no:photo_no}, success:function(re){
				if(re == 1){
					$("#clickLike").show();		//좋아요 눌러서 바뀐 사진을 보여주고
					$("#like").hide();			//안눌린상태의 좋아요사진은 숨겨줘 
					$("#cntLike").html(eval($("#cntLike").html())+1);	// 좋아요 수가 보이는 창의 데이터에 + 1 해줘
				}
			}})
				
		})
		
		// 좋아요 delete 좋아요를 한번 더 누르면 취소 
		$(document).on("click","#clickLike",function(){
			$.ajax("/pic_board/deleteLike",{data: {user_id:user_id, photo_no:photo_no},success: function(re){
				if( re == 1 ){
					$("#clickLike").hide();		//좋아요 눌러서 바뀐 사진을 숨기고
					$("#like").show();			//안눌린상태의 좋아요사진을 보여줘
					$("#cntLike").html(eval($("#cntLike").html())-1);	// 좋아요 수가 보이는 창의 데이터에 - 1 해줘
				}
			}})
		})
		
		
		// 여기까지 좋아요 처리 완료 

		//수정
		$("#btnUpdate").click(function(){
				self.location ="/pic_board/update?photo_no=${file.photo_no}";	
				});
			
			//삭제	
		$("#btnDelete").click(function(){
			var check = confirm("게시글을 삭제하시겠습니까?")
			if(check == true){
				self.location = "/pic_board/delete?photo_no=${file.photo_no}";
				alert("게시글이 삭제되었습니다.")
				}
			});
			
			// 댓글작성버튼을 누르면!
			$("#comment").click(function(){
				var commCheck = confirm("한번 등록하면 수정할 수 없습니다. 이대로 등록하시겠습니까?");
				if(commCheck == true){
					var pcommSubmit = $("form[name='commentForm']");
					pcommSubmit.attr("action","/pcomment/PinsertComment");
					pcommSubmit.submit();
				}
			});	
					
			//댓글 목록
			$.ajax("/pcomment/listComment",{type:"GET",data:{photo_no:'${file.photo_no}'},success:function(comm){
				comm = JSON.parse(comm);
				$.each(comm, function(idx,c){						
					var tr = $("<tr></tr>");
					var td1 = $("<td></td>").html(c.photo_comm_cont);
					var td2 = $("<td></td>").html( moment(c.photo_comm_date).format('YYYY년 MM월 DD일 HH:mm:ss')	);
					var td3 = $("<td></td>").html(c.user_id);
					var delBtn = $("<button></button>").text("댓글삭제").attr(" photo_comm_no	",c.photo_comm_no);
					var td4 = $("<td></td>");
					td4.append(delBtn);
					tr.append(td1, td2, td3, td4);
					$("#comm_list").append(tr);
			
			 //댓글 삭제
					$(delBtn).click(function(){
			 				alert("버튼 누름");
							var delCheck = confirm("댓글을 삭제하시겠습니까?");
							if(delCheck == true){
								self.location = "/comment/commDeleteSubmit?photo_comm_no="+c.photo_comm_no;
								alert("댓글을 삭제했습니다!");
								location.reload();
							}
					})
				})
			}});
		});

</script>
</head>
<body>
	<h2>sns</h2>
	<hr>
	<a href="/pic_board/list">sns 메인</a><br><br>
	<form id="f">
	<input type="hidden" id="photo_no" value="${Board.photo_no }">
	<table border="1" width="80%">
	<tr>
			<td>사진</td>
			<!-- <td>${Board.photo_no}</td> -->
			<img width="200" height="200" src="/img/${file.photo_file_name}"/>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><div>${Board.photo_detail }</div></td>
		</tr>
		<tr>
			<td>
				<img id="like" src="/img/like.png">
				<img id="clickLike" src="/img/clickLike.png">
			</td>
			<!-- escapeXml="false" 없으면 화면에 <p id='cntLike'>0</p> 태그가 다 보임  -->
			<!-- https://needjarvis.tistory.com/51 참고  -->
			<td>좋아요 <c:out value="<p id='cntLike'>${Board.cntLike }</p>" escapeXml="false"/> </td>
		</tr>
	</table>
	</form>
	<button id="btnUpdate">글 수정</button>
	<button id="btnDelete">글 삭제</button>
	<hr>
	
	<!--댓글입력폼-->
	<form name="commentForm" method="post">
		<input type="hidden" id="photo_no" name="photo_no" value="${Board.photo_no}">
		댓글 작성자 : <input type="text" name="user_id" required="required"><br>
		댓글 내용 : <textarea name="photo_comm_cont" rows="5" cols="20"></textarea><br>
	</form>
	<button type="submit" id="comment">댓글 등록</button>
	<hr>
		 댓글 목록
	<table id="comm_list" border="1">
	</table>
</body>
</html>
