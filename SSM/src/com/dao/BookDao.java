package com.dao;

import com.entity.Book;

import java.util.List;
import java.util.Map;

public interface BookDao {
    //    查询记录数
    List<Book> bookList(Map<String, Object> map);

    //    计算总页数
    long countBooks(Map<String, Object> map);

    //    删除
    void deletebook(int bid);

    //    新增
    void createBook(Book book);

    //    更新查询
    Book previewBook(int bid);

    //    更新
    void updataBook(Book book);
}
