package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MainController {
    @Autowired
    CustService custService;

    @RequestMapping("/")
    public String main(){
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/custinfo")
    public String custinfo(Model model, String id) throws Exception {
        Cust cust = null;
        try {
            cust = custService.get(id);
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        model.addAttribute("custinfo", cust);
        model.addAttribute("center", "custinfo");
        return "index";
    }

    @RequestMapping("/custinfoimpl")
    public String custinfoimpl(Model model, Cust cust) throws Exception {
        try {
            log.info("---------------------------------------"+cust.getPwd());
            cust.setPwd(encoder.encode(cust.getPwd()));
            custService.modify(cust);
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        return "redirect:/custinfo?id="+cust.getId();
    }
    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session){
        if(session != null){
            session.invalidate();
        }
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        log.info("★★★★★★★★★★"+id+ " "+ pwd);
        Cust cust = null;
        String nextPage ="loginfail";

        try {
            cust = custService.get(id);
            //&&가 2개면, 앞에꺼 실패하면 뒤에껀 안 함
            if(cust != null && encoder.matches(pwd, cust.getPwd())){
                nextPage ="loginok";
                //session에 담은것도 jsp파일에서 $ 로 꺼낼 수 있다
                session.setMaxInactiveInterval(100000);
                session.setAttribute("logincust", cust);
            }

        } catch (Exception e) {
            throw new Exception("시스템장애 잠시후 다시 로그인 하세요!");
        }
        model.addAttribute("center", nextPage);
        return "index";
    }

    @Autowired
    private BCryptPasswordEncoder encoder;

    @RequestMapping(value ="/registerimpl")
    public String registerImpl(Model model,
                               Cust cust, HttpSession session) throws Exception {
        try {
            cust.setPwd(encoder.encode(cust.getPwd()));
            custService.register(cust);
            session.setAttribute("logincust", cust);
        } catch (Exception e) {
            throw new Exception("가입 오류");
        }
        model.addAttribute("rcust", cust);
        model.addAttribute("center", "registerok");
        return "index";
    }

//    String id, String pwd, String name를  CustDTO 로 변경 가능
//    @RequestMapping("/registerimpl")
//    public String registerimpl(Model model, String id, String pwd, String name){
//        logger.info(id+" "+pwd+" "+name);
//        model.addAttribute("center", "register");
//        return "index";
//    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center", "register");
        return "index";
    }

    // /quics?page=bs01
    @RequestMapping("/quics")
    public String quics(String page){
        return page;
    }

}
