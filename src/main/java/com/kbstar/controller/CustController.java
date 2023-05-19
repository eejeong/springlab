package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/cust")
public class CustController {

    @Autowired
    CustService custService;
    String dir = "cust/";

    @Autowired
    BCryptPasswordEncoder encoder;

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, String id) throws Exception {
        Cust cust = null;
        String reset = "1234";
        cust = custService.get(id);
        cust.setPwd(encoder.encode(reset));
        custService.modify(cust);
        return "redirect:/";
    }

}
