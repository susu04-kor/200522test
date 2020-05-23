package com.example.demo.vo;

import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberInfoVo2 implements UserDetails {	//User를 확장

	
	private static final long serialVersionUID = 1L;
	
	private String user_id;
	private String pwd;
	private String tel;
	private Date birth;
	private String name;
	private String address;
	private String gender;
	private String fname;
	private String intro;
	private Date info_create_date;
	private Date info_update_date;
	private String nick_name;
	private String user_role;
	private String status;
	private String email;
	
	//UserDetails 기본 상속 변수
//	private Collection<? extends GrantedAuthority> authorities;	
//    private boolean isEnabled = true;
//    private String username;
//    private boolean isCredentialsNonExpired = true;
//    private boolean isAccountNonExpired = true;
//    private boolean isAccountNonLocked = true;
	
    
    
    
    
//    public Collection<? extends GrantedAuthority> authorities() { // 유저가 갖고 있는 권한 목록
//		// TODO Auto-generated method stub
//		return null;
//	}
    
    
	
	@Override
	public String getUsername() {	// 유저 이름 혹은 아이디
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean isAccountNonExpired() {	// 유저 아이디가 만료 되었는지
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {	// 유저 아이디가 Lock 걸렸는지
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {	//비밀번호가 만료 되었는지
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {	// 계정이 활성화 되었는지
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	
	

	

	
	
}
