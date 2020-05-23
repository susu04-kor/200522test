package com.example.demo.dao;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.QnAUpdateVo;
import com.example.demo.vo.QnAVo;
//영수) 5월12일 QnADao
public interface QnADao {
	
	//모든 qna리스트
	public List<QnAVo> allQnAList(SearchCriteria scri);
	
	//qna등록
	public int insertQnA(QnAVo q);
	
	//qna상세보기
	public QnAVo detailQnA(QnAVo q);
	
	//qna삭제
	public int deleteQnA(QnAVo q);
	
	//qna수정
	public int updateQnA(QnAUpdateVo qu);
	
	//답변등록
	public int insertRe(QnAVo q);
	
	//마지막 글번호
	public Integer lastNo();
	
	//qna 전체글 수
	public int listCount(SearchCriteria scri);
	
	//답변있는 글은 삭제 못하게
	public int no_delete(QnAVo q);
	
	//파일 이름
	public List<QnAVo> fime_name();
}
