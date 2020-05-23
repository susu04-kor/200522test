<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sns게시판</title>
<style type="text/css">
li{list-style:none; float:left; padding: 6px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function() {
	temp();
})

var temp = function(){
	var arr_file = ${file};
	var arr_board = ${board};
	$.each(arr_file,function(idx,data){
		var a = $('<a href="/pic_board/detail?photo_no=' + data.photo_no + '"></a>');
		var img = $("<img/>").attr({"src":"/img/"+data.photo_file_name,"photo_no":data.photo_no});
		a.append(img);
		$("#sns").append(a);
	});
}
</script>
</head>
<body>
<a href="/MainPage">메인화면</a>
<h2>sns리스트</h2>
<hr>
<div id="sns">

</div>
<a href="/pic_board/insertForm">sns 등록</a>

	<div>
  		<ul>
		    <c:if test="${pageMaker.prev}">
		    	<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
		    </c:if> 
		
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
		    </c:if> 
 		 </ul>
	</div>

</body>
</html>