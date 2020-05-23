package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.Board_fileDao;
import com.example.demo.vo.Board_fileVo;
//민아) 5/10

@Service
public class Board_fileServiceImpl implements Board_fileService{
	@Autowired
	private Board_fileDao bfDao;
	
	@Override
	public int insert(Board_fileVo bf) {
		int re = bfDao.insert(bf);
		return re;
	}

	@Override
	public List<Board_fileVo> selectFile(int board_no) {
		List<Board_fileVo> list = bfDao.selectFile(board_no);
		return list;
	}

	@Override
	public int delete(String uuid) {
		int re = bfDao.delete(uuid);
		return re;
	}

	@Override
	public int delbord_no(int board_no) {
		int re = bfDao.delbord_no(board_no);
		return re;
	}

	@Override
	public List<Board_fileVo> realFile() {
		List<Board_fileVo> list = bfDao.realFile();
		return list;
	}

	@Override
	public int updateFile(Board_fileVo bf) {
		int re= bfDao.updateFile(bf);
		return re;
	}

}
