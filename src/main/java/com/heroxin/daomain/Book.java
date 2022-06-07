package com.heroxin.daomain;

import lombok.Data;

/**
 * @author Heroxin
 * @create 2022-05-19-16:55
 * @Description:
 */
@Data
public class Book {
    private Integer book_id;
    private String book_name;
    private String book_isbn;
    private String book_press;
    private String book_author;
    private String book_pagination;
    private Double book_price;
    private String book_uploadtime;
    private String book_status;
    private String book_borrower;
    private String book_borrowtime;
    private String book_returntime;
}
