<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(function(){
	 var IMP = window.IMP; 		// 생략가능
	 IMP.init('imp32514763');   // 내정보에 있는 "가맹점 식별코드"를 사용
	 var msg;

	 $("#okay").click(function(){
			var imp_uid = $("#imp_uid").val();
			var merchant_uid = $("#merchant_uid").val();
			var paid_amount = $("#paid_amount").val();
			var pay_method = $("#pay_method").val();
			var apply_num = $("#apply_num").val();
			var paid_time = $("#paid_time").val();
			var status = $("#status").val();
			var rsv_no = $("#rsv_no").val();
			var user_id = $("#user_id").val();

			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 100,
			    buyer_email : 'acs@petwego.kr',
			    buyer_name : 'user1',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울시 서대문구'
				    
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;

			        var insertPay = $("#asd").serialize();
// 					console.log(insertPay);
// 					$.ajax("/payments/insertPay",{data:insertPay,success:function(re){
// 							alert(re);
// 						}});
					
					$.ajax({
						type : "POST",
						url : "/payments/insertPay",
						dataType : "JSON",
	    	            contentType:"application/json; charset=utf-8",
						data : {
							imp_uid : rsp.imp_uid,
							merchant_uid : rsp.merchant_uid,
    	                    paid_amount : rsp.paid_amount,
    	                    pay_method : rsp.pay_method,
    	                   	apply_num : rsp.apply_num,
    	                    paid_time : rsp.paid_time,
    	                    status : rsp.status,
    	                    rsv_no : 1,
    	                    user_id : rsp.buyer_name  
							},
						success : function(ww){
							console.log(ww);
							alert("결제정보 저장했음")
						}
					})
			        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }

// 			    alert(msg);
			});
	})
})
  

</script>
</head>
<body>
	<h1>결제 하시겠습니까?</h1>
	<button id='okay'>결제하기</button>
	
	<!-- 결제정보 전달을 위한 폼  -->
	<form action="/payments/insertPay" id="asd" method="post">
		<input type="text" id="imp_uid" name="imp_uid"  />
		<input type="text" id="merchant_uid" name="merchant_uid"  />
		<input type="text" id="paid_amount" name="paid_amount"  />
		<input type="text" id="pay_method" name="pay_method"  />
		<input type="text" id="apply_num" name="apply_num"  />
		<input type="text" id="paid_time" name="paid_time"  />
		<input type="text" id="status" name="status"  />
		<input type="text" id="rsv_no" name="rsv_no"  />
		<input type="text" id="user_id" name="user_id"  />
		<input type="submit" value="액션 테스트용 버튼">
	</form>

</body>
</html>