package com.example.demo.dao;

import com.example.demo.vo.PaymentVo;

public interface PaymentDao {
	
	// 결제정보 등록 
	int insertPay(PaymentVo p);
}
