package com.liu.vo;

import java.io.Serializable;

/**
 * Created by 26522 on 2017/8/3.
 */
public class User implements Serializable{
    private String username;
    private String password;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



    }

