package com.brsspringconfigservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.config.server.EnableConfigServer;


@SpringBootApplication
@EnableConfigServer
public class BrsSpringConfigServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(BrsSpringConfigServiceApplication.class, args);

//        new SpringApplicationBuilder()
//                .profiles("dev")
//                .sources(BrsSpringConfigServiceApplication.class)
//                .run(args);
    }

}
