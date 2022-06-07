package com.heroxin.mapper;

import com.heroxin.daomain.Book;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Heroxin
 * @create 2022-05-21-10:32
 * @Description:
 */
@Mapper
public interface BookMapper{
    @Insert("insert into book values( " +
            "#{book_id}," +
            "#{book_name}," +
            "#{book_isbn}," +
            "#{book_press}," +
            "#{book_author}," +
            "#{book_pagination}," +
            "#{book_price}," +
            "#{book_uploadtime}," +
            "#{book_status}," +
            "#{book_borrower}," +
            "#{book_borrowtime},"+
            "#{book_returntime})")
    void insert(Book book);

    @Delete("delete from book where book_id = #{book_id}")
    void delete(Integer book_id);

    @Update("update book set" +
            " book_name=#{book_name}," +
            " book_isbn=#{book_isbn}," +
            " book_press=#{book_press}," +
            " book_author=#{book_author}," +
            " book_price=#{book_price}," +
            " book_uploadtime=#{book_uploadtime}," +
            " book_status=#{book_status}," +
            " book_borrower=#{book_borrower}," +
            " book_borrowtime=#{book_borrowtime} " +
            " where" +
            " book_id=#{book_id}")
    void update(Book book);

    @Update("update book set" +
            " book_borrower=#{book_borrower}," +
            " book_borrowtime=#{book_borrowtime} " +
            " where" +
            " book_id=#{book_id}")
    void updateById(@Param("book_borrower") String book_borrower, @Param("book_borrowtime") String book_borrowtime,@Param("book_id") Integer book_id);
    @Update("update book set" +
            " book_pagination=#{book_pagination} " +
            " where" +
            " book_id=#{book_id}")
    void updatelogo(@Param("book_pagination") String book_pagination, @Param("book_id") Integer book_id);

    @Select("select * from book where book_id = #{book_id}")
    Book query(Integer book_id);

    @Select("select * from book")
    List<Book> queryAll();

    //    分页查询
    @Select("select * from book limit #{start},#{count};")
    //    此处 @Param 重要，用于绑定参数，便于系统识别，不可省略，不然爆 500
    List<Book> queryAllPages(@Param("start") int start,@Param("count") int count);
    //    查询书籍个数
    @Select("select count(*) from book")
    Integer queryNum();


    //    用 $
    @Select({
            "<script>"+
                    "select * from book where 1=1"+
                    "<if test = 'book_name != null'> and book_name like '%${book_name}%'</if>"+
                    "<if test = 'book_author != null'> and book_author like '%${book_author}%'</if>"+
                    "<if test = 'book_isbn != null'> and book_isbn like '%${book_isbn}%'</if>"+
            "</script>"
    })
    List<Book> select(
            @Param("book_name") String book_name,
            @Param("book_author") String book_author,
            @Param("book_isbn") String book_isbn
            );

}
