<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 민아) 5/10, 자유게시판 목록 -->
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}	<!--페이징 가로정렬 스타일 -->
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<h2>자유 게시판</h2>
	<hr>
	<a href="/MainPage">메인페이지</a><br>
	<a href="/board/insert">게시글 등록</a><br>
	<form action="/board/list">
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
          self.location 
          	= "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() +
          		 "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
	</form>
	<table border="1" width="70%">
		<thead>
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>등록일</th>
				<th>조회수</th>
				<th>작성자</th>
			</tr>
		</thead>
											
		<tbody>
		<c:forEach var="board" items="${listBoard }">
			<tr>
				<td><c:out value="${board.board_no }"/></td>
				<td><c:out value="${board.category }"/></td>
				<td><a href="/board/get?board_no=${board.board_no}"><c:out value="${board.board_title }"/></a></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_date }"/></td>
				<td><c:out value="${board.board_hit }"/></td>
				<td><c:out value="${board.user_id }"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<hr>
	<div>
  		<ul>
		    <c:if test="${pageMaker.prev}">
		    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
		    </c:if> 
		
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		    </c:if> 
 		 </ul>
	</div>
</body>
</html>