package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//민아 5/10
public class Board_fileVo {
	private String uuid;		// uuid로 저장되는 파일이름
	private String file_path;	// 파일 경로
	private String file_name;	// 파일의 오리지널 이름 
	private int board_no;		// 게시물 번호(글번호)
}
