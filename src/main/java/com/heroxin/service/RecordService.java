package com.heroxin.service;

import com.heroxin.daomain.Record;

import java.util.List;

/**
 * @author Heroxin
 * @create 2022-05-21-10:33
 * @Description:
 */
public interface RecordService {

    List<Record> query();

    void insert(Record record);

    void update(String record_remandtime,Integer record_id);

}
