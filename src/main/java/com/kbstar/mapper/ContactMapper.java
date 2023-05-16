package com.kbstar.mapper;

import com.kbstar.dto.Contact;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ContactMapper extends KBMapper<String,Contact> {
    //select는 String cust id로 하고 delete는 Integer id로 하고 싶다..
    public void cdelete(Integer s);
    public List<Contact> selectid(String s);
}
