package com.kbstar.service;

import com.kbstar.dto.Contact;
import com.kbstar.dto.Cust;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ContactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactService implements KBService<String, Contact> {
    @Autowired
    ContactMapper contactMapper;

    public List<Contact> getid(String s) {
        List<Contact> list = contactMapper.selectid(s);
        return list;
    }

    public void remove(Integer s) {
        contactMapper.cdelete(s);
    }

    @Override
    public void register(Contact contact) {
        contactMapper.insert(contact);
    }


    @Override
    public void remove(String s) {
    }

    @Override
    public void modify(Contact contact) {
        contactMapper.update(contact);
    }

    @Override
    public Contact get(String s) {
        Contact contact = contactMapper.select(s);
        return contact;
    }

    @Override
    public List<Contact> getall() {
        List<Contact> list = contactMapper.selectall();
        return list;
    }

    @Override
    public List<Cust> get() throws Exception {
        return null;
    }
}
