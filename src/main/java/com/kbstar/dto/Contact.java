package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Contact {
    private Integer id;
    private String cust_id;
    private String email;
    private String msg;
    private String rdate;

    public Contact(String cust_id, String email, String msg) {
        this.cust_id = cust_id;
        this.email = email;
        this.msg = msg;
    }

}
