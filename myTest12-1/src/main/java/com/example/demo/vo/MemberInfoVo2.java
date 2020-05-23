package com.example.demo.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


public class MemberInfoVo2 implements UserDetails {	//User를 확장

	
	private static final long serialVersionUID = 1L;
	
	private MemberInfoVo member1;

	public MemberInfoVo2(MemberInfoVo member1) {
		this.member1 = member1;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(member1.getUser_role()));
		return authorities;
	}

	//유저 비밀번호
	@Override
	public String getPassword() {
		return member1.getPwd();
	}

	@Override
	public String getUsername() {
		return member1.getUser_id();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}


	
	
}
