package com.BMS.model;

public class Reader {
    private int id;
    private String userName;
    private String password;
    private String phone;
    private String Avatar;
    public Reader(int id, String userName, String password, String phone) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.phone = phone;
    }

    public Reader(int id, String userName, String phone) {
        this.id = id;
        this.userName = userName;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return Avatar;
    }

    public void setAvatar(String avatar) {
        Avatar = avatar;
    }
}
