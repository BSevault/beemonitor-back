package com.beemonitor.beemonitorback.dto.in;

public class LoginDtoIn {

    private String login;

    private String password;

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public void setLogin(String login) {
        if (login != null)
            this.login = login.trim();
    }

    public void setPassword(String password) {
        if (password != null)
            this.password = password.trim();
    }
}
