<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지- 로그기록</title>
<!-- 민아) 5/19, 관리자페이지 하는중  -->
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}	<!--페이징 가로정렬 스타일 -->
	#wrapper{display:flex;}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	//구글 차트 api 로딩 메소드 
	google.charts.load('current', {'packages' : [ 'corechart' ]});	// 원형 차트
	google.charts.load('current', {'packages':['table']});			// 테이블 차트

	//로딩되면 차트 그리는 메소드 
	google.charts.setOnLoadCallback(drawChart);

	var list; //전역변수로 둠 , 통신하고나서도 사용해야하니까! 
	$.ajax({
			type:"GET",
			contentType:"application/json; charset=utf-8",
			dataType : "JSON",
			url : "/management/chartLog",
			success:function(re) {	

				// 여기가 문제였음! parseJSON을 해줘야함. 전에 dept 이런걸로 할때는 필요없었는데 뭐징...
				list = $.parseJSON(re);
				
			}})
	
	// 원형 차트, 테이블 차트 2개! 같은 데이터로 한페이지에 두개의 차트를 그림 
	 function drawChart() {

		// 실 데이터를 가진 데이터 테이블 객체를 반환 
        var data = new google.visualization.DataTable();

        data.addColumn('string', 'url');
		data.addColumn('number', 'count');
			
		// 반복문 돌면서 url, count를 구글차트data에 넣어줌 
		$.each(list, function(idx, item) {
			data.addRows([ [ item.url, item.count ],  //여기에 들어가는 값이 차트에 보여짐! 
			]);	
		})
			
		// 옵션 객체, title은 차트위에 제목처럼 뜨는 것( 원형 차트에만 적용되는 옵션 )
        var options = {
			'title' : '페이지 이용량 TOP10',
			'height' : 500,
			'width' : '50%',
        };

		// div영역에 차트를 그릴 수 있는 차트객체 반환
       	var circle = new google.visualization.PieChart(document.getElementById('chart_circle'));

        // 데이터와 옵션객체를 전달하여 차트 그림
        circle.draw(data, options);

    	// 테이블 차트
        var table = new google.visualization.Table(document.getElementById('chart_table'));
        table.draw(data, {showRowNumber: true, width: '65%', height: '500'});
      }

	// 차트 그린걸 반응형으로! (웹 창 크기에 따라 조절되도록!)
		$(window).resize(function(){
			drawChart();
        });
    
</script>
</head>
<body>

	<h1>로그관리</h1>
	<hr>
	<a href="/management/manager_main">관리자페이지 메인</a><br>
	<div id="wrapper" style="display:flex;">
	<div id="chart_circle" style="width:55%; height:500px; "></div>
	<div id="chart_table" style="width:45%; height:500px; "></div>
	</div>
	<hr>
	
	
	<table border="1" width="84.4%">
		<thead>
			<tr>
				<th>로그번호</th>
				<th>url</th>
				<th>ip</th>
				<th>시간</th>
				<th>아이디</th>
			</tr>
		</thead>
											
		<tbody>
		<c:forEach var="logg" items="${listLog }">
			<tr>
				<td><c:out value="${logg.log_num }"/></td>
				<td><c:out value="${logg.url }"/></td>
				<td><c:out value="${logg.ip }"/></td>
				<td>
				<c:out value="${logg.time }"/>
				</td>
				<td><c:out value="${logg.user_id }"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<hr>
	<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="listLog${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="listLog${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="listLog${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
</body>
</html>