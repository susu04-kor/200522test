<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!-- //영수) 5월12일 QnAjsp  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#AddQnA,#DetailQnA,#UpdateQnA,#AddRe{
	display: none;
	
}

li {
	list-style: none; float: left; padding: 6px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<!-- 썸머노트 설정 -->
<script src="../summernote/js/summernote-lite.js"></script>
<script src="../summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../summernote/css/summernote-lite.css">

<script type="text/javascript">
$(function(){

	
	//썸머노트
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
	* 이미지 파일 업로드 , qna 등록할때
	*/
	function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("inq_file", file);
	console.log(file); //파일 정보
	$.ajax({
		data : data,
		type : "POST",
		url : "/uploadSummernoteImageFile",
		contentType : false,
		processData : false,
		success : function(data) {
	    	//항상 업로드된 파일의 url이 있어야 한다.
			$(editor).summernote('insertImage', data.url);
			console.log(data.url);
// 			alert(data.url);
// 			alert(data);
			var data_url = data.url;
			var n = data_url.split('/');
			$("#inq_file").val(n[2]);
			}
		});
	}


	/**
	* 이미지 파일 업로드 , qna 수정할때
	*/
	function uploadSummernoteImageFile2(file, editor) {
	data = new FormData();
	data.append("up_inq_file", file);
	console.log(file); //파일 정보
	$.ajax({
		data : data,
		type : "POST",
		url : "/uploadSummernoteImageFile2",
		contentType : false,
		processData : false,
		success : function(data) {
	    	//항상 업로드된 파일의 url이 있어야 한다.
			$(editor).summernote('insertImage', data.url);
// 			alert(data.url);
			alert(data);
			var data_url = data.url;
			var n = data_url.split('/');
			$("#up_inq_file").val(n[2]);
			}
		});
	}
	
	var arr = ${list };
// 	console.log(arr);
	
	All();

	//리스트
	function All(){
		$.each(arr,function(idx,qna){
				var inq_no = $("<td></td>").append(qna.inq_no);
				
				var category = qna.cs_no;

				
				var cs_no = $("<td></td>");
				if(category == 1){
					cs_no.append("홈페이지 이용 관련");
					}
				else if(category == 2){
					cs_no.append("계정 관련");
					}
				else if(categoty ==3 ){
					cs_no.append("결제 관련 문의");
					}
				var user_id = $("<td></td>").append(qna.user_id);

				var a = qna.inq_title;
				
// 				var reimg = $("<img src='../adminImg/re.jpg'>");
 				var reimg = $("<img src='../adminImg/re2.png'>");
				if(qna.ref_level > 0){
					var inq_title = $("<td></td>");
					//들여쓰기
					for(var g = 0; g<=qna.ref_level; g++){
							inq_title.append("&nbsp;","&nbsp;");
						}
					inq_title.append(reimg,a);
					var user_id = $("<td></td>").append("관리자");
					}else {
						var inq_title = $("<td></td>").append(a);
						var user_id = $("<td></td>").append(qna.user_id);
						}
				
				
				var inq_date = $("<td></td>").append(moment(qna.inq_date).format('YYYY년 MM월 DD일 HH시 mm분'));
// 				var inq_date = $("<td></td>").append(qna.inq_date);
				
 				var tr = $("<tr></tr>").append(inq_no,cs_no,user_id,inq_title,inq_date);
// 				var tr = $("<tr></tr>").append(cs_no,user_id,inq_title,inq_date); //글번호 지움
				
				$("#list").append(tr);

				//상세보기
				$(tr).on("click",function(){
					$("#ListQnA").css("display","none");
					$("#DetailQnA").css("display","block");
					var d_no = {inq_no:qna.inq_no};
					$.ajax("/customerservice/detailQnA",{data:d_no,success:function(detail){
						$("#detail_inq_no").val(detail.inq_no);
						$("#detail_cs_no").val(detail.cs_no);

						if(qna.ref_level > 0){
							$("#detail_user_id").val("관리자");
							}else {
								$("#detail_user_id").val(detail.user_id);
								}
						
						$("#detail_inq_title").val(detail.inq_title);
						
	/*	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	
						var dit = detail.inq_title;			
						//답변 이면 답변 버튼 지움
						if(dit === "답변 입니다"){
							$("#re").css({"display":"none"});
						}
	*/  // 	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa									
						$('#detail_inq_content').append(detail.inq_content).css({"border":"1px solid"});
						$("#detail_inq_date").val(moment(detail.inq_date).format('YYYY년 MM월 DD일 HH시 mm분'));
// 						$("#detail_inq_date").val(detail.inq_date);

						//수정 폼
						$("#up").click(function(){
//	 						alert("수정버튼 누름");
							$("#DetailQnA").css("display","none");
							$("#UpdateQnA").css("display","block");
							$("#up_inq_no").val(detail.inq_no);
							$("#up_cs_no").val(detail.inq_cs_no);	
							$("#up_user_id").val(detail.user_id);					
							$("#up_inq_title").val(detail.inq_title);	
							
							$('#up_inq_content').summernote({
								height: 300,                 // 에디터 높이
								minHeight: null,             // 최소 높이
								maxHeight: null,             // 최대 높이
								focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
								lang: "ko-KR",					// 한글 설정
								placeholder: "",	//placeholder 설정
								callbacks: {	//여기 부분이 이미지를 첨부하는 부분
									onImageUpload : function(files) {
										uploadSummernoteImageFile2(files[0],this);
									}
								}
							});

							//썸머노트에서 append 기능
							$('#up_inq_content').summernote('code', detail.inq_content);
											
							$("#up_inq_date").val(detail.inq_date);
							$("#up_ref").val(detail.ref);							
							$("#up_ref_step").val(detail.ref_step);							
							$("#up_ref_level").val(detail.ref_level);
							
							$("#up_btn").click(function(){
								var u = $("#upQnA").serialize();
								$.ajax("/customerservice/updateQnA",{data:u,success:function(){
									window.location.reload(true);
									$("#ListQnA").css("display","block");
									$("#UpdateQnA").css("display","none");
									}});
								}) //수정 ajax end
								
							}); //수정폼 end

							//삭제
							$("#del").click(function(){
//		 						alert(qna.inq_no);
								var con = confirm("삭제할까요?");

								if(con == true){
									var dd_no = {inq_no:detail.inq_no,ref:detail.ref}
									console.log(dd_no);
									
									//답변 있는지 확인
									$.ajax("/customerservice/checkQnA",{data:dd_no,success:function(r){
// 											alert(r);
											console.log(typeof r);
											if(r === "o"){
												alert("답변이 있는 문의글은 수정,삭제 불가능합니다");
													window.location.href="/customerservice/List";
													$("#ListQnA").css("display","block");
													$("#DetailQnA").css("display","none");
												}else{
													//답변 없으면 삭제
													$.ajax("/customerservice/deleteQnA",{data:d_no,success:function(){
														window.location.reload(true);
														$("#ListQnA").css("display","block");
														$("#DetailQnA").css("display","none");
														}});							
												}
										}}); //checkQnA end
									}					
								}); //삭제 end

						}}); //상세보기 ajax end

					//답변 이면 답변 버튼 지움
					var dit = qna.inq_title;
					if(dit === "답변 입니다"){
// 						$("#re").css({"display":"none"});
						var df = qna.inq_ref;
// 						console.log(df);
// 						alert(typeof df);
						var rdf = df -1;
						console.log("ref"+rdf);
						$("#re_inq_ref").val(rdf);
						
					}else{
						$("#re_inq_ref").val(qna.ref);
						
					}
					
					//답변등록 폼
					$("#re").click(function(){
// 						alert(qna.inq_no + "번글에 답변등록");
						$("#rebutton").css("display","none");
						$("#AddRe").css({"display":"block","border":"1px solid"});
						$("#ListQnA").css("display","none");
						$("#re_inq_no").val(qna.inq_no);
						$("#re_user_id").val(qna.user_id);
						$("#re_inq_title").val(qna.inq_title+"의 답변입니다");
						$("#re_inq_ref_step").val(qna.ref_step);
						$("#re_inq_ref_level").val(qna.ref_level);
						//답변등록
						$("#submitRe").click(function(){
							var r = $("#insertRe").serialize();
							
							$.ajax("/customerservice/insertRe",{data:r,success:function(){
								window.location.reload(true);
								$("#ListQnA").css("display","block");
								$("#AddRe").css("display","none");
								}});//insertRe ajax end
							
							}); //답변등록 end
						
						}); //답변등록폼 end

						
					
					}); //상세보기 end
		
			}) //each end
			
	}//list end
	//등록폼
	$("#add").click(function(){
		$("#ListQnA").css("display","none");
		$("#AddQnA").css("display","block");
		});

	//버트 누르면 등록
	$("#btn").click(function(){	
		var i = $("#insertQnA").serialize();	
		$.ajax("/customerservice/insertQnA",{data:i,success:function(){
			window.location.reload(true);
			$("#ListQnA").css("display","block");
			$("#AddQnA").css("display","none");
			}});
		});
	
})
</script>

</head>
<body>
<a href="/MainPage">메인페이지</a>

<section id="ListQnA">
<h2>QnA리스트</h2>
<hr>
<form role="form" method="get">
  <div class="search">
    <select name="searchType">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "/customerservice/List" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
</form>
<table id="list" border="1" width="60%">
	<tr><th>카테고리</th><th>작성자</th><th>제목</th><th>작성일자</th></tr>
</table>

<button id="add">QnA등록하기</button><br>
<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="/customerservice/List${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="/customerservice/List${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="/customerservice/List${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
</section>


<section id="AddQnA">
<h2>QnA등록</h2>
<hr>
<form id="insertQnA">
카테고리<br>
<select name="cs_no" required="required">
	<option value="1">홈페이지 이용 관련</option>
	<option value="2">계정 관련</option>
	<option value="3">결제 관련 문의</option>
</select><br>
작성자<br>
<input type="text" name="user_id" required="required"><br>
제목<br>
<input type="text" name="inq_title" required="required"><br>
내용<br>
<textarea rows="8" cols="100" id="summernote" name="inq_content"></textarea><br>
<a href="/customerservice/List">뒤로가기</a>
<input type="hidden" name="inq_file" id="inq_file"><br>
</form>
<input type="button" id="btn" value="문의등록"><br>
<a href="/customerservice/List">QnA리스트 돌아가기</a>
</section>

<section id="DetailQnA">
<h2>QnA상세보기</h2>
<hr>
글번호 	<input type="text" id="detail_inq_no" readonly="readonly"><br>
카테고리	<input type="text" id="detail_cs_no" readonly="readonly"><br>
작성자	<input type="text" id="detail_user_id" readonly="readonly"><br>
제목		<input type="text" id="detail_inq_title" readonly="readonly"><br>
내용		<div id="detail_inq_content"></div><br>
작성일	<input type="text" id="detail_inq_date" readonly="readonly"><br>

	<section id="rebutton">
		<button id="up">수정하기</button><br>
		<button id="del">삭제하기</button><br>
   		<button id="re">답변달기</button><br>
	</section>
	<a href="/customerservice/List">QnA리스트 돌아가기</a>
</section>
<section id="AddRe">
	<h3>답변등록</h3>
	<hr>
	<form id="insertRe">
	<!-- 원본글 번호 저장 -->
	<input type="text" id="re_inq_no" name="inq_no"><br>
		카테고리<br>
		<select name="cs_no">
			<option value="1">홈페이지 이용 관련</option>
			<option value="2">계정 관련</option>
			<option value="3">결제 관련 관련</option>
		</select><br>
		작성자 아이디<br>
		<input type="text" id="re_user_id" name="user_id"><br>
		제목<br>
		<input type="text" id="re_inq_title" name="re_inq_title"><br>
		내용<br>
		<textarea rows="8" cols="100" id="re_inq_content" name="re_inq_content" required="required"></textarea><br>
		<input type="text" id="re_inq_ref" name="re_ref">
		<input type="text" id="re_inq_ref_step" name="re_ref_setp">
		<input type="text" id="re_inq_ref_level" name="re_ref_level">
	</form>
	<button id="submitRe">답변등록</button><br>
	<a href="/customerservice/List">QnA리스트 돌아가기</a>
</section>

<section id="UpdateQnA">
	<h2>QnA수정</h2>
	<hr>
	<form id="upQnA">
		<input type="text" id="up_inq_no" name="up_inq_no"><br>
		카테고리<br>
		<select id="up_cs_no" name="up_cs_no"><br>
			<option value="1">홈페이지 이용 관련</option>
			<option value="2">계정 관련</option>
			<option value="3">결제 관련 문의</option>
		</select><br>
		작성자<br>
		<input type="text" id="up_user_id" name="up_user_id" readonly="readonly"><br>
		제목<br>
		<input type="text" id="up_inq_title" name="up_inq_title"><br>
		
		내용<br>
		<div id="up_content">
		
		</div>
		<textarea rows="8" cols="100" id="up_inq_content" name="up_inq_content"></textarea><br>
		작성일<br>
		<input type="hidden" id="up_inq_date" name="up_inq_date" readonly="readonly"><br>
		<input type="hidden" id="up_ref" name="up_ref"><br>
		<input type="hidden" id="up_ref_step" name="up_ref_step"><br>
		<input type="hidden" id="up_ref_level" name="up_ref_level"><br>
		<input type="hidden" name="up_inq_file" id="up_inq_file"><br>
	</form>
	<button id="up_btn">수정</button><br>

<a href="/customerservice/List">QnA리스트 돌아가기</a>
</section>

</body>
</html>