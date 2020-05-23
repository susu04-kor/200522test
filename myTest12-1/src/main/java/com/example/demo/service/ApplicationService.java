package com.example.demo.service;

import java.util.List;

import com.example.demo.vo.ApplicationVo;

//신청하기 기능
public interface ApplicationService {
	int insertApplication(ApplicationVo av);
	
	int deleteApplication(ApplicationVo av);
	
	int checkApplication(ApplicationVo av);
	
	//신청자 목록
	public List<ApplicationVo> userApplication(int t_num) throws Exception;
}
