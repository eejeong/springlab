package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Contact;
import com.kbstar.dto.Cust;
import com.kbstar.dto.SalesData;
import com.kbstar.service.AdmService;
import com.kbstar.service.ContactService;
import com.kbstar.service.CustService;
import com.kbstar.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class MainController {

    @Value("${adminserver}")
    String adminServer;

    @Autowired
    AdmService admService;
    @Autowired
    ContactService contactService;
    @Autowired
    CustService custService;
    @Autowired
    SalesService salesService;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        List<Cust> list = null;
        list = custService.get();
        SalesData salesData = salesService.getdatasalesTotal();
        model.addAttribute("salesData", salesData);
        model.addAttribute("custList", list);
        model.addAttribute("adminserver", adminServer);
        return "index";
    }

    @RequestMapping("/charts")
    public String charts(Model model) {
        model.addAttribute("adminserver", adminServer);
        model.addAttribute("center", "charts");
        return "index";
    }

    @RequestMapping("/loginpage")
    public String loginpage(Model model) {
        model.addAttribute("adminserver", adminServer);
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("adminserver", adminServer);
        model.addAttribute("center", "register");
        return "index";
    }


    @RequestMapping("/logoutimpl")
    public String logout(Model model, HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        log.info("----------------" + id + pwd);
        Adm adm = null;
        try {
            adm = admService.get(id);
            if (adm != null && encoder.matches(pwd, adm.getPwd())) {
                session.setMaxInactiveInterval(1000000);
                session.setAttribute("loginadm", adm);
            }
        } catch (Exception e) {
            throw new Exception("시스템 장애 잠시후 다시 로그인 하세요");
        }
        model.addAttribute("radm", adm);
        return "redirect:/";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Adm adm, HttpSession session) throws Exception {
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.register(adm);
            session.setAttribute("loginadm", adm);
        } catch (Exception e) {
            throw new Exception("가입 오류");
        }
        model.addAttribute("radm", adm);
        return "redirect:/";
    }

    @RequestMapping("/contact")
    public String contact(Model model) throws Exception {
        List<Contact> list = null;
        list = contactService.get();
        model.addAttribute("clist", list);
        model.addAttribute("adminserver", adminServer);
        model.addAttribute("center", "contact");
        return "index";
    }
}
