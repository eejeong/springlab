package com.kbstar.weather;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Calendar;


@Slf4j
@SpringBootTest
class CalanderTest {

    @Test
    void contextLoads() throws Exception {
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH)+1;
        int day = c.get(Calendar.DATE);

        String month_str = month+"";
        if(month_str.length() == 1){
            month_str = "0"+month_str;
        }
        String today = ""+year+month_str+day+"0600";
        log.info(today);
        // 202305100600
        // month값이 5로 나와서 month_str 값을 05로 출력
    }
}
