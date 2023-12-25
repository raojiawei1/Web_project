package com.southwind.entity;

public class Message {
    private String username;
    private String password;
    private String name;
    private String newpassword;
    private String state;


    public Message(String username, String name, String password, String newpassword, String state) {
        this.password = password;
        this.name = name;
        this.username=username;
        this.newpassword=newpassword;
        this.state=state;
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

    public String getNewpassword() {
        return newpassword;
    }

    public void setNewpassword(String newpassword) {
        this.newpassword =newpassword;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}

