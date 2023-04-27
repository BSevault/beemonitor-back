package com.beemonitor.beemonitorback.security;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;

// @Configuration
// @EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authz -> authz
                        .requestMatchers("/login").permitAll()
                        // .requestMatchers("/persons/all").hasAuthority("ADMIN")
                        // .requestMatchers("/persons/{id:[^[1-9]\\d*]}").hasAuthority("USER")
                        .anyRequest().authenticated()

                )
                .formLogin().disable()
                .httpBasic();
        return http.build();
    }

}
