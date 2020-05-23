package com.example.demo.service;
//영수) 5월12일 QnA서비스임플리먼츠
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.QnADao;
import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.QnAUpdateVo;
import com.example.demo.vo.QnAVo;

@Service
public class QnAServiceImpl implements QnAService {
	
	@Autowired
	private QnADao dao;
	
	//모든 qna리스트
	@Override
	public List<QnAVo> allQnAList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		List<QnAVo> list = dao.allQnAList(scri);
		return list;
	}
	
	//qna등록
	@Override
	public int insertQnA(QnAVo q) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.insertQnA(q);
		return re;
	}
	
	//qna상세보기
	@Override
	public QnAVo detailQnA(QnAVo q) {
		// TODO Auto-generated method stub
		QnAVo d = dao.detailQnA(q);
		return d;
	}
	
	//qna삭제
	@Override
	public int deleteQnA(QnAVo q) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.deleteQnA(q);
		return re;
	}
	
	//답변등록
	@Override
	public int insertRe(QnAVo q) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.insertRe(q);
		return re;
	}
	
	//마지막 글번호
	@Override
	public Integer lastNo() {
		// TODO Auto-generated method stub
		int re = -1;
		if(dao.lastNo() != null) {
			re = dao.lastNo();
		}
		return re;
	}
	
	//qna 전체글 수
	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.listCount(scri);
		return re;
	}
	
	//qna 수정
	@Override
	public int updateQnA(QnAUpdateVo qu) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.updateQnA(qu);
		return re;
	}
	
	//답변있는 글은 삭제 못하게
	@Override
	public int no_delete(QnAVo q) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.no_delete(q);
		return re;
	}
	
	//파일 이름
	@Override
	public List<QnAVo> fime_name() {
		// TODO Auto-generated method stub
		List<QnAVo> list = dao.fime_name();
		return list;
	}
	
	
}
