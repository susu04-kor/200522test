package com.example.demo.security.handlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

//	HttpServletRequest 객체: 웹에서 넘어온 Request 값을 가지고 있는 객체
//	HttpServletResponse 객체: 출력을 정의할 수 있는 객체
//	Authentication 객체: 인증에 성공한 사용자의 정보를 가지고 있는 객체

	private String loginidname;
//	private String defaultUrl="/";
    private String defaultUrl="/MainPage";
    
    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
    	
    	HttpSession session = request.getSession();	
    	resultRedirectStrategy(request, response, authentication);
    	clearAuthenticationAttributes(request);
    	session.setAttribute("user", authentication); 

    }
	
    //에러 세션을 지우는 메서드
    private void clearAuthenticationAttributes(HttpServletRequest request) {
    	        HttpSession session = request.getSession(false);
    	        if(session==null) return;
    	        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		
	}

	private void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
            SavedRequest savedRequest = requestCache.getRequest(request, response);
	       
	        
           if(savedRequest!=null) {
               String targetUrl = savedRequest.getRedirectUrl(); //savedRequest객체를 통해 getRedirectUrl(로그인 전의 url)을 가져와요
               redirectStratgy.sendRedirect(request, response, targetUrl);
               System.out.println("이전 페이지로 돌아가요");
           } else {
               redirectStratgy.sendRedirect(request, response, defaultUrl);
               System.out.println("디폴트 페이지로 가요");
           }
	}

	public String getLoginidname() {
        return loginidname;
    }
 
    public void setLoginidname(String loginidname) {
        this.loginidname = loginidname;
    }


	public String getDefaultUrl() {
        return defaultUrl;
    }
 
    public void setDefaultUrl(String defaultUrl) {
        this.defaultUrl = defaultUrl;
    }

}
