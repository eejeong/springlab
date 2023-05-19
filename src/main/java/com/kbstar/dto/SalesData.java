package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class SalesData {
    private int sum;
    private int avg;
    private int max;
    private int min;
}
