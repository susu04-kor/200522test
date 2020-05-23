package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.PaymentDao;
import com.example.demo.vo.PaymentVo;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentDao p_dao;
	
	// 결제정보 등록
	@Override
	public int insertPay(PaymentVo p) {
		int re = p_dao.insertPay(p);
		return re;
	}

}
