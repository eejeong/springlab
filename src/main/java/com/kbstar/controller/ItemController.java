package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    ItemService itemService;
    String dir = "item/";

    @Value("${uploadimgdir}")
    String imgdir;

    @RequestMapping("/shop")
    public String all(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Item> p;
        List<Item> clist;
        try {
            p = new PageInfo<>(itemService.getPage(pageNo), 5);
            clist = p.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception("시스템 장애 : ER0002");
        }
        model.addAttribute("target", "item");
        model.addAttribute("clist", clist);
        model.addAttribute("cpage", p);
        model.addAttribute("center", dir + "shop");
        return "index";
    }

    @RequestMapping("/detail")
    public String get(Model model, Integer id) throws Exception {
        Item item = null;
        item = itemService.get(id);
        model.addAttribute("gitem", item);
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/search")
    public String search(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, ItemSearch csearch) throws Exception {
        PageInfo<Item> p;
        List<Item> clist;
        try {
            p = new PageInfo<>(itemService.getpagesearch(pageNo, csearch.getName()), 5);
            clist = p.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "item");
        model.addAttribute("clist", clist);
        model.addAttribute("cpage", p);
        model.addAttribute("center", dir + "shop");
        return "index";
    }

    @RequestMapping("/searchcategory")
    public String searchcategory(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, ItemSearch csearch) throws Exception {
        PageInfo<Item> p;
        List<Item> clist;
        try {
            p = new PageInfo<>(itemService.getpagecate(pageNo, csearch.getCategory()), 5);
            clist = p.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "item");
        model.addAttribute("clist", clist);
        model.addAttribute("cpage", p);
        model.addAttribute("center", dir + "shop");
        return "index";
    }

}