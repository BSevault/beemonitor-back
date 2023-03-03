package com.beemonitor.beemonitorback;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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

    private static final Logger LOG = LogManager.getLogger();

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder(BCryptPasswordEncoder.BCryptVersion.$2Y);
    }

    public static void main(String[] args) {
        var app = new SpringApplication(BeeMonitorBackApplication.class);
        app.setLogStartupInfo(false);
        app.run(args);
        LOG.debug("=== Server is up ===");
    }

}
