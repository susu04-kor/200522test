<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께가요</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//form태그를  변수에 저장
	 var formObj = $("form[name='detailForm']");

	//수정
	$(".update_btn").on("click",function(){
		formObj.attr("action","updateTogetherView");
		formObj.attr("method","get");
		formObj.submit();
	});

	//삭제
	$(".delete_btn").on("click",function(){
		var deleteYN = confirm("삭제하시겠습니까?");
		
		if(deleteYN==true){
			formObj.attr("action","deleteTogether");
			formObj.attr("method","post");
			formObj.submit();
		}
	});

	//검색 유지한 목록으로 돌아가기
	//5월8일 현재 동작 안되고 있음 주소창에 입력값은 가져와지는데 페이지가 넘어가지지 않음
	$(".list_btn").on("click", function(){
		event.preventDefault();
		location.href = "/together/listTogether?page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
	})

	//댓글 수정 View
	$(".replyUpdateBtn").on("click", function(){
		location.href = "/together/updateReplyView?t_num=${detailTogether.t_num}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						//클릭이벤트가 발생한 수정버튼의 data-t_r_num을 가져오겠다.
						+ "&t_r_num="+$(this).attr("data-t_r_num");
	});
			
	//댓글 삭제 View
	$(".replyDeleteBtn").on("click", function(){
		location.href = "/together/deleteReplyView?t_num=${detailTogether.t_num}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						+ "&t_r_num="+$(this).attr("data-t_r_num");
	});

	//비밀댓글
   $(".replyWriteBtn").click(function(){
      //비밀댓글 파라미터 추가
      var param = $("#replyForm").serialize();
      $.ajax({
         type:"post",
         url:"/together/writeReply",
         data:param,
         success:function(){
            alert("댓글이 등록되었습니다.");
            window.location.reload(true);
         }
      });
   });

 	//비밀 체크박스
    $("#secretReply_chk").click(function(){
      if($("#secretReply_chk").is(":checked") == true){
      $("#secretReply").val("y");
      }else{
         $("#secretReply").val("n");
      }
    });

	//신청하기
	var t_num = $("#t_num").val();
	var user_id = "user1";
  	var t_size = ${detailTogether.t_size };
  	var t_attendee_cnt = ${detailTogether.t_attendee_cnt };

	console.log(t_num,user_id,t_size,t_attendee_cnt)
  	
	$("#clickApplication").hide();
	
	//신청하기 체크
	var okApplication = function(user_id, t_num){
		$.ajax("/together/okApplication",{data: {user_id:user_id,t_num:t_num}, success:function(re){
			if( re == 1 ){				//
				$("#clickApplication").show();	
				$("#Application").hide();
			}
		}})
	}

	okApplication(user_id, t_num);

	// 신청하기 insert
	$(document).on("click","#Application",function(){
		var data = $("#applicationForm").serialize();
		console.log(user_id,t_num)
		$.ajax("/together/insertApplication",{data:{user_id:user_id, t_num:t_num,t_size:t_size,t_attendee_cnt:t_attendee_cnt}, success:function(re){
			alert(re);
			if(re === "신청하기 완료"){
				$("#clickApplication").show();
				$("#Application").hide();	
				$("#cntApplication").html(eval($("#cntApplication").html())+1);	
			}
		}})
			
	})
	
	// 신청하기 delete 신청하기 한번 더 누르면 신청취소
	$(document).on("click","#clickApplication",function(){
		$.ajax("/together/deleteApplication",{data: {user_id:user_id, t_num:t_num},success: function(re){
			if( re == 1 ){
				$("#clickApplication").hide();
				$("#Application").show();
				$("#cntApplication").html(eval($("#cntApplication").html())-1);
				alert("신청취소 완료");
			}
		}})
	})

});
</script>
</head>
<body>
		<div id="root">
			<header>
				<h1> 함께가요 상세</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form id="detailForm" name="detailForm" role="form" method="get">
				<!-- scri의 값을 보관하기 위해서 form태그안에 타입 hidden -->
				<input type="hidden" id="user_id" name="user_id" value="${detailTogether.user_id }">
				<input type="hidden" id="t_num" name="t_num" value="${detailTogether.t_num }"/>
				<input type="hidden" id="t_size" name="t_size" value="${detailTogether.t_size }"/>
				<input type="hidden" id="t_attendee_cnt" name="t_attendee_cnt" value="${detailTogether.t_attendee_cnt }"/>
				<input type="hidden" id="page" name="page" value="${scri.page }"/>
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
				
					<table>
						<tbody>
							
							<tr>
								<td>
									<label for="t_num">글번호</label><input type="text" id="t_num" name="t_num" value="${detailTogether.t_num }"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_thumbnail">썸네일</label><input type="text" id="thumbnail" name="thumbnail" value="${detailTogether.thumbnail }"/><br>
									<img src="../t_thumbnailUpload/${detailTogether.thumbnail}">
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_title">제목</label><input type="text" id="t_title" name="t_title" value="${detailTogether.t_title }"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_intro">인트로</label><input type="text" id="t_intro" name="t_intro" value="${detailTogether.t_intro }"/>
								</td>
							<tr>
							
							<tr>
								<td>
									<label for="t_detail">내용</label><div id="t_detail" name="t_detail">${detailTogether.t_detail }</div>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_place">모임장소</label><input type="text" id="t_place" name="t_place" value="${detailTogether.t_place }"/>
								</td>
							<tr>
							
							<tr>
								<td>
<%-- 									<label for="t_size">총참가 인원</label><input type="text" id="t_size" name="t_size" value="${detailTogether.t_size }"/> --%>
									<label for="t_size">총참가 인원</label><input type="text" id="t_size" name="t_size" value="${detailTogether.t_size }"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_date">모임일</label><input type="text" id="t_date" name="t_date" value="${detailTogether.t_date }"/>
								</td>
							</tr>		
						</tbody>			
					</table>
					<hr>
					
					<hr>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>

				</form>
				<form name="applicationForm" id="applicationForm">
				<!-- scri의 값을 보관하기 위해서 form태그안에 타입 hidden -->
					<input type="hidden" id="t_num" name="t_num" value="${detailTogether.t_num }"/>
					<input type="hidden" id="t_size" name="t_size" value="${detailTogether.t_size }"/>
					<input type="hidden" id="t_attendee_cnt" name="t_attendee_cnt" value="${detailTogether.t_attendee_cnt }"/>
					<input type="hidden" id="page" name="page" value="${scri.page }"/>
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
					
					<div>
						<button id="Application">신청하기</button>
						<button id="clickApplication">신청취소</button>
						<c:out value="<p id='cntApplication'>${together.t_attendee_cnt }</p>" escapeXml="false" />
					</div>
				</form>
				<hr>
				<form id="replyForm" method="post">
					<input type="hidden" id="t_num" name="t_num" value="${detailTogether.t_num }"/>
					<input type="hidden" id="page" name="page" value="${scri.page }"/>
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
					
					
					<div>
						<label for="user_id">댓글 작성자</label><input type="text" id="user_id" name="user_id" />
						<br/>
						<label for="t_r_content">댓글 내용</label><input type="text" id="t_r_content" name="t_r_content" />
					</div>
					<div>
						<input type="checkbox" id="secretReply_chk">비밀댓글 
						<input type="hidden" id="secretReply" name="secret_reply">
						<button type="button" class="replyWriteBtn">작성</button>
					</div>
				</form>
					
					
					<div id="reply">
					  <ol class="replyList">
					    <c:forEach items="${replyList}" var="replyList">
					      <li>
					        <p>
					        작성자 : ${replyList.user_id}<br />
					        작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
					        ${replyList.secret_reply}
					        </p>
					        <!-- 비밀여부체크, 로그인 완성되면 함께가요 작성자,댓글작성자도 추가해야됨 -->
		                     <c:choose>
		                        <c:when test="${replyList.secret_reply eq 'y' }">
		                           <p>비밀댓글입니다</p>
		                        </c:when>
		                        
		                     	<c:otherwise>
		                    	  <p>${replyList.t_r_content}</p>
		                     	</c:otherwise>
		                     </c:choose>
					
					        <div>
							  <button type="button" class="replyUpdateBtn" data-t_r_num="${replyList.t_r_num}">수정</button>
							  <button type="button" class="replyDeleteBtn" data-t_r_num="${replyList.t_r_num}">삭제</button>
							</div>
					      </li>
					    </c:forEach>
					  </ol>
					</div>
					
					<!-- 신청자 목록 -->
					<div id="userApplication">
						<form role="form">
							<table width="30%">
								<tr>
									<td>현재 참여자</td>
								</tr>
							
							<c:forEach var="userList" items="${userList}" varStatus="status">
								<tr>
									<td>${userList.user_id}</td>
								</tr>
							</c:forEach>
							</table>
						</form>
					</div>
		</section>
			<input type="button" value="맨위로" onClick="javascript:window.scrollTo(0,0)" />
			<input type="image" src="/top.png" onClick="javascript:window.scrollTo(0,0)" alt="맨위로" />
			<hr />
		</div>
	</body>
</html>
