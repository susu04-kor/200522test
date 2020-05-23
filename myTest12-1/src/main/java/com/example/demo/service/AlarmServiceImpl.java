package com.example.demo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.AlarmDao;
import com.example.demo.vo.AlarmVo;
import com.example.demo.vo.ApplicationVo;

@Service
public class AlarmServiceImpl implements AlarmService {

	@Autowired
	AlarmDao AlarmDao;
	
	//함께가요 신청 알림 등록
	@Override
	public int insert_together_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		int re= -1;
		re = AlarmDao.insert_together_alarm(a);
		return re;
	}
	
	//함께가요 취소 알림 등록
	@Override
	public int cancle_insert_together_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = AlarmDao.cancle_insert_together_alarm(a);
		return re;
	}
	
	//함께가요 신청 번호 조회ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
	@Override
	public Integer together_no(ApplicationVo a) {
		// TODO Auto-generated method stub
		Integer re = -1;
		re = AlarmDao.together_no(a);
		return re;
	}

	////함께가요 삭제 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
	@Override
	public Integer delete_application(ApplicationVo a) {
		// TODO Auto-generated method stub
		Integer re = -1;
		re = AlarmDao.delete_application(a);
		return re;
	}
	
	
	//신청알림 있는지 조회
	@Override
	public List<AlarmVo> search_insert_together_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		List<AlarmVo> alarm = AlarmDao.search_insert_together_alarm(a);
		return alarm;
	}

	//취소알림  있는지 조회
	@Override
	public List<AlarmVo> search_cancle_together_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		List<AlarmVo> alarm = AlarmDao.search_cancle_together_alarm(a);
		return alarm;
	}
	
	//등록 알람수
	@Override
	public int search_insert_together_count(AlarmVo a) {
		// TODO Auto-generated method stub
		Integer re = -1;
		re = AlarmDao.search_insert_together_count(a);
		return re;
	}

	//취소 알람수
	@Override
	public int search_cancle_together_count(AlarmVo a) {
		// TODO Auto-generated method stub
		Integer re = -1;
		re = AlarmDao.search_cancle_together_count(a);
		return re;
	}
	
	//신청 알람 확인
	@Override
	public int check_alarm_in(AlarmVo a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = AlarmDao.check_alarm_in(a);
		return re;
	}

	//취소 알람 확인
	@Override
	public int check_alarm_cancle(AlarmVo a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = AlarmDao.check_alarm_cancle(a);
		return re;
	}
	
	//알람 삭제
	@Override
	public int delete_together_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		int re= -1;
		re = AlarmDao.delete_together_alarm(a);
		return re;
	}

	//자유게시판 댓글 등록 알람 등록
	@Override
	public int insert_board_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = AlarmDao.insert_board_alarm(a);
		return re;
	}

	//자유게시판 댓글 삭제 알람 등록
	@Override
	public int cancle_insert_board_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = AlarmDao.cancle_insert_board_alarm(a);
		return re;
	}

	//자유게시판 댓글 등록 알람 조회
	@Override
	public List<AlarmVo> search_insert_board_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		List<AlarmVo> list = AlarmDao.search_insert_board_alarm(a);
		return list;
	}

	//자유게시판 댓글 삭제 알람 조회
	@Override
	public List<AlarmVo> search_cancle_board_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		List<AlarmVo> list = AlarmDao.search_cancle_board_alarm(a);
		return list;
	}
	
	//자유게시판 댓글 등록 수
	@Override
	public int search_insert_board_alarm_count(AlarmVo a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = AlarmDao.search_insert_board_alarm_count(a);
		return re;
	}
	
	//자유게시판 댓글 취소 수
	@Override
	public int search_cancle_board_alarm_count(AlarmVo a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = AlarmDao.search_cancle_board_alarm_count(a);
		return re;
	}

	//자유게시판 알람 삭제
	@Override
	public int delete_board_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = AlarmDao.delete_board_alarm(a);
		return re;
	}

	//자유게시판 작성자가 상세보기로가면 댓글 등록된거 확인해서 알람 안가게 셋팅
	@Override
	public int chk_board_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = AlarmDao.chk_board_alarm(a);
		return re;
	}

	//함께가요 작성자가 상세보기하면 알람 확인해서 알람 안가게
	@Override
	public int chk_together_alarm(AlarmVo a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = AlarmDao.chk_together_alarm(a);
		return re;
	}
	


	
	
	

}
