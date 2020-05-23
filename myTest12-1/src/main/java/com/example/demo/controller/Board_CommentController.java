package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.AlarmService;
import com.example.demo.service.Board_CommentService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.AlarmVo;
import com.example.demo.vo.Board_CommentVo;
import com.google.gson.Gson;

// 민아) 5/10, 자유게시판 댓글 목록,삭제,입력 완료 
// 민아) 5/19, HttpServletRequest request 이랑 @NoLogging 처리 
@RestController
@RequestMapping("/comment/*")
public class Board_CommentController {
	@Autowired
	private Board_CommentService comm_service;

	public void setComm_service(Board_CommentService comm_service) {
		this.comm_service = comm_service;
	}
	
	@Autowired
	AlarmService alarmService;
	
	// 댓글목록
	@NoLogging
	@GetMapping(value = "/listComment", produces = "application/json; charset=utf-8")
	public String listComment(Board_CommentVo bc) {
		List<Board_CommentVo> listComment = comm_service.listComment(bc.getBoard_no());
		Gson gson = new Gson();
		//System.out.println("댓글목록 컨트롤러 동작함");
		return gson.toJson(listComment);
	}
	
	// 댓글작성
	@PostMapping(value = "/insertComment")
	public ModelAndView insertComment(HttpServletRequest request, Board_CommentVo bc) {
		//System.out.println("댓글작성 컨트롤러 동작함");
		ModelAndView mav = new ModelAndView("redirect:/board/get?board_no="+bc.getBoard_no());
		
		comm_service.insertComment(bc);
		
		//댓글 등록 알람 등록
		AlarmVo alarm = new AlarmVo();
		alarm.setUser_id(bc.getUser_id());
		alarm.setT_num(bc.getBoard_no());
		alarmService.insert_board_alarm(alarm);
		
		return mav;
	}

	// 댓글만 삭제
	@GetMapping(value = "/commDeleteSubmit")
	public String commDeleteSubmit(HttpServletRequest request, Board_CommentVo bc) {	
		//댓글 삭제 알람 등록
		AlarmVo alarm = new AlarmVo();
		alarm.setUser_id(bc.getUser_id());
		alarm.setBoard_num(bc.getComm_num());
		alarm.setT_num(bc.getBoard_no());
		alarmService.cancle_insert_board_alarm(alarm);
		
		comm_service.deleteComment(bc);	// where comm_num = #{comm_num}
		// System.out.println("댓글삭제 컨트롤러 동작");
		return "redirect:/board/get";
	}
}
