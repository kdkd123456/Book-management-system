package com.dao;

import com.entity.Account;

import java.util.List;
import java.util.Map;

public interface AccountDao {
    //    登录
    List<Account> checkAccount(Account account);

    //    查询原密码是否正确
    List<Account> selAt(Account account);

    //    更改密码
    void updata(Account account);

    //    修改密码
    boolean updataAccount(Map<String, ?> map);

    //    用户查询
    List<Account> sAt(Map<String, Object> map);

    //    计算总页数
    long countAccounts(Map<String, Object> map);

    //    新增用户
    void createA(Account account);

    //    删除
    void deletes(int accountId);

    //    更新查询
    Account previewAccount(int accountId);

    //    更新
    void updataUser(Account account);
}
