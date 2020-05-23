package com.example.demo.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Data
@Setter
@Getter
public class MemberInfoVo extends User {

@Override
	public Collection<GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return super.getAuthorities();
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return super.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return super.getUsername();
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return super.isEnabled();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return super.isAccountNonExpired();
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return super.isAccountNonLocked();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return super.isCredentialsNonExpired();
	}

	@Override
	public void eraseCredentials() {
		// TODO Auto-generated method stub
		super.eraseCredentials();
	}

private static final long serialVersionUID = 1L;
	
	
	private String user_id;
	private String pwd;
	private String tel;
	private String birth;	//db엔 Date
	private String name;	
	private String address;
	private String gender;
	private String fname;
	private String intro;
	private String info_create_date;	//db엔 Date
	private String info_update_date;		//db엔 Date
	private String nick_name;
	private String user_role;
	private String email;
	private String pwd2;
	
	
	public MemberInfoVo(
			String user_id, String pwd, String tel, String birth, String name, String address, String gender,
			String fname, String intro, String info_create_date, String info_update_date, String nick_name,
			String user_role, String email, String pwd2) {
		super(user_id, pwd, new ArrayList<GrantedAuthority>());	//보낼 땐 ArrayList - UserServiceImpl에서 if(id=null) 구문에서 사용하기 위해 임시로 만들어주기 
		this.user_id = user_id;									//그냥 원래 생성자 모양대로 보내면 null 값으로 가게 됨
		this.pwd = pwd;
		this.tel = tel;
		this.birth = birth;
		this.name = name;
		this.address = address;
		this.gender = gender;
		this.fname = fname;
		this.intro = intro;
		this.info_create_date = info_create_date;
		this.info_update_date = info_update_date;
		this.nick_name = nick_name;
		this.user_role = user_role;
		this.email = email;
		this.pwd2 = pwd2;
	}

	public MemberInfoVo(
			String user_id, String pwd, String tel, String birth, String name, String address, String gender,
			String fname, String intro, String info_create_date, String info_update_date, String nick_name,
			String user_role, String email, String pwd2, List<GrantedAuthority> authorities) {	//받을 때는 List로 - UserServiceImpl에서 사용하기 위해!
		super(user_id, pwd, authorities);
		this.user_id = user_id;
		this.pwd = pwd;
		this.tel = tel;
		this.birth = birth;
		this.name = name;
		this.address = address;
		this.gender = gender;
		this.fname = fname;
		this.intro = intro;
		this.info_create_date = info_create_date;
		this.info_update_date = info_update_date;
		this.nick_name = nick_name;
		this.user_role = user_role;
		this.email = email;
		this.pwd2 = pwd2;
	}


	


	

	
	
	
	
}
