package com.kbstar.controller;

import com.kbstar.dto.Sales;
import com.kbstar.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
public class AjaxImplController {

    @Autowired
    SalesService salesService;


    @RequestMapping("/getdatasales")
    public Object getdatasales(String month) throws Exception {
        List<Sales> list = null;
        list = salesService.getdatasales(month);
        JSONArray ja = new JSONArray();
        for (Sales obj : list) {
            ja.add(obj.getPrice());
        }
        return ja;
    }

    @RequestMapping("/getdatasalessum")
    public Object getdatasalessum(String month) throws Exception {
        List<Sales> list = null;
        list = salesService.getdatasalessum();
        JSONArray jaM = new JSONArray();
        JSONArray jaF = new JSONArray();
        JSONArray jaS = new JSONArray();
        for (Sales obj : list) {
            if (obj.getGender().equals("M")) {
                jaM.add(obj.getPrice());
            } else {
                jaF.add(obj.getPrice());
            }
        }
        for (int i = 0; i < 12; i++) {
            jaS.add((Integer) jaM.get(i) + (Integer) jaF.get(i));
        }
        JSONObject jo = new JSONObject();
        jo.put("Male", jaM);
        jo.put("Female", jaF);
        jo.put("Sum", jaS);
        return jo;
    }
}
