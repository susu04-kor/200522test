//package com.example.demo.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.support.ResourceBundleMessageSource;
//
////오류메시지 설정을 위한 클래스
//@Configuration 
//public class MessageConfig { 
//	@Bean 
//	public ResourceBundleMessageSource messageSource() { 
//		System.out.println("messageconfig작동");
//		ResourceBundleMessageSource source = new ResourceBundleMessageSource(); 
//		/* message properties 위치 설정 */ 
//		source.setBasenames("messages/messages"); 
//		/* encoding 룰 설정 */ 
//		source.setDefaultEncoding("UTF-8"); 
//		/* 5초간 케싱*/ 
//		source.setCacheSeconds(5); 
//		// 없는 메세지일 경우 예외를 발생시키는 대신 코드를 기본 메세지로 한다.
//        source.setUseCodeAsDefaultMessage(true);
//
//		return source; 
//		} 
//	}


