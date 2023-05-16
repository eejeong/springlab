package com.kbstar.frame;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface KBMapper<K,V>{
    public void insert(V v);
    public void delete(K k);
    public void update(V v);
    public V select(K k);
    public List<V> selectall();
}
