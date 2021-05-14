package com.service.impl;

import com.dao.BookDao;
import com.entity.Book;
import com.service.BookService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("bookService")
public class BookServiceImpl implements BookService {

    final BookDao dao;

    public BookServiceImpl(BookDao dao){
        this.dao = dao;
    }

    private final Map<String, Object> map = new HashMap<String, Object>();

    private int pageSize=5;//记录数

//    查询
    @Override
    public List<Book> bookList(String bookName,String publisher,String publishDateStart,String publishDateEnd,String page) {
        //分页
        map.put("start",(Integer.parseInt(page)-1)*pageSize);//游标起始位
        map.put("pageSize",pageSize);//游标下移位

        map.put("bname",bookName);//书名
        map.put("bpublisher",publisher);//出版社
        map.put("bpublishDateStart",publishDateStart);//出版日期开始
        map.put("bpublishDateEnd",publishDateEnd);//出版日期最后
        return dao.bookList(map);
    }
//    计算页面总页数
    @Override
    public long countBooks() {
        return (long)Math.ceil(dao.countBooks(map)/(double)pageSize);
    }

//    删除
    @Override
    public void deletebook(int bid) {
        dao.deletebook(bid);
    }

//    增加
    @Override
    public void createBook(Book book) {
        dao.createBook(book);
    }

//    更新查询
    @Override
    public Book previewBook(int bid) {
        return dao.previewBook(bid);
    }

//    更新
    @Override
    public void updataBook(Book book) {
        dao.updataBook(book);
    }


}
