package com.entity;

import lombok.Data;

@Data
public class Account {
    private int accountId;//Id
    private String accountName;//用户名
    private String accountPassword;//原密码
    private String atPassword;//新密码
    private String nickName;//昵称

}
