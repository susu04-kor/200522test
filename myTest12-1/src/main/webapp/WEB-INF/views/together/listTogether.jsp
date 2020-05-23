<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께 가요</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
 	$('#searchBtn').click(function() {
    	self.location = "listTogether" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
     });
	
});
</script>
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}
</style>
</head>
		<div id="root">
			<header>
				<h1> 함께가요 목록</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form role="form" method="get">
					<table width="80%">
						<tr>
							<th>썸네일</th>
							<th>제목</th>
							<th>인트로</th>
							<th>아이디</th>
							<th>총모집인원</th>
							<th>현재참가인원</th>
							<th>모임일</th>
							<th>모임장소</th>
							<th>조회수</th>
						</tr>
						<c:forEach var="c" items="${listTogether}" varStatus="status">
							<tr>
								<td><img src="../t_thumbnailUpload/${c.thumbnail}" width="100" height="100"></td>
								
								<td><a href="detailTogether?t_num=${c.t_num}&
															page=${scri.page}&
															perPageNum=${scri.perPageNum}&
															searchType=${scri.searchType}&
															keyword=${scri.keyword}">${c.t_title}</a>
								</td>
								<td>${c.t_intro}</td>				
								<td>${c.user_id}</td>
								<td>${c.t_size}</td>
								<td>${c.t_attendee_cnt}</td>	
								<td>${c.t_date}</td>	
								<td>${c.t_place}</td>
								<td>${c.t_hit}</td>	
							</tr>
						</c:forEach>


					</table>
					<hr>
					
					<div class="search">
						<select name="searchType">
					      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="d"<c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>내용</option>
					      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					      <option value="p"<c:out value="${scri.searchType == 'p' ? 'selected' : ''}"/>>모임장소</option>
					      <option value="td"<c:out value="${scri.searchType eq 'td' ? 'selected' : ''}"/>>제목+내용</option>
					    </select>
					
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					    <button id="searchBtn" type="button">검색</button>
					</div>
					
					<br>
					<div>
						<ul>
						    <c:if test="${pageMaker.prev}">
						    	<li><a href="listTogether${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li><a href="listTogether${pageMaker.makeSearch(idx)}">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li><a href="listTogether${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						    </c:if> 
						</ul>
					</div>
				</form>
			</section>
		</div>
	</body>
</html>