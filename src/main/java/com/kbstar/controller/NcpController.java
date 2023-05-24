package com.kbstar.controller;

import com.kbstar.dto.Ncp;
import com.kbstar.util.CFRCelebrityUtil;
import com.kbstar.util.CFRFaceUtil;
import com.kbstar.util.FileUploadUtil;
import com.kbstar.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
public class NcpController {
    // img 경로 설정
    @Value("${uploadimgdir}")
    String imgpath;
    @Autowired
    CFRCelebrityUtil celebrityUtil;
    @Autowired
    CFRFaceUtil faceUtil;

    @RequestMapping("/cfr1impl")
    public String cfr1impl(Model model, Ncp ncp) throws ParseException {
        // img 저장
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        // NCP 에 요청
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) celebrityUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        // CFRCelebrityTests 결과
        // {"faces":[{"celebrity":{"confidence":1.0,"value":"마동석"}}],"info":{"size":{"width":275,"height":183},"faceCount":1}}
        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);
        JSONObject celebrity = (JSONObject) obj.get("celebrity");
        String value = (String) celebrity.get("value");

        // 결과를 받는다
        model.addAttribute("result", value);
        model.addAttribute("center", "cfr1");
        return "index";
    }

    @RequestMapping("/cfr2impl")
    public String cfr2impl(Model model, Ncp ncp) throws ParseException {
        // img 저장
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        // NCP 에 요청
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) faceUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        // CFRFaceTests
        // {"faces":[{"emotion":{"confidence":1.0,"value":"neutral"},"gender":{"confidence":0.999998,"value":"male"},"pose":{"confidence":0.998774,"value":"frontal_face"},"landmark":{"nose":{"x":143,"y":57},"rightMouth":{"x":147,"y":68},"rightEye":{"x":155,"y":46},"leftMouth":{"x":132,"y":65},"leftEye":{"x":134,"y":42}},"roi":{"x":118,"width":49,"y":28,"height":49},"age":{"confidence":0.778398,"value":"34~38"}}],"info":{"size":{"width":275,"height":183},"faceCount":1}}
        String emotion_value = "";
        String gender_value = "";
        String pose_value = "";
        String age_value = "";

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);

        JSONObject emotion = (JSONObject) obj.get("emotion");
        emotion_value = (String) emotion.get("value");

        JSONObject gender = (JSONObject) obj.get("gender");
        gender_value = (String) gender.get("value");

        JSONObject pose = (JSONObject) obj.get("pose");
        pose_value = (String) pose.get("value");

        JSONObject age = (JSONObject) obj.get("age");
        age_value = (String) age.get("value");

        // JSONObject values = new JSONObject();
        // values.put("emotion_value", emotion_value);
        // values.put("gender_value", gender_value);
        // values.put("pose_value", pose_value);
        // values.put("age_value", age_value);
        // model.addAttribute("result", values);

        Map<String, String> map = new HashMap<>();
        map.put("emotion", emotion_value);
        map.put("pose", pose_value);
        map.put("age", age_value);
        map.put("gender", gender_value);

        // 결과를 받는다
        model.addAttribute("result", map);
        model.addAttribute("center", "cfr2");
        return "index";
    }

    @RequestMapping("/mycfr")
    public String mycfr(Model model, String imgname) throws ParseException {

        JSONObject result = (JSONObject) faceUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        String emotion_value = "";
        String gender_value = "";
        String pose_value = "";
        String age_value = "";

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);

        JSONObject emotion = (JSONObject) obj.get("emotion");
        emotion_value = (String) emotion.get("value");

        JSONObject gender = (JSONObject) obj.get("gender");
        gender_value = (String) gender.get("value");

        JSONObject pose = (JSONObject) obj.get("pose");
        pose_value = (String) pose.get("value");

        JSONObject age = (JSONObject) obj.get("age");
        age_value = (String) age.get("value");

        Map<String, String> map = new HashMap<>();
        map.put("emotion", emotion_value);
        map.put("pose", pose_value);
        map.put("age", age_value);
        map.put("gender", gender_value);

        // 결과를 받는다
        model.addAttribute("result", map);
        model.addAttribute("center", "pic");
        return "index";
    }


    @RequestMapping("/ocr1impl")
    public String ocr1impl(Model model, Ncp ncp) throws ParseException {

        // img 저장
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        // NCP 에 요청
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) OCRUtil.getResult(imgpath, imgname);
        Map map = OCRUtil.getData(result);
        log.info(map.values().toString());

        model.addAttribute("result", map);
        model.addAttribute("center", "ocr1");
        return "index";
    }

    @RequestMapping("/ocr2impl")
    public String ocr2impl(Model model, Ncp ncp) throws ParseException {

        // img 저장
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        // NCP 에 요청
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) OCRUtil.getResult(imgpath, imgname);
        Map map = OCRUtil.getData(result);
        log.info(map.values().toString());

        model.addAttribute("result", map);
        model.addAttribute("center", "ocr2");
        return "index";
    }
}
