package com.kbstar.controller;

import com.kbstar.dto.Contact;
import com.kbstar.dto.Cust;
import com.kbstar.service.ContactService;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class MainController {

    @Value("${adminserver}")
    String serviceserver;

    @Autowired
    ContactService contactService;

    @Autowired
    CustService custService;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        model.addAttribute("center", "center");
        return "index";
    }

    @RequestMapping("/cart")
    public String about(Model model) throws Exception {
        model.addAttribute("center", "cart");
        return "index";
    }

    @RequestMapping("/contact")
    public String contact(Model model) throws Exception {
        model.addAttribute("center", "contact");
        return "index";
    }

    @RequestMapping("/shop")
    public String shop(Model model) throws Exception {
        model.addAttribute("center", "shop");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model) throws Exception {
        model.addAttribute("center", "detail");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        log.info("★★★★★★★★★★" + id + " " + pwd);
        Cust cust = null;
        String nextPage = "loginfail";

        try {
            cust = custService.get(id);
            if (cust != null && encoder.matches(pwd, cust.getPwd())) {
                nextPage = "loginok";
                session.setMaxInactiveInterval(100000);
                session.setAttribute("logincust", cust);
            }

        } catch (Exception e) {
            throw new Exception("시스템장애입니다. 잠시후 다시 로그인 하세요!");
        }
        model.addAttribute("center", nextPage);
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping(value = "/registerimpl")
    public String registerImpl(Model model,
                               Cust cust, String zipcode, String address1, String address2, HttpSession session) throws Exception {
        try {
            cust.setPwd(encoder.encode(cust.getPwd()));
            cust.setAddress(address1 + " " + address2 + " (" + zipcode + ")");
            custService.register(cust);
            session.setAttribute("logincust", cust);
        } catch (Exception e) {
            throw new Exception("가입 오류");
        }
        model.addAttribute("rcust", cust);
        model.addAttribute("center", "registerok");
        return "index";
    }


    @RequestMapping("/contactimpl")
    public String contactimpl(Model model, Contact contact, HttpSession session) throws Exception {
        log.info((contact) + "실패=");
        try {
            contactService.register(contact);
            log.info(contact.toString());
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("실패");
        }
        model.addAttribute("center", "center");
        return "index";
    }
}
