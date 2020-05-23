package com.example.demo.config;

import java.beans.ConstructorProperties;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataSourceConfig {
	//application.properties에 선언되어 있는
	//spring.datasource.*의 값으로
	//DataSource를 build함
	//기존 sqlmapconfig.xml 파일의 역할을 하는 클래스
	@ConfigurationProperties(prefix = "spring.datasource")
	public DataSource dataSource() {
		return DataSourceBuilder.create().build();
	}
}
