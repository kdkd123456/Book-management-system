package com.service.impl;

import com.dao.AccountDao;
import com.entity.Account;
import com.service.AccountService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    final AccountDao dao;

    public AccountServiceImpl(AccountDao dao){
        this.dao = dao;
    }

//    登录
    @Override
    public List<Account> checkAccount(Account account) {
        List <Account> list = dao.checkAccount(account);
        return list.size()!=0?list:null;
    }

//    查询原密码是否正确
    @Override
    public List<Account> selAt(Account account) {
        List <Account> list = dao.selAt(account);
        return list.size()!=0?list:null;
    }

//    更改密码
    @Override
    public void updata(Account account) {
        dao.updata(account);
    }

//    修改密码
    @Override
    public boolean updataAccount(Map<String, ?> map) {
        return dao.updataAccount(map);
    }

    private final HashMap<String, Object> map = new HashMap<String, Object>();

//    条件查询
    private int pageSize=5;
    @Override
    public List<Account> sAt(String page,String accountName,String nickName) {
        map.put("start",(Integer.parseInt(page)-1)*pageSize);//游标起始位
        map.put("pageSize",pageSize);//游标下移位
        map.put("accountName",accountName);
        map.put("nickName",nickName);
        return dao.sAt(map);
    }
//    总页数
    @Override
    public long countAccounts() {
        return (long)Math.ceil(dao.countAccounts(map)/(double)pageSize);
    }

//    新增
    @Override
    public void createA(Account account) {
        dao.createA(account);
    }

//    删除
    @Override
    public void deletes(int accountId) {
        dao.deletes(accountId);
    }

//    更新查询
    @Override
    public Account previewAccount(int accountId) {
        return dao.previewAccount(accountId);
    }

//    更新
    @Override
    public void updataUser(Account account) {
        dao.updataUser(account);
    }


}
