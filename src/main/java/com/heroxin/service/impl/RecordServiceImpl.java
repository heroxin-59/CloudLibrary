package com.heroxin.service.impl;

import com.heroxin.daomain.Record;
import com.heroxin.mapper.RecordMapper;
import com.heroxin.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Heroxin
 * @create 2022-05-21-10:34
 * @Description:
 */
@Service
public class RecordServiceImpl implements RecordService {
    @Autowired
    private RecordMapper recordMapper;

    @Override
    public List<Record> query() {
        return recordMapper.query();
    }

    @Override
    public void insert(Record record) {
        recordMapper.insert(record);
    }

    @Override
    public void update(String record_remandtime ,Integer record_id) {
        recordMapper.update(record_remandtime,record_id);
    }
}
