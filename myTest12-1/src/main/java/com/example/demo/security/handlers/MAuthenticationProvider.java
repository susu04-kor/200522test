package com.example.demo.security.handlers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.example.demo.dao.LoginMapperDao;
import com.example.demo.service.SecurityService;
import com.example.demo.vo.MemberInfoVo;

@Component
public class MAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    LoginMapperDao loginMapper;
    
    @Autowired
    PasswordEncoder pwdEncoder;
	
  @Override	//authenticationManager
  public Authentication authenticate(Authentication authentication) throws AuthenticationException { 
    UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication; 
    //유저가 입력한 정보를 이이디, 비번으로 만듭니다.(로그인한 유저아이디 비번정보를 담습니다)

        String id = authentication.getName();
        
        MemberInfoVo user = loginMapper.getSelectMemberInfo(id);
        // 유저 없는경우 
        if (null == user) {
           // return null;
        	throw new BadCredentialsException("존재하지 않는 아이디입니다.");
        }
        // 비번 불일치
        if (!pwdEncoder.matches(authentication.getCredentials().toString(), user.getPassword())) {
            throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
        }
        
        List<GrantedAuthority> grantedAuthorityList = new ArrayList<>();
        
        grantedAuthorityList.add(new SimpleGrantedAuthority(user.getUser_role()));         
 
        // 로그인 성공시 로그인 사용자 정보 반환
        return new UsernamePasswordAuthenticationToken(user, null, grantedAuthorityList);
    }
    
    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }


}
