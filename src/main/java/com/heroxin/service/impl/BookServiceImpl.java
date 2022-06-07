package com.heroxin.service.impl;

import com.heroxin.daomain.Book;
import com.heroxin.mapper.BookMapper;
import com.heroxin.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * @author Heroxin
 * @create 2022-05-21-10:34
 * @Description:
 */
@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;


    @Override
    @Transactional(isolation = Isolation.DEFAULT,readOnly = false,propagation = Propagation.REQUIRED)
    public void insert(Book book) {
        bookMapper.insert(book);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,readOnly = false,propagation = Propagation.REQUIRED)
    public void delete(Integer book_id) {
        bookMapper.delete(book_id);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,readOnly = false,propagation = Propagation.REQUIRED)
    public void update(Book book) {
        bookMapper.update(book);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,readOnly = false,propagation = Propagation.REQUIRED)
    public Book query(Integer book_id) {
        return bookMapper.query(book_id);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,readOnly = false,propagation = Propagation.REQUIRED)
    public List<Book> queryAll() {
        return bookMapper.queryAll();
    }

    @Override
    public List<Book> queryAllPages(int start, int count) {
        return bookMapper.queryAllPages(start,count);
    }

    @Override
    public Integer queryNum() {
        return bookMapper.queryNum();
    }

    @Override
    public void updateById(String book_borrower, String book_borrowtime, Integer book_id) {
        bookMapper.updateById(book_borrower,book_borrowtime,book_id);
    }

    @Override
    public List<Book> select(String book_name, String book_author, String book_isbn) {
        return bookMapper.select(book_name,book_author,book_isbn);
    }

    @Override
    public void updatelogo(String book_pagination, Integer book_id) {
        bookMapper.updatelogo(book_pagination,book_id);
    }


}
