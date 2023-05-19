package com.kbstar.mapper;

import com.kbstar.dto.Contact;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ContactMapper extends KBMapper<Integer, Contact> {

}
