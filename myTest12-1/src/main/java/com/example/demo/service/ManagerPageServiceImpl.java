package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ManagerPageDao;
import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.Aop_LogVo;
import com.example.demo.vo.ChartVo;
import com.example.demo.vo.MemberInfoVo;

//민아) 5/19, 관리자페이지
@Service
public class ManagerPageServiceImpl implements ManagerPageService {

	@Autowired
	private ManagerPageDao mDao;
	
	// 로그 차트 
	@Override
	public List<ChartVo> chartLog() {
		return mDao.chartLog();
	}
	
	// 로그 기록(등록)
	@Override
	public int insertLog(Aop_LogVo al) {
		return mDao.insertLog(al);
	}

	// 로그 목록
	@Override
	public List<Aop_LogVo> listLog(Criteria cri) {
		return mDao.listLog(cri);
	}
	
	// 로그 총 개수
	@Override
	public int countLog(Criteria cri) {
		return mDao.countLog(cri);
	}

	// 회원목록
	@Override
	public List<MemberInfoVo> listMember(SearchCriteria scri) {
		return mDao.listMember(scri);
	}

	// 총 회원 수
	@Override
	public int countMember(SearchCriteria scri) {
		return mDao.countMember(scri);
	}

	// 회원정보 상세보기
	@Override
	public MemberInfoVo getMember(MemberInfoVo m) {
		return mDao.getMember(m);
	}

	// 회원삭제(강퇴)
	@Override
	public int deleteMember(MemberInfoVo m) {
		return mDao.deleteMember(m);
	}




}
