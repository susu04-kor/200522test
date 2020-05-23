<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 민아) 5/19, 관리자페이지_회원관리 -->
<meta charset="UTF-8">
<title>관리자페이지-회원목록</title>
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}	<!--페이징 가로정렬 스타일 -->
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<h1>회원관리</h1>
	<hr>
	<a href="/management/manager_main">관리자페이지 메인</a><br>
	<form action="/management/manager_member">
		<div class="search">
   			<select name="searchType">
		      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
		      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>아이디</option>
		      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>이름</option>
		      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>닉네임</option>
  		  </select>
		 <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
		 <button id="searchBtn" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location 
          	= "/management/manager_member" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val()
          	 + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
	</form>
	<table border="1" width="70%">
		<thead>
			<tr>
				<!-- 회원 권한이 추가되면 그 권한도 보이도록 수정할것 -->
				<th>아이디</th>
				<th>전화번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>가입일시</th>
				<th>정보수정일시</th>
			</tr>
		</thead>
											
		<tbody>
		<c:forEach var="member" items="${listMember }">
			<tr>
				<td><c:out value="${member.user_id }"/></td>
				<td><c:out value="${member.tel }"/></td>
				<td><a href="/management/manager_getMember?user_id=${member.user_id }"><c:out value="${member.name }"/></a></td>
				<td><c:out value="${member.nick_name }"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.info_create_date }"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.info_update_date }"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<hr>
	<div>
  		<ul>
		    <c:if test="${pageMaker.prev}">
		    	<li><a href="manager_member${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
		    </c:if> 
		
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<li><a href="manager_member${pageMaker.makeSearch(idx)}">${idx}</a></li>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    	<li><a href="manager_member${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		    </c:if> 
 		 </ul>
	</div>
</body>
</html>