package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ApplicationDao;
import com.example.demo.dao.TogetherDao;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.ApplicationVo;
import com.example.demo.vo.TogetherVo;

@Service
public class ApplicationServiceImpl implements ApplicationService {
	
	@Autowired
	private ApplicationDao Adao;
	
	@Autowired
	private TogetherDao tDao;
	
	@Override
	public int insertApplication(ApplicationVo av) {
		int re = 0;
		
		int re_application = Adao.insertApplication(av);
		int re_together = tDao.upcntApplication(av.getT_num());
		
		if(re_application > 0 && re_together > 0) {
			re = 1;
		}
		return re;
	}
	
	@Override
	public int deleteApplication(ApplicationVo av) {
		int re = 0;
		
		int re_application = Adao.deleteApplication(av);
		int re_together = tDao.upcntApplication(av.getT_num());
		
		if (re_application > 0 && re_together > 0) {
			re = 1;
		}
		return re;
	}
	
	@Override
	public int checkApplication(ApplicationVo av) {
		int re = 0;
		if(Adao.checkApplication(av) > 0) {
			re = 1;
		}
		return re;
	}
	
	//신청자 목록
	@Override
	public List<ApplicationVo> userApplication(int t_num) throws Exception{
		return Adao.userApplication(t_num);
	}
}
