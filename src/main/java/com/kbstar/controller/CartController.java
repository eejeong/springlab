package com.kbstar.controller;

import com.kbstar.dto.Cart;
import com.kbstar.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    CartService cartService;

    @RequestMapping("")
    public String main(Model model, String id) throws Exception {
        List<Cart> list = null;
        try {
            list = cartService.getid(id);
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        model.addAttribute("list", list);
        model.addAttribute("center", "cart");
        return "index";
    }

    @RequestMapping("/delete")
    public String delete(Cart cart) throws Exception {
        cartService.remove(cart.getId());
        return "redirect:/cart?id=" + cart.getCust_id();
    }

    @RequestMapping("/update_shop")
    public String update_shop(Cart cart, Integer detail_cnt) throws Exception {
        int cnt = cart.getCnt() + detail_cnt;
        cart.setCnt(cnt);
        cartService.modify_shop(cart);
        return "redirect:/cart?id=" + cart.getCust_id();
    }


    @RequestMapping("/insert")
    public String insert(Cart cart) throws Exception {
        cartService.register(cart);
        return "redirect:/cart?id=" + cart.getCust_id();
    }

    @RequestMapping("/update")
    public String update(Cart cart) throws Exception {
        cartService.modify(cart);
        return "redirect:/cart?id=" + cart.getCust_id();
    }
}
