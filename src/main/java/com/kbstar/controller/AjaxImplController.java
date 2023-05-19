package com.kbstar.controller;

import com.kbstar.dto.Cart;
import com.kbstar.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class AjaxImplController {
    @Autowired
    CartService cartService;

    @RequestMapping("/cartcheck")
    public Object cartcheck(Cart cart) {
        Cart rcart = cartService.cartcheck(cart);
        int result = 0;
        if (rcart == null) {
            return result;
        } else {
            result = rcart.getCnt();
            return result;
        }
    }

    @RequestMapping("/mycartcnt")
    public Object mycartcnt(String id) throws Exception {
        int result = 0;
        log.info(id);
        log.info("********************************");
        if (id == null) {
            return result;
        } else {
            result = cartService.mycartcnt(id);
            return result;
        }
    }

}
