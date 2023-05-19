package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Contact {
    private int id;
    private String cust_id;
    private String email;
    private String msg;
    private String rdate;

    public Contact(String email, String msg) {
        this.email = email;
        this.msg = msg;
    }

}
