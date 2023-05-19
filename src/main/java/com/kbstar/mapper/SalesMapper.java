package com.kbstar.mapper;

import com.kbstar.dto.Sales;
import com.kbstar.dto.SalesData;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface SalesMapper extends KBMapper<String, Sales> {

    public List<Sales> getdatasales(String month);

    public List<Sales> getdatasalessum();

    public SalesData getdatasalesTotal();
}
