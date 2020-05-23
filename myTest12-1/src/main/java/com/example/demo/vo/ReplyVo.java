package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReplyVo {
	private int t_num;
	private int t_r_num;
	private String t_r_content;
	private String user_id;
	private Date regdate;
	private String secret_reply;
	
}
