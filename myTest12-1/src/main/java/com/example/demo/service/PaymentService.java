package com.example.demo.service;

import com.example.demo.vo.PaymentVo;

public interface PaymentService {

	// 결제정보 등록
	int insertPay(PaymentVo p);
}
