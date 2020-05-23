<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께 가요</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='writeForm']");
	$(".write_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "writeTogether");
		formObj.attr("method", "post");
		formObj.submit();
	});
	$('#summernote').summernote({
		height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadSummernoteImageFile(files[0],this);
			}
		}
});

	/**
		 * 이미지 파일 업로드
		 */
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/together/uploadSummernoteImageFile",
				contentType : false,
				processData : false,
				success : function(data) {
					//항상 업로드된 파일의 url이 있어야 한다.
					$(editor).summernote('insertImage', data.url);
					var t_fname = data.t_fname;
					var t_org_fname = data.t_org_fname
					$("#t_fname_input").val(t_org_fname);
				}
			});
		}
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
</head>
<body>
	<div id="root">
		<header>
			<h1>함께가요 등록하기</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />

		<section id="container">
			<form method="post" action="writeTogether" name="writeForm" enctype="multipart/form-data">
				<table>
					<tbody>
						<tr>
							<td><label for="t_thumbnail">썸네일</label> <input type="file"
								id="t_thumbnail" name="thumbnailFile" class="chk"
								title="썸네일을 입력하세요." /></td>
						</tr>

						<tr>
							<td><label for="t_title">제목</label> <input type="text"
								id="t_title" name="t_title" class="chk" title="제목을 입력하세요." /></td>
						</tr>

						<tr>
							<td><label for="t_intro">인트로</label> <input type="text"
								id="t_intro" name="t_intro" class="chk" title="인트로를 입력하세요." /></td>
						<tr>
						<tr>
							<td><label for="t_detail">내용</label><br> <textarea
									id="summernote" name="t_detail" class="chk" title="내용을 입력하세요."></textarea></td>
						</tr>
						<tr>
							<td><label for="t_fname">파일첨부</label><br><input type="text"
									id="t_fname_input" name="t_fname"></td>
						</tr>

						<tr>
							<td><label for="t_size">총 참가 인원</label> <input type="text"
								id="t_size" name="t_size" class="chk" title="총인원을 입력하세요." /></td>
						<tr>
						<tr>
							<td><label for="t_place">모임장소</label> <input type="text"
								id="t_place" name="t_place" class="chk" title="모임장소를 입력하세요." />
							</td>
						<tr>
						<tr>
							<td><label for="t_date">모임일</label> <input type="text"
								id="t_date" name="t_date" class="chk" title="모임날짜를 입력하세요." /></td>
						</tr>
						<tr>
							<td>
								<button type="submit" class="write_btn">작성</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>