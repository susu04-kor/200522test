package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Setter
@Getter
public class MemberInfoVo {

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
	
}