package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 민아) 5/19, log 남기기 작업중 
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Aop_LogVo {
	private int log_num;
	private String url;
	private String ip;
	private String time;
	private String user_id;
	
}
