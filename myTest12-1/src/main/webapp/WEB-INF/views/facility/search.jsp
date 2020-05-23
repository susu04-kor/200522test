<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETWeGO | 숙소 | 검색결과</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#typeSelect').change(function(){
		var display = $('#typeSelect option:selected').text();
		//$('#keywordInput').val(display);
		self.location='search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent(display);
	});

	$('#areaSelect').change(function(){
		var display = $('#areaSelect option:selected').text();
		//$('#keywordInput').val(display);
		self.location='search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent(display);
	});

  	$('#searchBtn').click(function() {
		self.location = 'search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent($('#keywordInput').val());
    });
/* 	var sort = 'asc';
    $('#sortBtn').click(function(){
        if(sort == 'asc'){
			sort = 'desc';
			$(this).html('높은 요금순');
        }else{
            sort = 'asc';
            $(this).html('낮은 요금순');
        }
    	self.location='search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent(display)+'&sort='+sort;
    }); */
	
});
</script>
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}
</style>
</head>
		<div id="root">
			<header>
				<h1>숙소 리스트</h1>
			</header>

			<h5>총 ${pageMaker.getTotalCount()}개의 애견펜션이 검색되었습니다.</h5>
			<%-- <button id="sortBtn">${sortString}</button>  --%>
			<section id="container">
				<form role="form" method="get">
					<table width="100%">
						<tr>
							<th>이미지</th>
							<th>숙소이름</th>
							<th>소개</th>
							<th>주소</th>
							<th>최저가</th>
							<th>연락처</th>
							<th>편의시설</th>
						</tr>
						<c:forEach var="c" items="${listFacility}">
							<tr>
								<td><img src="${c.f_pic}"></td>
								<td><a href="detail?facility_no=${c.facility_no}">${c.facility_name}</a>
								</td>
								<td>${c.f_intro}</td>				
								<td>${c.facility_addr}</td>
								<td>${c.f_minprice}</td>
								<td>${c.f_phone}</td>	
								<td>${c.f_feature}</td>	
							</tr>
						</c:forEach>
					</table>
					<hr>
					
					<div class="search">
						  <!-- 	<input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
  							<label for="vehicle1">대형견</label><br>
  							<input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
  							<label for="vehicle2">소형견</label><br>
  							<input type="checkbox" id="vehicle3" name="vehicle3" value="Boat">
  							<label for="vehicle3">애견동반</label><br><br> -->
						<select id="areaSelect">
							<option value="" selected disabled>지역명</option>
							<option value="1">경기</option>
							<option value="2">강원</option>
							<option value="3">제주</option>
							<option value="4">충남</option>
							<option value="5">충북</option>
							<option value="6">경남</option>
							<option value="7">경북</option>
							<option value="8">전남</option>
							<option value="9">전북</option>							
						</select>	
						<select id="typeSelect">
							<option value="" selected disabled>숙소유형</option>
							<option value="1">복층</option>
							<option value="2">독채</option>
							<option value="3">풀빌라</option>
							<option value="4">온돌</option>
							<option value="5">글램핑</option>
							<option value="6">한옥</option>
							<option value="7">캠핑</option>
							<option value="8">도미토리</option>
						</select>
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />
					  	
					    <button id="searchBtn" type="button">검색</button>
					</div>
					
					<br>
					<div>
						<ul>
						    <c:if test="${pageMaker.prev}">
						    	<li><a href="listFacility${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li><a href="listFacility${pageMaker.makeSearch(idx)}">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li><a href="listFacility${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						    </c:if> 
						</ul>
					</div>
				</form>
			</section>
		</div>
	</body>
</html>