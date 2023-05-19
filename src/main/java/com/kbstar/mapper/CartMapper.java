package com.kbstar.mapper;

import com.kbstar.dto.Cart;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CartMapper extends KBMapper<Integer, Cart> {
    public List<Cart> selectid(String cid);

    public Cart cartcheck(Cart cart);

    public void update_shop(Cart cart);

    public void afterOrder(String id);

    public int mycartcnt(String id);
}
