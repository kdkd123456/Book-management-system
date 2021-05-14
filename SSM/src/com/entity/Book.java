package com.entity;

import lombok.Data;

@Data
public class Book {
    private int bid;//Id
    private String bname;//书名
    private String bprice;//价格
    private String bpublisher;//出版社
    private String bpublishdate;//出版时间
    private int creater;//添加人
    private int accountId;//添加人
}
