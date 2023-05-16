package com.kbstar.frame;

import com.kbstar.dto.Cust;

import java.util.List;

public interface KBService<K, V> {
    public void register(V v);

    public void remove(K k);

    public void modify(V v);

    public V get(K k);

    public List<V> getall();

    List<Cust> get() throws Exception;
}
