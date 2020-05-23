package com.example.demo.service;

import java.util.List;

import com.example.demo.vo.Board_fileVo;

//민아) 5/10
public interface Board_fileService {
		//자유게시판 파일 등록
		public int insert(Board_fileVo bf);
		
		//같은 게시물번호에 등록된 파일목록
		public List<Board_fileVo> selectFile(int board_no);
		
		//삭제
		public int delete(String uuid);
		public int delbord_no(int board_no);
		
		//실제로 db에 들어있는 파일 목록
		public List<Board_fileVo> realFile();
		
		//수정
		public int updateFile(Board_fileVo bf);
	
}
