package com.kbstar.contact;

import com.kbstar.dto.Contact;
import com.kbstar.service.ContactService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    ContactService service;
    @Test
    void contextLoads() {
        Contact contact= new Contact(1000,"id01","ny1223@naver.com","청바지 재입고 연락 부탁드립니다.",null);
        try {
            service.modify(contact);
            service.getall();
        } catch (Exception e) {
            log.info("★★★★★★★★★★★★★★★ERROR★★★★★★★★★★★★★★★");
            e.printStackTrace();
        }
    }

}
