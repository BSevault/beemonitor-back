package com.beemonitor.beemonitorback.service;

import com.beemonitor.beemonitorback.model.PersonEntity;

public interface IAuthService {

public PersonEntity authent(String pEmail, String pPassword);

}
