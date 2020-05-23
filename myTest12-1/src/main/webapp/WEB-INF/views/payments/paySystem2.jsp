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
			var merchant_uid = $("#imp_uid").val() ;
			var paid_amount = $("#imp_uid").val();
			var pay_method = $("#imp_uid").val();
			var apply_num = $("#imp_uid").val();
			var paid_time = $("#imp_uid").val();
			var status = $("#imp_uid").val();
			var rsv_no = $("#imp_uid").val();
			var user_id = $("#imp_uid").val();
			



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
    	        name : 'Pet We Go',					
    	        amount : 100,		// 테스트 최소가능금액이 100원임 
    	        buyer_email : 'abc@petwego.com',
    	        buyer_name : 'user1',
    	        buyer_tel : '010-0001-1000',
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

    	        if ( rsp.success ) {	// 결제가 성공되었다면
    	            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	            
    	              
    	               	            
    	            jQuery.ajax({
    	                url: "/payments/insertPay", //cross-domain error가 발생하지 않도록 주의해주세요
    	                type : "POST",
    	                dataType : "JSON",
    	                contentType:"application/json; charset=utf-8",
    	                data: {
    	                	//기타 필요한 데이터가 있으면 추가 전달
    	                    imp_uid : rsp.imp_uid,
    	                    merchant_uid : rsp.merchant_uid,
    	                    paid_amount : rsp.paid_amount,
    	                    pay_method : rsp.pay_method,
    	                   // apply_num : rsp.apply_num,
    	                    paid_time : rsp.paid_at,
    	                    status : rsp.status,
    	                    rsv_no : 1,
    	                    user_id : rsp.buyer_name   
    	                }
    	           
    	            }).done(function(data) {
    	            	 alert("결제테이블 등록성공");
						console.log(data);
    	            	
    	                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    	                if ( everythings_fine ) {


  	    	            $.ajax({data : JSON.stringify(data),
    	                		dataType : "JSON",	
								type : "POST",
								url : "/payments/insertPay",
								contentType:"application/json; charset=utf-8",
    	                		success:function(a){
									console.log(a);
   	         						alert("결제테이블 등록성공");
    	        			}});


	        			
    	                    msg = '결제가 완료되었습니다.';
    	                    msg += '\n고유ID : ' + rsp.imp_uid;
    	                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    	                    msg += '\결제 금액 : ' + rsp.paid_amount;
    	                    msg += '카드 승인번호 : ' + rsp.apply_num;
    	                    
    	                    alert(msg);
    	                } else {
    	                    //[3] 아직 제대로 결제가 되지 않았습니다.
    	                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    	                }
    	            });
    	            //성공시 이동할 페이지
    	            //location.href='http://localhost:8088/payments/okayPay';
    	        } 
    	    });
     })  
   
    
});

</script>
</head>
<body>
	<h1>결제 하시겠습니까?</h1>
	<button id='okay'>결제하기</button>
	
	<!-- 결제정보 전달을 위한 폼  -->
	<form id="asd">
		<input type="hidden" id="imp_uid" name="imp_uid"  />
		<input type="hidden" id="merchant_uid" name="merchant_uid"  />
		<input type="hidden" id="paid_amount" name="paid_amount"  />
		<input type="hidden" id="pay_method" name="pay_method"  />
		<input type="hidden" id="apply_num" name="apply_num"  />
		<input type="hidden" id="paid_time" name="paid_time"  />
		<input type="hidden" id="status" name="status"  />
		<input type="hidden" id="rsv_no" name="rsv_no"  />
		<input type="hidden" id="user_id" name="user_id"  />
	</form>

</body>
</html>