package com.kbstar.contact;

import com.kbstar.service.ContactService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest {
    @Autowired
    ContactService service;
    @Test
    void contextLoads() {
        try {
            service.getall();
        } catch (Exception e) {
            log.info("★★★★★★★★★★★★★★★ERROR★★★★★★★★★★★★★★★");
            e.printStackTrace();
        }
    }

}
