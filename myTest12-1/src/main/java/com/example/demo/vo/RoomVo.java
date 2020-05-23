package com.example.demo.vo;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVo {
	private int rm_no;
	private int facility_no;
	private String rm_name;
	private String rm_cost;
	private String rm_max;
	private String rm_pic;
	private String rm_info;
	private int rm_ok;
	private int rm_sn;
}


