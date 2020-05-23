	package com.example.demo.security.handlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.example.demo.service.SecurityService;
import com.example.demo.util.CommonUtil;
import com.example.demo.vo.LoginLogVo;

//로그인 실패 핸들러
//로그 혹은 비밀번호가 틀렸을 때, 아이디가 없을 때

@Component
public class AuthFailureHandler implements AuthenticationFailureHandler {

	@Autowired //혹은 @Inject	
	SecurityService securityService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AuthFailureHandler.class);
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		//String ip = request.getRemoteAddr();
		String ip = CommonUtil.getClientIP(request);
		LOGGER.info("==============로그인 실패==============");
		System.out.println("AuthFailureHandler작동");
		LoginLogVo loginLog = new LoginLogVo();
		String id = "";
		String msg = "";
		
		try {
			id = exception.getMessage();
			
			if(securityService.getSelectMemberInfo(id)!=null) { //바로 위에서 만든 id (user_id 컬럼 아님)
				loginLog.setLoginIp(ip);
				loginLog.setUser_id(id);	//바로 위에서 만든 id (user_id 컬럼 아님)
//				loginLog.setStatus("FAILED");
				securityService.setInsertLoginLog(loginLog);   //  오류! 원인 분석 필요!!! (근데 securityService에 이 메소드가 없음)
				//근데 loginLogVo 자체도 vo에는 user_id나 status도 없는데 넣어도 되나...? 어떻게 set이 되는 거지?
				//테이블 때문인가? (mapper?) 근데 테이블도 사실상 존재하지 않음... 향후 문제 발생 가능성 있음
				//vo에는 date를 받아오게 해놨는데 date 안 넣어줘도 되나?
				msg="비밀번호가 틀렸습니다.";
			}else {
				msg = "아이디가 없습니다.";
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("/login?msg="+msg);	//나중에 이 경로 이름 바꾸자 login
		
		
	}

}
