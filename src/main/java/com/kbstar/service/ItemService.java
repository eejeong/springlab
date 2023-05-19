package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ItemService implements KBService<Integer, Item> {
    @Autowired
    ItemMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param item
     */
    @Override
    public void register(Item item) {
        mapper.insert(item);
    }

    @Override
    public void remove(Integer id) {
        mapper.delete(id);
    }

    @Override
    public void modify(Item item) {
        mapper.update(item);
    }

    @Override
    public Item get(Integer id) {
        return mapper.select(id);
    }


    @Transactional(readOnly = true)
    @Override
    public List<Item> get() throws Exception {
        return mapper.selectall();
    }

    public Page<Item> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 6); // 3: 한화면에 출력되는 개수
        return mapper.getpage();
    }

    public Page<Item> getpagesearch(int pageNo, String name) throws Exception {
        PageHelper.startPage(pageNo, 6); // 3: 한화면에 출력되는 개수
        return mapper.getpagesearch(name);
    }

    public Page<Item> getpagecate(int pageNo, String category) throws Exception {
        PageHelper.startPage(pageNo, 6); // 3: 한화면에 출력되는 개수
        return mapper.getpagecate(category);
    }


    public List<Item> search(ItemSearch csearch) throws Exception {
        return mapper.search(csearch);
    }

    public List<Item> searchcategory(ItemSearch csearch) throws Exception {
        return mapper.searchcategory(csearch);
    }
}
