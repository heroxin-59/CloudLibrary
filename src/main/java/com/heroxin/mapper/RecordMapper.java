package com.heroxin.mapper;

import com.heroxin.daomain.Record;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Heroxin
 * @create 2022-05-21-10:33
 * @Description:
 */
@Mapper
public interface RecordMapper {

//    查询借阅记录
    @Select("select * from record")
    List<Record> query();

//    新增借阅
    @Insert("insert into record values(" +
            "#{record_id}," +
            "#{record_bookname}," +
            "#{record_bookisbn}," +
            "#{record_borrower}," +
            "#{record_borrowtime}," +
            "#{record_remandtime})")
    void insert(Record record);

//    更新借阅，归还图书;
//    管理员确认归还
    @Update("update record set " +
            "record_remandtime = #{record_remandtime} " +
            "where record_id = #{record_id} ")
    void update(@Param("record_remandtime") String record_remandtime,@Param("record_id") Integer record_id);
}
