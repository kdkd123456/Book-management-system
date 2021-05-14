package com.service;

import com.entity.Account;

import java.util.List;
import java.util.Map;

public interface AccountService {
    //登录
    List<Account> checkAccount(Account account);
//    查询原密码是否正确
    List<Account> selAt(Account account);
//    更改密码
    void updata(Account account);
//    修改密码
    boolean updataAccount(Map<String,?> map);

    //    用户查询
    List<Account> sAt(String page,String accountName,String nickName);
//    总页数
    long countAccounts();

    //    新增用户
    void createA(Account account);
//      删除
    void deletes(int accountId);

    //    更新查询
    Account previewAccount(int accountId);
    //    更新
    void updataUser(Account account);
}
