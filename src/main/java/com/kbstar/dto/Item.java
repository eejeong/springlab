package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Item {
    private int id;
    private String name;
    private int price;
    private String imgname;
    private String category;
    private String size_s;
    private String size_m;
    private String size_l;
    private Date rdate;

    private MultipartFile img;

}
