package com.example.demo.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.example.demo.vo.LoginLogVo;
import com.example.demo.vo.MemberInfoVo;
public interface SecurityService extends UserDetailsService {
	
	
	
	//시큐리티 사용자 인증
	UserDetails loadUserByUsername(String user_id);
	
	//회원정보 전체 조회
	MemberInfoVo getSelectMemberInfo(String user_id) throws Exception;
	//회원가입
	public int setInsertMemberInfo(MemberInfoVo memberInfo) throws Exception;
	//로그 기록 ----------넣는 게 맞나? AuthSuccessHandler, AuthFailureHandler에 쓰임
	public int setInsertLoginLog(LoginLogVo loginLog) throws Exception;
	//중복 아이디 체크
	int idCheck(String user_id) throws Exception;
	//중복 닉네임 체크
	int nickCheck(String nick_name) throws Exception;
	//비밀번호 확인
	int passCheck(MemberInfoVo memberInfo) throws Exception;
	//회원정보 수정
	public int update_myinfo(MemberInfoVo memberInfo) throws Exception;
	
	
	
}
