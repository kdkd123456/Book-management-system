package com.controller;

import com.entity.Book;
import com.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.beans.Transient;

@Controller
public class BookController {

    @Resource BookService bookService;
    //首页
    @RequestMapping("booksList")
    public String bookList(String bookName,String publisher,String publishDateStart,String publishDateEnd,Model model,String page){
         //确定当前页
        if (StringUtils.isEmpty(page))
            page="1";
        //页面传值
        model.addAttribute("bookName",bookName);//书名
        model.addAttribute("publisher",publisher);//出版社
        model.addAttribute("publishDateStart",publishDateStart);//出版日期开始
        model.addAttribute("publishDateEnd",publishDateEnd);//出版日期最后
        model.addAttribute("books",
                bookService.bookList(bookName,publisher,publishDateStart,publishDateEnd,page));//结果集
        model.addAttribute("totalPage",
                bookService.countBooks());//总页数
        model.addAttribute("page",page);//当前页数
    return "booksList";
    }

    //删除操作
    @Transactional
    @GetMapping(value = "deletebook/{bid}",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String deletebook(@PathVariable("bid") String bid){
        bookService.deletebook(Integer.parseInt(bid));
        return "SUCCESS";
    }

    //跳转增加页面
    @RequestMapping("createBooks")
    public String createBooks(){
        return "createBook";
    }

    //添加图书
    @Transactional
    @RequestMapping("createBook")
    public String createBook(Book book){
        bookService.createBook(book);
        return "redirect:booksList";
    }

    //    更新查询
    @GetMapping(value = "previewBook/{bid}")
    public String previewBook(@PathVariable("bid") int bid, Model model){
        model.addAttribute("book",
                bookService.previewBook(bid));
        return "updataBook";
    }

    //    更新
    @Transactional
    @RequestMapping("updataBook")
    public String updataBook(Book book){
        bookService.updataBook(book);
        return "redirect:booksList";
    }
}
