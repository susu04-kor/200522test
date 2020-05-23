package com.example.demo.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//클라이언트 ip를 받아오기 위한 메소드를 정의한 클래스
public class CommonUtil {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CommonUtil.class);
	
	public static String getClientIP(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");
	    LOGGER.info("> X-FORWARDED-FOR : " + ip);

	    if (ip == null) {
	        ip = request.getHeader("Proxy-Client-IP");
	        LOGGER.info("> Proxy-Client-IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	        LOGGER.info(">  WL-Proxy-Client-IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	        LOGGER.info("> HTTP_CLIENT_IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	        LOGGER.info("> HTTP_X_FORWARDED_FOR : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getRemoteAddr();
	        LOGGER.info("> getRemoteAddr : "+ip);
	    }
	    LOGGER.info("> Result : IP Address : "+ip);

	    return ip;
	}
	
	//Show View -> Other -> Other -> Boot Dashboard 켜서 내가 사용 중인 프로젝트 마우스 우클릭 
	// -> open config -> argument 클릭 -> -Djava.net.preferIPv4Stack=true로 설정해주기 
	//(안 그러면 0:0:0:0:0:1 이런 식이 됨)
	
}
