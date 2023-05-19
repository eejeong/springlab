package com.kbstar.service;


import com.kbstar.dto.Contact;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ContactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ContactService implements KBService<Integer, Contact> {
    @Autowired
    ContactMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param contact
     */
    @Override
    public void register(Contact contact) throws Exception {

    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Contact contact) throws Exception {

    }

    @Override
    public Contact get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<Contact> get() throws Exception {
        return mapper.selectall();
    }


}
