package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    ItemService itemService;
    //Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    String dir = "item/";

    // 127.0.0.1/cust
    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"center");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Item> list = new ArrayList<>();
        try {
            list = itemService.get();
        } catch (Exception e) {
            throw new Exception("시스템 장애 : ER0002");
        }

        model.addAttribute("allitem", list);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"all");
        return "index";
    }

    @RequestMapping("/allpage")
    public String allpage(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Item> p;
        try {
            p = new PageInfo<>(itemService.getPage(pageNo), 5); // 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception("시스템 장애 : ER0002");
        }
        model.addAttribute("target", "item");
        model.addAttribute("cpage", p);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"allpage");
        return "index";
    }

}
