<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 민아) 5/10, 자유게시판 글 등록 -->
<!-- 민아) 5/11, 서머노트 파일 확장자가 이미지파일인것만 등록되게 & 용량 20mb 제한 -->
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
				var ext = fnameArr[1].toLowerCase();// 그중 [1], 2번째 확장자(extension) 부분, 소문자로 바꿔서!
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
				
		$("#save").click(function(e){
		// 폼태그 기본속성(action은 디폴트)을 동작중단시키지 않으면 글이 두개씩 등록되버림 
		// e.preventDefault는 고유 동작을 중단시키고, e.stopPropagation 는 상위 엘리먼트들로의 이벤트 전파를 중단시킨다.
			e.preventDefault();
			var insertBoard = $("#insertForm").serialize();
	
			$.ajax({
				data : insertBoard,
				type : "POST",
				url : "/board/insert",
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
// 							console.log(typeof uploadImgs)
							//var jsonData = JSON.stringfy(uploadImgs);
						})		
						console.log(JSON.stringify(uploadImgs));
						$.ajax({
// 						.ajax로 서버에 데이터를 보낼때, header 중 Content-Type 이 존재하는데
// 						이를 설정하지 않았을 땐 default 값으로 
// 						application/x-www-form-urlencoded; charset=UTF-8 타입으로 지정됩니다.
// 						따라서 json 형태의 데이터를 주고 싶을 땐,
// 						header:{"Content-Type":"application/json"} 을 지정해 주어야 합니다.
// 						그런데 여기서 또 한가지 문제점이 발생하는데,
// 						request 안에 포함된 json 형태의 데이터를 받았을 때, 이것을 보통 VO(혹은 DTO)에 다시 담아 사용하는데,
// 						.ajax는 데이터를 문자열화 해주지 않기 때문에 보낼 데이터를 JSON.stringify()로 감싸주어야 합니다.
// 						그렇지 않을 시,,
// 						json데이터의 "key":"value" 형태의 패턴을 인식하지 못합니다.
							data : JSON.stringify(uploadImgs),
							contentType:"application/json; charset=utf-8",
							dataType : "JSON",	
							type : "POST",
							url : "/board/imgsDB",
							success : function(ok){
								alert("등록성공")
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
	<h2>게시글 등록</h2>
	<hr>
	<form id="insertForm" method="post" enctype="multipart/form-data">
<%-- 	<input type="hidden" name="board_no" value="${no}"> --%>
	<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table width="100%">
		<tr>
			<td>제목</td><td> <input type="text" name="board_title" required="required" style="width:650px"></td>
		</tr>
		<tr>
		<select name="category">
			<option selected>카테고리 선택</option>
			<option value="수다">수다</option>
			<option value="질문">질문</option>
		</select>
		</tr>
		<tr>
			<td>작성자</td><td> <input type="text" name="user_id" required="required"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="board_content" id="summernote"></textarea></td>
		</tr>
		<tr>
			<td><input type="hidden" id="uuid" name="uuid" ></td>
			<td><input type="hidden" id="file_path" name="file_path" ></td>
			<td><input type="hidden" id="file_name" name="file_name" ></td>
		</tr>
	</table>
		<button type="submit" id="save">등록</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>

