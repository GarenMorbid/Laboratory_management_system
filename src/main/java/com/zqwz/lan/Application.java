package com.zqwz.lan;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.zqwz.lan.dao")
public class Application {
    public static void main(String[] args){
        SpringApplication.run(Application.class, args);
    }
}

