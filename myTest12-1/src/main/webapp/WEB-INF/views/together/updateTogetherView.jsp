<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께 가요</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("from[name='updateForm']");
	
	$(".cancel_btn").on("click",function(){
		event.preventDefault();
		location.href = "/together/detailTogether?t_num=${updateTogether.t_num}"
			   + "&page=${scri.page}"
			   + "&perPageNum=${scri.perPageNum}"
			   + "&searchType=${scri.searchType}"
			   + "&keyword=${scri.keyword}";
	});
	$(".update_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "updateTogether");
		formObj.attr("method", "post");
		formObj.submit();
	});
	function fn_valiChk(){
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i = 0; i<updateForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}

	//썸네일 파일 수정 버튼을 누르면
	$("#th_btn").click(function(e){
		//폼 안에 있어서 기본 이벤트 제거
// 		e.preventDefault();
// 		e.stopPropagation();
		$("#thumbnail").remove();
		$("#th_btn").css({"display":"none"});
		var aa = $("<input type='file' name='up_thumbnailFile'>");
		
		$("#o_section").append(aa);
		});
	
});
</script>
</head>
<body>
	<div id="root">
		<header>
			<h1> 함께가요 수정</h1>
		</header>
		<hr />
			 
		<nav>
			  홈 - 글 작성
		</nav>
		<hr />
		
		<section id="container">
				<form name="updateForm" role="form" method="post" action="updateTogether" enctype="multipart/form-data">
					<input type="hidden" name="t_num" value="${updateTogether.t_num}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									썸네일<br>
									
									<section id="o_section">
									<input type="text" id="thumbnail" name="thumbnail" value="${updateTogether.thumbnail}"><br>
									<input type="button" id="th_btn" value="썸네일 사진  수정">
									</section>
									
									<section id="th_section">
									<br>
									</section>
									
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_title">제목</label><input type="text" id="t_title" name="t_title" value="${updateTogether.t_title}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_intro">인트로</label><input type="text" id="t_intro" name="t_intro" value="${updateTogether.t_intro}" class="chk" title="인트로를 입력하세요."/>
								</td>
							<tr>
							
							<tr>
								<td>
									<label for="t_detail">내용</label><textarea id="t_detail" name="t_detail" class="chk" title="내용을 입력하세요.">${updateTogether.t_detail}</textarea>
								</td>
							</tr>
													
							<tr>
								<td>
									<label for="t_place">모임장소</label><input type="text" id="t_place" name="t_place" value="${updateTogether.t_place}" class="chk" title="모임장소를 입력하세요."/>
								</td>
							<tr>
							
							<tr>
								<td>
									<label for="t_size">총인원</label><input type="text" id="t_size" name="t_size" value="${updateTogether.t_size}" class="chk" title="총인원을 선택하세요."/>
								</td>
							<tr>
					
<!-- 							<tr> -->
<!-- 								<td> -->
<%-- 									<label for="t_date">모임일</label><input type="text" id="t_date" name="t_date" value="${updateTogether.t_date}" class="chk" title="모임날짜를 입력하세요."/> --%>
<!-- 								</td> -->
<!-- 							</tr> -->
							
							<tr>
								<td>
									<label for="t_fname">첨부파일</label><input type="text" id="t_fname" name="t_fname" value="${updateTogether.t_fname}"/>
								</td>
							</tr>
									
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn">수정</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
</body>
</html>