package com.kbstar.contact;

import com.kbstar.dto.Contact;
import com.kbstar.mapper.ContactMapper;
import com.kbstar.service.ContactService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

@Slf4j
@SpringBootTest
class   InsertTest {
    @Autowired
    ContactService service;
    @Test
        void contextLoads() {
            Contact obj = new Contact("ny1223@naver.com","결제 취소 문의드립니다.");
            try {
                service.register(obj);
                service.getall();
                log.info("등록 정상...");
            } catch (Exception e) {
                log.info("★★★★★★★★★★★★★★★시스템 장애입니다.★★★★★★★★★★★★★★★");
                e.printStackTrace();
        }
    }
}
