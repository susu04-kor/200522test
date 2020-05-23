package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.MemberInfoVo;

//import com.example.demo.util.AopLog.NoLogging;

//민아) 5/19, 메인페이지 @NoLogging 처리 
@RestController
public class MainController {
	
	//사이트 메인페이지
	@NoLogging
	@RequestMapping("/MainPage")
	public static ModelAndView mainPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main");
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
	         Authentication authentication = (Authentication) session.getAttribute("user");
	         MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
	         WebAuthenticationDetails details = (WebAuthenticationDetails) authentication.getDetails();
	         System.out.println(details.getSessionId() + "\t" + details.getRemoteAddress());
	         System.out.println(user.getUser_id());
	      }
		
		return mav;
	}
}
