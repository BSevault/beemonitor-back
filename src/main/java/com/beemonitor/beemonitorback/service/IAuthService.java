package com.beemonitor.beemonitorback.service;

import com.beemonitor.beemonitorback.model.PersonEntity;
import org.springframework.security.authentication.AuthenticationProvider;

public interface IAuthService extends AuthenticationProvider {

public PersonEntity authent(String pEmail, String pPassword);

}
