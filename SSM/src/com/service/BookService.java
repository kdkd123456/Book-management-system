package com.service;

import com.entity.Book;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface BookService {
    //查询记录数
    List<Book> bookList(String bookName, String publisher, String publishDateStart, String publishDateEnd, String page);

    //计算总页数
    long countBooks();

    //删除
    void deletebook(int bid);

    //新增
    void createBook(Book book);

    //    更新查询
    Book previewBook(int bid);

    //    更新
    void updataBook(Book book);

}