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
	// 아임포트 깃 허브
	// https://github.com/iamport/iamport-manual/blob/master/%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/README.md

	var IMP = window.IMP; 		// 생략가능
	IMP.init('imp32514763');   // 내정보에 있는 "가맹점 식별코드"를 사용
	var msg;
	var info = [];

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


 /*
	pay_method/String/결제수단			merchant_uid/String/고유주문번호
	name/String/주문명(16자이내)		amount/int/결제할금액 
	buyer_name/string/주문자명			buyer_tel/string/주문자 연락처
	buyer_email/string/주문자 Email		buyer_addr/string/주문자 주소
 */
			
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

				/*	rsp 속성 중 
				pay_method/string/결제수단	card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
				paid_amount/number/결제금액	실제 결제승인된 금액이나 가상계좌 입금예정 금액
				status/string/결제상태	ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패)
				name/string/주문명	
				buyer_name/string/주문자 이름	
				paid_at/number/결제승인시각	UNIX timestamp
				apply_num/string/카드사 승인번호	신용카드결제에 한하여 제공
				*/
	
			var payInfo = {
					imp_uid : rsp.imp_uid,
					merchant_uid : rsp.merchant_uid,
	                paid_amount : rsp.paid_amount,
	                pay_method : rsp.pay_method,
	                apply_num : rsp.apply_num,
	                //paid_time : rsp.paid_at,
	                status : rsp.status,
	                rsv_no : 1,
	                user_id : rsp.buyer_name  
				}
				info.push(payInfo);
				
			    if ( rsp.success ) {// 결제가 성공되었다면
    	            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;

			        var insertPay = $("#asd").serialize();

					console.log(JSON.stringify(info));
					
					$.ajax({
						type : "POST",
						url : "/payments/insertPay",
						dataType : "JSON",
	    	            contentType:"application/json; charset=utf-8",
	    	            data : JSON.stringify(info),
						success : function(ww){
							console.log(ww);
							alert("결제정보 저장했음")
						}
					})
			        //성공시 이동할 페이지
    	           location.href='http://localhost:8088/MainPage';
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
	
		<input type="text" id="status" name="status"  />
		<input type="text" id="rsv_no" name="rsv_no"  />
		<input type="text" id="user_id" name="user_id"  />
		<input type="submit" value="액션 테스트용 버튼">
	</form>

</body>
</html>