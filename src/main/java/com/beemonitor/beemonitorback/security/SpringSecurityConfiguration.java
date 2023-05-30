package com.beemonitor.beemonitorback.security;

import java.time.Duration;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;


@Configuration
@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SpringSecurityConfiguration {

    private static final Logger LOG = LogManager.getLogger();

    private static final String[] ALL_METHODS = new String[] { CorsConfiguration.ALL, HttpMethod.GET.name(),
            HttpMethod.HEAD.name(), HttpMethod.POST.name(), HttpMethod.PUT.name(), HttpMethod.DELETE.name(),
            HttpMethod.PATCH.name(), HttpMethod.OPTIONS.name(), HttpMethod.TRACE.name() };

    private static final String[] ALL_HEADERS = new String[] { CorsConfiguration.ALL, "Access-Control-Allow-Headers",
            "WWW-Authenticate", "Access-Control-Allow-Origin", "Origin,Accept", "X-Requested-With", "Content-Type",
            "Access-Control-Request-Method", "Access-Control-Request-Headers", SecurityConstants.TOKEN_HEADER };

    @Autowired
    protected Environment env;
    @Autowired
    protected AuthenticationProvider customAuthenticationProvider;

    /**
     * Global CORS configuration.
     *
     * @return global cors configuration for Spring Security.
     */
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        // BEAN for children to load
        SpringSecurityConfiguration.LOG
                .debug("SpringSecurityConfiguration - Loading CORS definition ...");

        var config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.addAllowedOriginPattern(CorsConfiguration.ALL); // "*"

        config.setAllowedHeaders(Arrays.asList(SpringSecurityConfiguration.ALL_HEADERS));
        config.setAllowedMethods(Arrays.asList(SpringSecurityConfiguration.ALL_METHODS));
        config.setExposedHeaders(Arrays.asList(SpringSecurityConfiguration.ALL_HEADERS));
        config.setMaxAge(Duration.of(2, ChronoUnit.HOURS));

        var source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return source;
    }

    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) {
        SpringSecurityConfiguration.LOG
                .debug("SpringSecurityConfiguration - Link with our Authentication provider");
        // Our Authentication Manager
        auth.authenticationProvider(this.customAuthenticationProvider);
    }

    /**
     * Bean that will be used as AuthenticationManager
     *
     * @param authenticationConfiguration the configuration
     * @return the bean AuthenticationManager
     * @throws Exception if a problem occurred
     */
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
            throws Exception {
        // BEAN for children to load
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    @DependsOn("corsConfigurationSource")
    public SecurityFilterChain web(HttpSecurity http, AuthenticationManager authenticationManager) throws Exception {
        SpringSecurityConfiguration.LOG.debug("SpringSecurityConfigurationSecured - Apply rules");

        // Keep cors enable here, otherwise configuration of it is not applied
        http.csrf().disable().cors();
        http.authorizeHttpRequests(authorize -> authorize.requestMatchers("/", // Root => URLs publiques
                        "/favicon.ico*", //
                        "/csrf/**", //
                        "/v3/api-docs/**", // Swagger
                        "/v3/api-docs**", //
                        "/configuration/**", //
                        "/swagger-ui.html", //
                        "/swagger-resources/**", //
                        "/swagger*/**", //
                        "/webjars/**", //
                        "/forgotpassword", //
                        "license.txt").permitAll().anyRequest().authenticated()).headers().frameOptions().disable().and()
                .addFilterBefore(new JwtAuthenticationFilter(authenticationManager, this.env),
                        UsernamePasswordAuthenticationFilter.class)
                .addFilterBefore(new JwtAuthorizationFilter(authenticationManager, this.env),
                        UsernamePasswordAuthenticationFilter.class)
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and().logout().clearAuthentication(true)
                .logoutSuccessHandler((pRequest, pResponse, pAuthentication) -> pResponse.setStatus(200)).and()
                .formLogin().disable().httpBasic().disable();

        return http.build();
    }


}
