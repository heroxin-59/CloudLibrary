package com.heroxin.daomain;

import lombok.Data;

/**
 * @author Heroxin
 * @create 2022-05-19-16:54
 * @Description:
 */
@Data
public class User {
    private Integer user_id;
    private String user_name;
    private String user_password;
    private String user_email;
    private String user_role;
    private String user_status;
}
