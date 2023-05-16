package com.kbstar.service;

import com.kbstar.dto.Cust;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.CustMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class CustService implements KBService<String, Cust> {
    @Autowired
    CustMapper mapper;

    @Override
    public void register(Cust cust) {
        mapper.insert(cust);
        log.info("Send Mail..." + cust.getId());
    }

    @Override
    public void remove(String s) {
        mapper.delete(s);
    }

    @Override
    public void modify(Cust cust) {
        mapper.update(cust);
    }

    @Override
    public Cust get(String s) {
        return mapper.select(s);
    }

    @Override
    public List<Cust> getall() {
        return null;
    }

    @Override
    public List<Cust> get() throws Exception {
        return mapper.selectall();
    }


}
