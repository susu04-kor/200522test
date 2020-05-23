package com.example.demo.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
// 민아 5/10
public class BoardVo {
	private int board_no;
	private String category;
	private String board_title;
	private String board_content;
	private Date board_date;
	private int board_hit;
	private String user_id;
	
	//게시글등록시 파일도 같이 첨부되어 파일테이블에 들어가야함
	//한 게시글에 이미지가 여러개 올라갈 경우를 생각
	private List<Board_fileVo> listImg;
}
