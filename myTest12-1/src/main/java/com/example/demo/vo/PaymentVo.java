package com.example.demo.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 민아) 5/22, 결제 서비스 하는중 
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PaymentVo {
	private String imp_uid; 		// 고유결제번호
	private String merchant_uid; 	// 상점거래id
	private int paid_amount;		// 결제금액
	private String pay_method; 		// 결제수단
	private String apply_num; 		// 카드승인번호
	private Date paid_time; 		// 결제승인시각
	private String status;			// 결제상태
	private int rsv_no; 			// 예약번호
	private String user_id; 		// 아이디
	
	private List<PaymentVo> listPay;
}
