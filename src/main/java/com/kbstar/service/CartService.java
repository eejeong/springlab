package com.kbstar.service;

import com.kbstar.dto.Cart;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService implements KBService<Integer, Cart> {

    @Autowired
    CartMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param cart
     */
    @Override
    public void register(Cart cart) throws Exception {
        mapper.insert(cart);
    }

    @Override
    public void remove(Integer s) throws Exception {
        mapper.delete(s); //
    }

    @Override
    public void modify(Cart Cart) throws Exception {
        mapper.update(Cart);
    }

    @Override
    public Cart get(Integer s) throws Exception {
        return null;
    }

    public List<Cart> getid(String s) {
        List<Cart> list = mapper.selectid(s);
        return list;
    }

    @Override
    public List<Cart> get() throws Exception {
        return null;
    }

    public Cart cartcheck(Cart cart) {
        Cart rcart = mapper.cartcheck(cart);
        return rcart;
    }

    public void modify_shop(Cart cart) throws Exception {
        mapper.update_shop(cart);
    }

    public void afterOrder(String id) throws Exception {
        mapper.afterOrder(id);
    }

    public int mycartcnt(String id) throws Exception {
        int result = mapper.mycartcnt(id);
        return result;
    }
}
