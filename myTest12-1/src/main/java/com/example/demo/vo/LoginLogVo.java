package com.example.demo.vo;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


//로그인 기록을 남기기 위한 로그용 vo

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginLogVo extends MemberInfoVo {
	
	private String loginIp;
	private String loginDate;
	

		
}
