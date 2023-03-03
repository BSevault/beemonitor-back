package com.beemonitor.beemonitorback;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

// TODO enlever "exclude = {SecurityAutoConfiguration.class}" lors de la mise en place de spring security
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class BeeMonitorBackApplication {

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder(BCryptPasswordEncoder.BCryptVersion.$2Y);
    }

    public static void main(String[] args) {
        SpringApplication.run(BeeMonitorBackApplication.class, args);
    }

}
