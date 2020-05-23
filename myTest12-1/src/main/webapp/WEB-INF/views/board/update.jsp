<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 민아) 5/10, 자유게시판 수정,삭제 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="../summernote/js/summernote-lite.js"></script>
<script src="../summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../summernote/css/summernote-lite.css">

<script type="text/javascript">
	var maxVolume = 20971520; 	//20mb를 byte로 환산한 숫자
	var listImg = [];
	var uploadImgs = [];

	$(function(){
		
		//썸머노트
		$('#summernote').summernote({
			maximumImageFileSize : maxVolume,	//첨부 이미지 크기 20MB로 보여짐 
			width: 650,
			height: 300,                 		// 에디터 높이
			minHeight: null,             		// 최소 높이
			maxHeight: null,             		// 최대 높이
			focus: true,                  		// 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",						// 한글 설정
			placeholder: '본문 내용을 입력해주세요!',	//placeholder 설정
			callbacks: {						// 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					$.each(files, function(idx, images){
						uploadSummernoteImageFile(images, $("#summernote"));
						//console.log(file);
					})
					//uploadSummernoteImageFile(files[0],this);
					
				}
			}
	});

		//이미지 파일 업로드
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			//console.log(file); // 이미지파일인지에 대한 유효성검사를 할 수 있다.	
			//alert(typeof file.size);
			//console.log(file.size);

			$.ajax({
				data : data,
				type : "POST",
				url : "/board/boardUpload",	// 이 url을 컨트롤러 @PostMapping(value="/boardUpload", 와 동일해야함 
				contentType : false,
				processData : false,
				success : function(data) {
			
					//이미지 용량제한은 application.properties 에 
					//	spring.servlet.multipart.max-file-size=20MB
					//	spring.servlet.multipart.max-request-size=20MB
					// 추가하면 됨 
					
					//파일 확장자
					var fname = data.originalFileName;	//파일 테이블에 저장되는 오리지널 파일명
					var fnameArr = fname.split(".");	// . 을 기준으로 잘라서
					var ext = fnameArr[1].toLowerCase();// 그중 [1], 2번째 확장자 부분
					//console.log(ext);
					//alert(typeof ext)
					
					if(ext === 'png' || ext === 'jpg' || ext === 'jpeg' || ext === 'gif' || ext === 'bmp'){
						//아니 위에 ext !== 'png' 이런건 왜 안먹히나 모르겠다.... 
						// 어차피 if 타고 오는게 없는데 왜죠 
					}else{
						alert ("이미지 파일만 등록할 수 있습니다! 확장자를 확인해주세요.");
						return false;
					}
			
					//항상 업로드된 파일의 url이 있어야 한다.
					$(editor).summernote('insertImage', data.url);		
					
					//전역변수로 만들어놓은 배열 리스트에 담기
					listImg.push(data);
					console.log(listImg);
					}
				})
			}
					
			$("#btnUp").click(function(e){
			// 고유 동작을 중단시킴.
			// e.preventDefault는 고유 동작을 중단시키고, e.stopPropagation 는 상위 엘리먼트들로의 이벤트 전파를 중단시킨다.
				e.preventDefault();
				var insertBoard = $("#updateForm").serialize();
		
				$.ajax({
					data : insertBoard,
					type : "POST",
					url : "/board/update",
					success : function(postNum){
						console.log(postNum);
						
						if(postNum > 0){
							$.each(listImg,function(idx, imgs){
								console.log(imgs)
								
								var myImg = {
									uuid : imgs.savedFileName,
									file_path : imgs.fileRoot,
									file_name : imgs.originalFileName,
									board_no : 	Number(postNum)
								}
	 							uploadImgs.push(myImg)
//	 							console.log(typeof uploadImgs)
								//var jsonData = JSON.stringfy(uploadImgs);
							})		
							console.log(JSON.stringify(uploadImgs));
							$.ajax({
								//stringify 메소드는 json 객체를 String 객체로 변환시켜 줍니다.
								data : JSON.stringify(uploadImgs),
								contentType:"application/json; charset=utf-8",
								dataType : "JSON",	
								type : "POST",
								url : "/board/imgsDB",
								success : function(ok){
									alert("수정성공")
									location.href="/board/get?board_no="+postNum;
								}
							})
						}	
					}
				})
			})
		});

</script>
</head>
<body>
	<h2>게시글 수정</h2>
	<hr>
	<form action="update" method="post" enctype="multipart/form-data" id="updateForm">
	<input type="hidden" id="board_no" name="board_no" value="${up.board_no}">
	
	<table width="100%">
		<tr>
		<select name="category">
			<option selected>카테고리 선택</option>
			<option value="수다">수다</option>
			<option value="질문">질문</option>
		</select>
		</tr>
		<tr>
			<td>글 제목</td>
			<td><input type="text" name="board_title" required="required" value="${up.board_title}" style="width:650px"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="user_id" readonly="readonly" value="${up.user_id}"></td>
		</tr>
		<tr>
		
			<td>내용</td>
			<td><textarea name="board_content" id="summernote">${up.board_content}</textarea></td>
		</tr>
		<tr>
			<td><input type="hidden" id="uuid" name="uuid" ></td>
			<td><input type="hidden" id="file_path" name="file_path" ></td>
			<td><input type="hidden" id="file_name" name="file_name" ></td>
		</tr>
		
	</table>
	<button type="submit" id="btnUp">수정</button>
	</form>

</body>
</html>