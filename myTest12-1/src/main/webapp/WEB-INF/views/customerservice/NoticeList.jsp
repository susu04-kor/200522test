<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#addSection,#detailSection,#updateSection{
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

// 	이미지 파일 업로드
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/customerservice/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}

	
	var list = ${list}

	//공지사항 리스트
	$.each(list,function(idx,notice){
		var notice_no = $("<td></td>").append(notice.notice_no);
		var notice_title = $("<td></td>").append(notice.notice_title);
		var notice_content = $("<td></td>").append(notice.notice_content);
		var notice_hit = $("<td></td>").html(notice.notice_hit);
		var notice_date = $("<td></td>").append(moment(notice.notice_date).format('YYYY년 MM월 DD일 HH시 mm분'));
// 		var notice_date = $("<td></td>").append(notice.notice_date);

		var cs_no = $("<td></td>");
		
		if(notice.cs_no == 1){
			cs_no.html("홈페이지 이용 관련");
		}else if (notice.cs_no == 2){
			cs_no.html("계정 관련");
		}else if (notice.cs_no ==3){
			cs_no.html("결제 관련 문의");
			}
		

		var tr = $("<tr></tr>").append(notice_no, cs_no, notice_title, notice_hit, notice_date);

		$("#listNotie").append(tr);

		//상세보기
		$(tr).on("click",function(){
			var ino = {notice_no:notice.notice_no};
			$("#detailSection").css({"display":"block"});
			$("#listSection").css({"display":"none"});
			$.ajax("/customerservice/detailNotice",{data:ino, success:function(detail){
// 					console.log(detail);
// 					alert(detail.cs_no);
					//상세보기
					$("#d_notice_no").val(detail.notice_no);
					$("#d_notice_title").val(detail.notice_title);
					$("#d_notice_content").append(detail.notice_content).css({"border":"1px solid"});
					$("#d_notice_hit").val(detail.notice_hit);
					$("#d_notice_date").val(moment(detail.notice_date).format('YYYY년 MM월 DD일 HH시 mm분'));
// 					$("#d_notice_date").val(detail.notice_date);
					
					var d_ca = detail.cs_no;
					console.log(d_ca);
					if(d_ca == 1){
						$("#d_cs_no").val("홈페이지 이용 관련");
						}
					else if(d_ca == 2){
						$("#d_cs_no").val("계정 관련");
						}
					else if(d_ca == 3){
						$("#d_cs_no").val("결제 관련 관련");
						}


					//입력된값 불러서 수정폼에 셋팅
					$("#u_notice_no").val(detail.notice_no);
					$("#u_notice_title").val(detail.notice_title);

					$('#u_notice_content').summernote('code', detail.notice_content);
					
					$("#u_notice_hit").val(detail.notice_hit);
					$("#u_notice_date").val(moment(detail.notice_date).format('YYYY년 MM월 DD일 HH시 mm분'));
// 					$("#u_notice_date").val(detail.notice_date);

					$("#u_cs_no").val(detail.cs_no);
					
					//수정 버튼 누르면
					$("#upNotice").click(function(){
						
						var updata = $("#updateForm").serialize();
						$.ajax("/customerservice/updateNotice",{data:updata,success:function(){
							window.location.href="/customerservice/allNotice";
							}});
						});
					
					//삭제
					$("#del").click(function(){
						var dc = confirm("삭제할까요?");
						var dn = {"notice_no":detail.notice_no};
						if(dc == 1 ){
							$.ajax("/customerservice/deleteNotice",{data:dn,success:function(){
								alert("삭제했습니다");
								window.location.href="/customerservice/allNotice";
								}});
						}

					}); //삭제 end
					
				}}); //detail ajax end
			
			//수정폼
			$("#up").click(function(){
				$("#updateSection").css({"display":"block"});
				$("#detailSection").css({"display":"none"});
				//썸머노트
				$('#u_notice_content').summernote({
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
				}); //썸머노트 폼 end
				
				}); //수정봄 end
			
			}); //상세보기 end
		
		}); //each end

		//공지사항 등록 폼
		$("#addbtn").click(function(){
			$("#listSection").css({"display":"none"});
			$("#addSection").css({"display":"block"});
// 			alert("등록버튼 누름");
			//썸머노트
			$('#notice_content').summernote({
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
			}); //썸머노트 폼 end
		
		});
		
		//공지사항 등록 
		$("#addNotice").click(function(){
			var data = $("#insertForm").serialize();
			$.ajax("/customerservice/insertNotice",{data:data,success:function(){
// 				alert("공지사항 등록");
				$("#listSection").css({"display":"block"});
				$("#addSection").css({"display":"none"});
				window.location.reload(true);
				}});
		});//공지사항 등록 end

	
});
</script>
</head>
<body>
<a href="/MainPage">메인화면</a>
<section id="listSection">
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
          self.location = "/customerservice/allNotice" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
</form>
<h2>공지사항 리스트</h2>
<hr>
<table id="listNotie" width="80%">
	<tr>
		<th>공지사항 번호</th><th>카테고리</th><th>제목</th><th>조회수</th><th>작성일</th>
	</tr>
</table>
<button id="addbtn">공지사항 등록</button>

<section id="p">
<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="/customerservice/allNotice${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="/customerservice/allNotice${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="/customerservice/allNotice${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
</section>

</section>

<section id="addSection">
<h2>공지사항 등록</h2>
<hr>
<form id="insertForm">
<select name="cs_no">
	<option value="1">홈페이지 관련</option>
	<option value="2">계정 관련</option>
	<option value="3">결제 관련 문의</option>
</select><br>
제목<br>
<input type="text" id="notice_title" name="notice_title" required="required"><br>
내용<br>
<textarea rows="8" cols="100" id="notice_content" name="notice_content"></textarea>
</form>
<button id="addNotice">등록하기</button><br>
<a href="/customerservice/allNotice">리스트로 돌아가기</a>
</section>

<section id="detailSection">
<h2>공지사항 상세보기</h2>
<hr>
카테고리<br>
<input type="text" id="d_cs_no" readonly="readonly"><br>
공지사항 번호 : <input type="text" id="d_notice_no" readonly="readonly"><br>
제목 : <input type="text" id="d_notice_title" readonly="readonly"><br>
내용<br>
<div id="d_notice_content"></div><br>
조회수 : <input type="text" id="d_notice_hit" readonly="readonly"><br>
작성일 : <input type="text" id="d_notice_date" readonly="readonly"><br>

<section id="btnSection">
	<button id="up">수정</button><br>
	<button id="del">삭제</button><br>
	<a href="/customerservice/allNotice">리스트로 돌아가기</a>
</section>
</section>

<section id="updateSection">
<h2>공지사항 수정</h2>
<hr>
<form id="updateForm">
카테고리<br>
<select id="u_cs_no" name="u_cs_no"><br>
	<option value="1">홈페이지 이용 관련</option>
	<option value="2">계정 관련</option>
	<option value="3">결제 관련 문의</option>
</select><br>
공지사항 번호 : <input type="text" id="u_notice_no" name="u_notice_no" readonly="readonly"><br>
제목 : <input type="text" id="u_notice_title" name="u_notice_title"><br>
내용<br>
<textarea rows="8" cols="100" id="u_notice_content" name="u_notice_content"></textarea>
조회수 : <input type="text" id="u_notice_hit" readonly="readonly"><br>
작성일 : <input type="text" id="u_notice_date" readonly="readonly"><br>
</form>

<section id="btnSection">
	<button id="upNotice">수정하기</button><br>
	<a href="/customerservice/allNotice">리스트로 돌아가기</a>
</section>
</section>
</body>
</html>