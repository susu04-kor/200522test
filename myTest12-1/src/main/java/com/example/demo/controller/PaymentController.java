package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.PaymentService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.Board_fileVo;
import com.example.demo.vo.PaymentVo;

@Controller
@RequestMapping("/payments/*")
public class PaymentController {

	@Autowired
	PaymentService pay_service;

	public void setPay_service(PaymentService pay_service) {
		this.pay_service = pay_service;
	}
	
	// 결제 창 
	@NoLogging
	@GetMapping(value = "/paySystem")
	public void paySystem() {
		
	}

	// 결제정보 등록
//	@NoLogging
//	@RequestMapping(value = "/insertPay")
//	public void insertForm(HttpServletRequest request,PaymentVo p) {
//		System.out.println("결제 폼 동작함");
//		
//	}
	
//	@RequestMapping(value = "/insertPay")
	@PostMapping(value = "/insertPay", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String insertSubmit(HttpServletRequest request, PaymentVo p, @RequestBody List<PaymentVo> listPay) {
		
		for (PaymentVo pv : listPay) {
			pay_service.insertPay(pv);
		}

		System.out.println(p);
		System.out.println(p.getImp_uid());
		System.out.println("결제컨트롤러 동작함");
		
		return "등록ok";
	}
	
	@NoLogging
	@GetMapping(value = "/okayPay")
	public String okay() {
		return "결제가 성공하였습니다.";
	}
	
//	@NoLogging
//	@RequestMapping("aaaaa")
//	public String aaaa(HttpServletRequest request, PaymentVo p) {
//		System.out.println("aaaaaaaaaaaaaaaaaaaa");
//		
//		return "등록";
//	}

}
