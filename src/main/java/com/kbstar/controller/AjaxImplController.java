package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Marker;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RestController
//일반적인 controller 는 화면 반환. RestController 는 ajax로 요청한 결과 반환
public class AjaxImplController {
    @RequestMapping("/getservertime")
    public Object getservertime(){
        Date date = new Date();
        return date;
    }

    @RequestMapping("/checkid")
    public Object checkid(String id){
        int result = 0;
        if(id.equals("qqqq") || id.equals("aaaa") || id.equals("ssss")){
            result = 1;
        }
        return result;
    }

    @RequestMapping("/getdata")
    public Object getdata(){
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01", "pwd01", "james1"));
        list.add(new Cust("id02", "pwd02", "james2"));
        list.add(new Cust("id03", "pwd03", "james3"));
        list.add(new Cust("id04", "pwd04", "james4"));
        list.add(new Cust("id05", "pwd05", "james5"));

        //Java Object -> JSON
        //JSON(Javascript Object Notation)
        //JSONArrary = [{},{},{},...]
        JSONArray ja = new JSONArray();
        for(Cust obj:list){
            JSONObject jo = new JSONObject();
            Random r = new Random();
            int i = r.nextInt(100)+1;
            jo.put("id", obj.getId());
            jo.put("pwd", obj.getPwd());
            jo.put("name", obj.getName()+i);
            ja.add(jo);
            //JSONObject을 JSONArrary에 추가
        }
        return ja;
    }

    @RequestMapping("/markers")
    public Object markers(String loc){
        List<Marker> list = new ArrayList<>();
        if(loc.equals("s")){
            list.add(new Marker(100, "국밥", "http://www.nate.com", 37.5466178, 126.8748326, "a.jpg", "s" ));
            list.add(new Marker(101, "쌀국수", "http://www.naver.com", 37.5464926, 126.8721821, "b.jpg", "s" ));
            list.add(new Marker(102, "껍데기", "http://www.daum.net", 37.5456178, 126.8728326, "c.jpg", "s" ));
        } else if (loc.equals("d")) {
            list.add(new Marker(103, "국밥", "http://www.nate.com", 35.8716822, 128.5646302, "a.jpg", "d" ));
            list.add(new Marker(104, "짬뽕", "http://www.naver.com", 35.8726822, 128.5636302, "b.jpg", "d" ));
            list.add(new Marker(105, "껍데기", "http://www.daum.net", 35.8736822, 128.5646302, "c.jpg", "d" ));
        } else if (loc.equals("j")) {
            list.add(new Marker(106, "국밥", "http://www.nate.com", 33.4546419, 126.7179249, "a.jpg", "j" ));
            list.add(new Marker(107, "짬뽕", "http://www.naver.com", 33.4536419, 126.7169249, "b.jpg", "j" ));
            list.add(new Marker(108, "껍데기", "http://www.daum.net", 33.4556419, 126.7189249, "c.jpg", "j" ));
        }

        JSONArray ja = new JSONArray();
        for(Marker obj:list){
            JSONObject jo = new JSONObject();
            jo.put("id", obj.getId());
            jo.put("title", obj.getTitle());
            jo.put("target", obj.getTarget());
            jo.put("lat", obj.getLat());
            jo.put("lng", obj.getLng());
            jo.put("img", obj.getImg());
            jo.put("loc", obj.getLoc());
            ja.add(jo);
        }
        return ja;
    }
}
