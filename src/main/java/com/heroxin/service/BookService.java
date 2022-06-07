package com.heroxin.service;

import com.heroxin.daomain.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Heroxin
 * @create 2022-05-21-10:33
 * @Description:
 */
public interface BookService {
    void insert(Book book);

    void delete(Integer book_id);

    void update(Book book);

    Book query(Integer book_id);

    List<Book> queryAll();

    List<Book> queryAllPages(int start,int count);

    Integer queryNum();

    void updateById(String book_borrower, String book_borrowtime,Integer book_id);

    List<Book> select(
            String book_name,
            String book_author,
            String book_isbn
    );
    void updatelogo(String book_pagination,Integer book_id);


}
