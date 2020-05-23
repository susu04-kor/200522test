package com.example.demo.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.LoginMapperDao;
import com.example.demo.vo.LoginLogVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.MemberInfoVo2;


@Service
public class UserServiceImpl implements SecurityService {

	@Autowired
	LoginMapperDao loginMapperDao;
	
	
	//user 정보를 읽을 때 사용
	//user를 읽어왔으면 권한을 부여
	//회원가입할 때 권한은 string으로 저장해야 합니다
	//권한은 MyBatis를 통해 String을 가져왔으므로 
	//GrantedAuthority 인터페이스에 맞게 SimpleGrantedAuthority로 변환해서 
	//MemberInfoVo에 있는 authorities에 setter를 합니다
	//그러면 로그인한 유저에게 권한이 부여됩니다
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
MemberInfoVo memberInfo = loginMapperDao.getSelectMemberInfo(username); 
	    
		System.out.println(username+"........loadUserByUsername");
		System.out.println("memberInfoVo===>"+memberInfo);
	
		if(memberInfo==null) {	//throw = 예외 강제 발생 메소드
			throw new UsernameNotFoundException(username);
		}
		
		MemberInfoVo2 member2 = new MemberInfoVo2(memberInfo);

//		member2.getAuthorities();
		
		System.out.println(member2);
		return member2;
		
		/*		
		if(memberInfo==null) {	//throw = 예외 강제 발생 메소드
			throw new UsernameNotFoundException(user_id);
		}
		
		//객체 생성해서 반환하기 
		return User.builder()
				.username(user_id)		//username은 이렇게 할게요
				.password(memberInfo.getPwd())	//비밀번호는 이렇게 받을게요
				.roles(memberInfo.getUser_role())	//권한은 이렇게 할게요
				.build();				//생성합니다
		 */	
	}

	//회원정보 전체 조회
	@Override
	public MemberInfoVo getSelectMemberInfo(String user_id) throws Exception {
		return loginMapperDao.getSelectMemberInfo(user_id);
	}
	//회원가입
	@Override
	public int setInsertMemberInfo(MemberInfoVo memberInfo) throws Exception {
		return loginMapperDao.setInsertMemberInfo(memberInfo);
	}

	@Override
	public int setInsertLoginLog(LoginLogVo loginLog) throws Exception {
		return loginMapperDao.setInsertLoginLog(loginLog);
	}
	//아이디 중복 확인
	@Override
	public int idCheck(String user_id) throws Exception {
		return loginMapperDao.idCheck(user_id);
	}
	//닉네임 중복 확인
	@Override
	public int nickCheck(String nick_name) throws Exception {
		return loginMapperDao.nickCheck(nick_name);
	}
	//회원수정
	@Override
	public int memberUpdate(MemberInfoVo memberInfo) throws Exception {
		return loginMapperDao.memberUpdate(memberInfo);
	}

	

}
