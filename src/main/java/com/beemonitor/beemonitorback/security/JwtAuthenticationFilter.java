// -#--------------------------------------
// -# ©Copyright Ferret Renaud 2019 -
// -# Email: admin@ferretrenaud.fr -
// -# All Rights Reserved. -
// -#--------------------------------------

package com.beemonitor.beemonitorback.security;

import java.io.IOException;
import java.util.Date;
import java.util.stream.Collectors;

import com.beemonitor.beemonitorback.dto.in.LoginDtoIn;
import com.beemonitor.beemonitorback.dto.out.PersonDtoOut;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.util.ObjectUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.DefaultClaims;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Used for authentication. https://dev.to/keysh/spring-security-with-jwt-3j76
 */
@Order(Ordered.LOWEST_PRECEDENCE)
public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter
		implements SecurityConstants {
	private static final Logger LOG = LogManager.getLogger();

	private final Environment env;

	private final AuthenticationManager authenticationManager;

	/**
	 * Constructor of the object.
	 *
	 * @param pAuthenticationManager the authentication manager
	 * @param pEnv                   environment information
	 */
	public JwtAuthenticationFilter(AuthenticationManager pAuthenticationManager, Environment pEnv) {
		this.authenticationManager = pAuthenticationManager;
		this.setFilterProcessesUrl(SecurityConstants.AUTH_LOGIN_URL);
		this.env = pEnv;
	}

	/**
	 * Can handle email,password as parameter or as JSOn in body
	 * ({"email":"xxx","password":"xxx"}).
	 *
	 * @param request  the request
	 * @param response the response
	 */
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) {
		// param issus du formulaire front
		String username = null;
		String password = null;

		// JSON dans le body de la requete
			JwtAuthenticationFilter.LOG
					.debug("--> JwtAuthenticationFilter.attemptAuthentication(email, password) as Json in Body");
			// Look as JSon in the body
			String body = null;
			try {
				// get request body
				body = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
				// Level is in trace but we should hide password if present in body or if in
				// production
				JwtAuthenticationFilter.LOG
						.trace("--> JwtAuthenticationFilter.attemptAuthentication(email, password) Body={}", body);
				var mapper = new ObjectMapper();
				var loginDtoIn = mapper.readValue(body, LoginDtoIn.class);
				username = loginDtoIn.getLogin();
				password = loginDtoIn.getPassword();
			} catch (Exception lExp) {
				JwtAuthenticationFilter.LOG.error(
						"--> JwtAuthenticationFilter.attemptAuthentication - Error, your JSon is not right!, found {}, should be something like {\"email\":\"toto@gmail.com\",\"password\":\"bonjour\"}. DO NOT use simple quote!",
						body, lExp);
			}

		JwtAuthenticationFilter.LOG.debug("--> JwtAuthenticationFilter.attemptAuthentication({}, [PROTECTED])",
				username);

		Authentication authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
		var result = this.authenticationManager.authenticate(authenticationToken);
		JwtAuthenticationFilter.LOG.debug("--> JwtAuthenticationFilter.attemptAuthentication is ok - User id is {}",
				((PersonDtoOut) result.getDetails()).getId());

		return result;
	}

	/**
	 * Will build the JWT Token if authentication is ok.
	 *
	 * @param request        the request
	 * @param response       the response
	 * @param filterChain    filters
	 * @param authentication login/pwd information taken from AuthenticationManager
	 */
	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response,
			FilterChain filterChain, Authentication authentication) {
		var userName = (String) authentication.getPrincipal();

		var roles = authentication.getAuthorities().stream().map(GrantedAuthority::getAuthority).toList();

		var ue = (PersonDtoOut) authentication.getDetails();
		Claims claims = new DefaultClaims();
		claims.put(SecurityConstants.TOKEN_USER, ue);
		claims.put(SecurityConstants.TOKEN_ROLES, roles);
		claims.setIssuer(SecurityConstants.TOKEN_ISSUER);
		claims.setAudience(SecurityConstants.TOKEN_AUDIENCE);
		claims.setSubject(userName);
		var val = Integer.parseInt(this.env.getProperty("configuration.jwt.expire.in.ms", "86400000"));
		claims.setExpiration(new Date(System.currentTimeMillis() + val));
		var signatureAlgorithm = SignatureAlgorithm
				.forName(this.env.getProperty("configuration.jwt.signature.algorithm", "none"));

		JwtBuilder builder;
		if (signatureAlgorithm == null || signatureAlgorithm == SignatureAlgorithm.NONE) {
			JwtAuthenticationFilter.LOG.warn("- No encryption for JWT token, this is good for testing ...");
			builder = Jwts.builder().setHeaderParam("typ", SecurityConstants.TOKEN_TYPE).setClaims(claims);
		} else {
			JwtAuthenticationFilter.LOG.debug(
					"Encryption for JWT token is {}, do not forget to set your key in the configuration file",
					signatureAlgorithm);
			// Sample key is for HS512
			var signingKey = this.env.getProperty("configuration.jwt.key",
					"-KaPdSgVkXp2s5v8y/B?E(H+MbQeThWmZq3t6w9z$C&F)J@NcRfUjXn2r5u7x!A%").getBytes();
			builder = Jwts.builder().signWith(Keys.hmacShaKeyFor(signingKey), signatureAlgorithm)
					.setHeaderParam("typ", SecurityConstants.TOKEN_TYPE).setClaims(claims);
		}
		// Sonar does not like this line because it thinks there is no signwith
		// hashing token
		var token = builder.compact(); // NOSONAR
		response.addHeader(SecurityConstants.TOKEN_HEADER, SecurityConstants.TOKEN_PREFIX + token);
	}

	// @Override
	// public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
	// 		AuthenticationException pException) throws IOException, ServletException {
	// 	var out = new ExceptionDtoOut(pException);
	// 	var objectMapper = new ObjectMapper();
	// 	var expToJson = objectMapper.writeValueAsString(out);
	// 	var pw = response.getWriter();
	// 	pw.write(expToJson);
	// 	response.setContentType(MediaType.APPLICATION_JSON_VALUE);
	// 	response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	//
	// }

}
