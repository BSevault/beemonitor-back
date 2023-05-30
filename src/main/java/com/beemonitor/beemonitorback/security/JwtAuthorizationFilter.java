// -#--------------------------------------
// -# ©Copyright Ferret Renaud 2019 -
// -# Email: admin@ferretrenaud.fr -
// -# All Rights Reserved. -
// -#--------------------------------------

package com.beemonitor.beemonitorback.security;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.beemonitor.beemonitorback.dto.out.PersonDtoOut;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.util.ObjectUtils;

import io.jsonwebtoken.Jwts;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Used when asking for a secured information.
 * https://dev.to/keysh/spring-security-with-jwt-3j76
 */
@Order(Ordered.LOWEST_PRECEDENCE)
public class JwtAuthorizationFilter extends BasicAuthenticationFilter implements SecurityConstants {
	private static final Logger LOG = LogManager.getLogger();

	private final byte[] signingKey;

	/**
	 * Constructor of the object.
	 *
	 * @param pAuthenticationManager the authentication manager
	 * @param pEnv                   environment information
	 */
	public JwtAuthorizationFilter(AuthenticationManager pAuthenticationManager, Environment pEnv) {
		super(pAuthenticationManager);
		this.signingKey = pEnv.getProperty("configuration.jwt.key",
				"-KaPdSgVkXp2s5v8y/B?E(H+MbQeThWmZq3t6w9z$C&F)J@NcRfUjXn2r5u7x!A%").getBytes();
	}

	/**
	 * Checks for token validity.
	 *
	 * @param request     the request
	 * @param response    the response
	 * @param filterChain filters
	 * @throws IOException      if an error occurred
	 * @throws ServletException if an error occurred
	 */
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		final var url = request.getRequestURL().toString();
		var jwtToken = request.getHeader(SecurityConstants.TOKEN_HEADER);
		JwtAuthorizationFilter.LOG.trace("<-- JwtAuthorizationFilter.doFilterInternal - {} - JWT token is {}", url,
				jwtToken);
		if (ObjectUtils.isEmpty(jwtToken) || !jwtToken.startsWith(SecurityConstants.TOKEN_PREFIX)) {
			JwtAuthorizationFilter.LOG.warn("<-- JwtAuthorizationFilter.doFilterInternal - {} - JWT token is Empty",
					url);
		} else if (!this.validateToken(jwtToken)) {
			JwtAuthorizationFilter.LOG.error("<-- JwtAuthorizationFilter.doFilterInternal - {} - JWT token is Invalid",
					url);
		} else {
			Authentication authentication = this.getAuthentication(jwtToken);
			SecurityContextHolder.getContext().setAuthentication(authentication);
			JwtAuthorizationFilter.LOG
					.debug("<-- JwtAuthorizationFilter.doFilterInternal - {} - OK - Set authentication back", url);
		}
		filterChain.doFilter(request, response);
	}

	/**
	 * Will validate token.
	 *
	 * @param token a token with Bearer in it
	 * @return true if token is ok, false if not
	 */
	private boolean validateToken(String token) {
		JwtAuthorizationFilter.LOG.trace("--> JwtAuthorizationFilter.validateToken - Token - {}", token);
		try {
			Jwts.parserBuilder().setSigningKey(this.signingKey).build()
					.parseClaimsJws(token.replace(SecurityConstants.TOKEN_PREFIX, ""));
			JwtAuthorizationFilter.LOG.trace("--> JwtAuthorizationFilter.validateToken - Token is OK");
			return true;
		} catch (Exception e) {
			JwtAuthorizationFilter.LOG.error("--> JwtAuthorizationFilter.validateToken - Token is KO", e);
		}
		return false;
	}

	/**
	 * Rebuild UsernamePasswordAuthenticationToken for SpringSecurity from JWT
	 * token.
	 *
	 * @param token the JWT token
	 * @return the token for Spring Security
	 */
	private UsernamePasswordAuthenticationToken getAuthentication(String token) {
		JwtAuthorizationFilter.LOG.debug("--> JwtAuthorizationFilter.getAuthentication - Token - {}", token);
		try {
			var parsedToken = Jwts.parserBuilder().setSigningKey(this.signingKey).build()
					.parseClaimsJws(token.replace(SecurityConstants.TOKEN_PREFIX, ""));

			var username = parsedToken.getBody().getSubject();

			Collection<? extends GrantedAuthority> authorities = ((List<?>) parsedToken.getBody()
					.get(SecurityConstants.TOKEN_ROLES)).stream()
					.map(authority -> new SimpleGrantedAuthority((String) authority)).toList();

			if (!ObjectUtils.isEmpty(username)) {
				var result = new UsernamePasswordAuthenticationToken(username, null, authorities);
				@SuppressWarnings("unchecked")
				Map<String, ?> personDto = (Map<String, ?>) parsedToken.getBody().get(SecurityConstants.TOKEN_USER);
				JwtAuthorizationFilter.LOG.trace("val {}", personDto);
				var personDtoOut = new PersonDtoOut(personDto);
				result.setDetails(personDtoOut);
				JwtAuthorizationFilter.LOG.warn(
						"<-- JwtAuthorizationFilter.getAuthentication - Token was pushed into Spring Security, {}",
						result);
				return result;
			}
		} catch (Exception exception) {
			JwtAuthorizationFilter.LOG.error("- JwtAuthorizationFilter.getAuthentication : {} failed", token,
					exception);
		}
		return null;
	}

}
