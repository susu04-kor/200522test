package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Animal_infoVo {

	private int pet_no;
	private String user_id;
	private String pet_date;
	private String pet_type;
	private String pet_pic;
	private String pet_name;
	
	private String day;
	
	private MultipartFile pic;
}
