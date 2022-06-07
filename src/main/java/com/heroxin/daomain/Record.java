package com.heroxin.daomain;

import lombok.Data;

/**
 * @author Heroxin
 * @create 2022-05-19-16:55
 * @Description:
 */
@Data
public class Record {
    private Integer record_id;
    private String record_bookname;
    private String record_bookisbn;
    private String record_borrower;
    private String record_borrowtime;
    private String record_remandtime;
}
