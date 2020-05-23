package com.example.demo.vo;

import lombok.NoArgsConstructor;

import lombok.AllArgsConstructor;
import lombok.Data;

// 민아) 5/19, aoplog 방문 url 차트 한번 그려보려고 만든vo 
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChartVo {
	private String url;
	private int count;
}
