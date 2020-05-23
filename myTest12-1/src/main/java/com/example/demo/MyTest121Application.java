package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.concurrent.ConcurrentTaskScheduler;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;


// 민아) 5/11, 스케쥴러 추가 
// 민아) 5/13, 테이블에 없는 파일 삭제 스케쥴러... 문제해결중
// 민아) 5/19, aoplog 하는중 

@EnableAspectJAutoProxy
@EnableScheduling
@SpringBootApplication
public class MyTest121Application {
	
	@Bean
	public PasswordEncoder passwordEncoder() {
	    return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

	
	public static void main(String[] args) {
		SpringApplication.run(MyTest121Application.class, args);
	}

	// bean에 설정, 스케쥴러 사용을 위해? 굳이 안써도 될듯 
//	@Bean
//	public ConcurrentTaskScheduler taskScheduler() {
//		// 단일 스레드 구현
//		return new ConcurrentTaskScheduler();
//	}

	
	//머지안될때 커밋용 공백  


}
	