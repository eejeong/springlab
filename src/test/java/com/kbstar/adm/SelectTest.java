package com.kbstar.adm;

import com.kbstar.service.AdmService;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest {
    @Autowired
    AdmService service;

    @Test
    void contextLoads() {
        try {
            service.get();
        } catch (Exception e) {
            log.info("에러...");
            //e.printStackTrace();
        }
    }}
