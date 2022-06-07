package com.heroxin.controller;

import com.heroxin.daomain.Record;
import com.heroxin.daomain.User;
import com.heroxin.service.BookService;
import com.heroxin.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * @author Heroxin
 * @create 2022-05-21-10:33
 * @Description:
 */
@Controller
@RequestMapping("/record")
public class RecordController {
    @Autowired
    private RecordService recordService;
    @Autowired
    private ModelAndView modelAndView;
    @Autowired
    private BookService bookService;


//    新增借阅
    @RequestMapping("/insert/{record_bookname}/{record_bookisbn}/{book_id}")
    public String insert(
            @PathVariable("record_bookname") String record_bookname,
            @PathVariable("record_bookisbn") String record_bookisbn ,
            @PathVariable("book_id") Integer book_id,
            HttpServletRequest request){
//        获取当前登录用户的信息
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");//用user接收，那边是用user封装的，否则爆 ClassCastException

//        获取当前时间
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        String day = formatter.format(date);
//        封装数据
        Record record = new Record();
        record.setRecord_bookisbn(record_bookisbn);
        record.setRecord_bookname(record_bookname);
        record.setRecord_borrower(user.getUser_name());
        record.setRecord_borrowtime(day);

//        更新书籍信息
        bookService.updateById(user.getUser_name(), day,book_id);

        recordService.insert(record);

        return "redirect:/book/list";
    }

//    查询借阅
    @RequestMapping("/query")
    public ModelAndView query(HttpServletRequest request){
        List<Record> query = recordService.query();

        //        获取当前登录用户的信息
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");//用user接收，那边是用user封装的，否则爆 ClassCastException

        modelAndView.addObject("querylist",query);
        modelAndView.setViewName("book-record");

        return modelAndView;
    }

//    更新订阅，归还图书
    @RequestMapping("/update/{record_id}")
    public String update(@PathVariable("record_id") Integer record_id){
        recordService.update("等待确认中..",record_id);

        return "redirect:/record/query";
    }
//    管理员确认归还
    @RequestMapping("/remand/{record_id}")
    public String remand(@PathVariable("record_id") Integer record_id){
        //        获取当前时间
        System.out.println(record_id);
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        String day = formatter.format(date);

        recordService.update(day,record_id);

        return "redirect:/record/query";
    }
}
