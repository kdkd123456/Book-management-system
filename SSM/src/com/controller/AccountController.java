package com.controller;

import com.entity.Account;
import com.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
public class AccountController {
    @Resource
    AccountService accountService;

    //登录
    @RequestMapping("login")
    public String checkAccount(Account at, Model model, HttpSession session) {
        List<Account> list = accountService.checkAccount(at);
        if (list != null) {
            session.setAttribute("account", list.get(0));
            return "redirect:main";
        } else {
            model.addAttribute("errorMsg", "-1");
            return "login";
        }
    }

//    查询和修改密码
    @Transactional
    @RequestMapping(value = "updataAccount",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Map<String,String> updataAccount(@RequestBody Map<String,String> map,HttpSession session){
        Account account = (Account) session.getAttribute("account");
        map.put("accountId", String.valueOf(account.getAccountId()));
        boolean result = accountService.updataAccount(map);
        map.clear();
        map.put("result",String.valueOf(result));
        return map;
    }


//    退出
    @PostMapping("exit")
    public String exit(HttpSession session){
        session.removeAttribute("account");
        session.invalidate();
        return "login";
    }

//    数据展示
    @RequestMapping("accountList")
    public String sAt(String accountName,String nickName,String page, Model model) {
        if (StringUtils.isEmpty(page))
            page="1";
            //当前页

            //页面传值
            model.addAttribute("accountName",accountName);
            model.addAttribute("nickName",nickName);
            model.addAttribute("account",
                    accountService.sAt(page,accountName,nickName));//结果集
            model.addAttribute("totalPage",
                    accountService.countAccounts());//总页数
            model.addAttribute("page",page);//当前页数
        return "accountList";
    }

//    新增用户跳转动作
    @RequestMapping("createAccount")
    public String createAccount(){
        return "createAccount";
    }

//    新增用户
    @Transactional
    @RequestMapping("createA")
    public String createA(Account account){
        accountService.createA(account);
        return "redirect:accountList";
    }

//    删除用户
    @Transactional
    @GetMapping(value = "deletes/{accountId}",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String deletes(@PathVariable("accountId") String accountId){
        accountService.deletes(Integer.parseInt(accountId));
        return "SUCCESS";
    }

//    更新查询
    @GetMapping(value = "previewAccount/{accountId}")
    public String previewAccount(@PathVariable("accountId") int accountId, Model model){
        model.addAttribute("account",
                accountService.previewAccount(accountId));
        return "updataUser";
    }

//    更新
    @Transactional
    @RequestMapping("updataUser")
    public String updataUser(Account account){
        accountService.updataUser(account);
        return "redirect:accountList";
    }
}
