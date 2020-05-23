package com.example.demo.config;



import java.io.IOException;
import java.util.EventListener;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.security.web.session.SessionManagementFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.WebUtils;

import com.example.demo.security.handlers.AuthFailureHandler;
import com.example.demo.security.handlers.LoginSuccessHandler;
import com.example.demo.security.handlers.MAuthenticationProvider;
import com.example.demo.service.SecurityService;

@Configuration
//스프링 시큐리티를 실행하는 클래스
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

//	@Autowired
//	AuthProvider authProvider;
	
	@Autowired
	MAuthenticationProvider authProvider;
	
//	@Autowired
//	PasswordEncoder passwordEncoder; //암호화작업1
	
	
	@Autowired
	SecurityService securityService; //암호화작업1

	 @Override
	    public void configure(WebSecurity web) {
	        web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/adminImg/**", "/summernote/**");
	        web.ignoring()
	            .antMatchers(
	                "/messages/**"
	            );
	    }

	
	
	//권한 인증받기(로그인)
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authProvider);
	//	auth.eraseCredentials(false).userDetailsService(securityService).passwordEncoder(passwordEncoder); //권한 인증받기
	}

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {		
		
		http.authorizeRequests()	//큰 범위부터 작은 범위로!
			.antMatchers( "/", "/home/**"
                ,"/login/**", "/join/**", "/MainPage")	//  , "/admin/**"
			.permitAll()	//권한 (user, admin)부터 주면 회원가입 불가능 
			.antMatchers("/admin/**").hasAnyRole("ADMIN")	//주소 수정 필요 모두 /admin 이라 돼있어서 수정 필요
			.antMatchers("/user/**", "/mypage/**", "/comment/**", "/board/**",
					"/customerservice/**", "/pcomment/**", 
					"/pic_board/**", "/together/**").hasAnyRole("USER", "ADMIN") // /user/** 라는 이름의 URL은  USER의 권한을 가진 사용자만 접근 가능
			.anyRequest().authenticated();
//			.and()
//			.oauth2Login();	//sns 로그인을 위한 설정
//			.antMatchers().rememberMe();
		
//		http.csrf().disable();
		
		http.formLogin()
			.loginPage("/login/login").permitAll()	//로그인 페이지는 /, /login 에서 로그인을 실행하겠습니다 (새로운 로그인 페이지 호출을 설정) - 커스텀 로그인 페이지
			.usernameParameter("user_id")	//input name 파라미터로 user_id를 받아요
			.passwordParameter("pwd") //input name 파라미터로 "pwd"를 받아요
			.failureUrl("/login/login")	//로그인 실패시 이동하는 페이지
//			.failureHandler(new AuthFailureHandler())		//로그인 실패하면 수행하는 클래스
//			.successHandler(new AuthSuccessHandler());	//("/MainPage") //로그인 성공하면 수행하는 클래스
			.successHandler(new LoginSuccessHandler());	//로그인 성공하면 수행하는 클래스
//			.successHandler(new LoginSuccessHandlerAgain("/"));

		http.logout()
			.logoutRequestMatcher(new AntPathRequestMatcher("/login/logout"))	//logout 요청
			.logoutSuccessUrl("/MainPage") // 로그아웃하면 이 경로로 이동
			.invalidateHttpSession(true)	//세션을 초기화해요
			.deleteCookies("JSESSEIONID")	//쿠키제거
			.clearAuthentication(true)	//권한 정보 삭제
			.permitAll()
		.and().sessionManagement() 
			  .maximumSessions(1)	/* session 허용 갯수 */ 
			  .expiredUrl("/login/login")	/* session 만료시 이동 페이지*/ 
			  .maxSessionsPreventsLogin(false) // 기존 사용자 session 종료*/
			  .sessionRegistry(sessionRegistry()); //새로운 사용자 등록
			  
		http
		.exceptionHandling()
	    .accessDeniedPage("/error/error");	//403페이지를 처리하기 위한 에러 페이지 작성
//		.accessDeniedPage("/WEB-INF/views/error/403.jsp");
//		http.exceptionHandling().accessDeniedPage("/403");
		
		http.httpBasic();
	
		
//		super.configure(http);
	}



	//중복로그인 방지를 위한 설정
	private SessionRegistry sessionRegistry() {
		return new SessionRegistryImpl();
	}
	//중복로그인 방지를 위한 설정2
	@Bean
    public static ServletListenerRegistrationBean httpSessionEventPublisher() {
        return new ServletListenerRegistrationBean(new HttpSessionEventPublisher());
    }

	
	
	
}
