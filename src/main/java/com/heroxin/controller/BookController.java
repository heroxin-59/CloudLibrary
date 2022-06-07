package com.heroxin.controller;

import com.heroxin.daomain.Book;
import com.heroxin.daomain.Page;
import com.heroxin.daomain.User;
import com.heroxin.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author Heroxin
 * @create 2022-05-21-10:33
 * @Description:
 */
@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private ModelAndView modelAndView;
    Integer id = 0;

    //    分页显示所有书籍
    @RequestMapping("/list")
    public ModelAndView queryAllPage(HttpServletRequest request){
        int start = 0;
        int count = 6;
        try {
            start = Integer.parseInt(request.getParameter("page.start"));
            count = Integer.parseInt(request.getParameter("page.count"));
        }catch (Exception e){
        }

        Page page = new Page(start,count);

        List<Book> bookList = bookService.queryAllPages(page.getStart(), page.getCount());
        int total = bookService.queryNum();
        page.setTotal(total);


    //        获取当前用户
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");//用user接收，那边是用user封装的，否则爆 ClassCastException

        modelAndView.addObject("page",page);
        modelAndView.addObject("user",user);
        modelAndView.addObject("list",bookList);
        modelAndView.setViewName("book-list");

        return modelAndView;
    }
    //    跳转到添加书籍页面
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request){
        //        获取当前登录用户的信息
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");//用user接收，那边是用user封装的，否则爆 ClassCastException

        modelAndView.addObject("user",user);
        modelAndView.setViewName("book-add");
        return modelAndView;
    }

    //    添加书籍
    @RequestMapping("/insert")
    public String insert(Book book){
        bookService.insert(book);

        return "redirect:/book/list";
    }

    //    跳转到更改书籍信息页面
    @RequestMapping("/toUpdate/{book_id}")
    public ModelAndView toUpdate(@PathVariable("book_id") Integer book_id,HttpServletRequest request){
        Book query = bookService.query(book_id);

        //        获取当前登录用户的信息
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");//用user接收，那边是用user封装的，否则爆 ClassCastException

        modelAndView.addObject("user",user);
        modelAndView.addObject("query",query);
        modelAndView.setViewName("book-update");

        return modelAndView;
    }

    //    更改书籍信息
    @RequestMapping("/update")
    public String update(Book book,MultipartFile multipartFile) throws IOException {
        bookService.update(book);
        return "redirect:/book/list";
    }
    //    跳转到上传logo页面
    @RequestMapping("/toUpload/{book_id}")
    public ModelAndView toUpload(@PathVariable("book_id") Integer book_id,HttpServletRequest request){

        id = book_id;
        //        获取当前登录用户的信息
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");//用user接收，那边是用user封装的，否则爆 ClassCastException

        modelAndView.addObject("user",user);
        modelAndView.setViewName("book-upload");

        return modelAndView;
    }
    //    上传logo
    @RequestMapping("/upload")
    public String upload(MultipartFile uploadFile) throws IOException {

        String logo = uploadFile.getOriginalFilename();
        uploadFile.transferTo(new File(
                "C:\\Users\\hero_\\Documents\\IDEA\\Heroxin_Project\\CloudLibrary\\src\\main\\webapp\\WEB-INF\\imges\\"+
                logo));
        bookService.updatelogo(logo,id);
        return "redirect:/book/list";
    }


    //    删除书籍
    @RequestMapping("/delete/{book_id}")
    public String delete(@PathVariable("book_id") int book_id){
        bookService.delete(book_id);

        return "redirect:/book/list";
    }

//    查询书籍
    @RequestMapping("/select")
    public ModelAndView select(Book book,HttpServletRequest request){

        String book_name = book.getBook_name();
        String book_author = book.getBook_author();
        String book_isbn = book.getBook_isbn();

        //        获取当前登录用户的信息
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");//用user接收，那边是用user封装的，否则爆 ClassCastException

        List<Book> bookList = bookService.select(book_name, book_author, book_isbn);

        modelAndView.addObject("list",bookList);
        modelAndView.addObject("user",user);
        modelAndView.setViewName("book-search");

        return modelAndView;
    }

}
