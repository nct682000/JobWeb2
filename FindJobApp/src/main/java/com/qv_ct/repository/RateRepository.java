/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository;

import com.qv_ct.pojos.Rate;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface RateRepository {
    Rate addOrUpdate(Rate r);
    long rateCountRecruiter(int recId);
    double ratePointRecruiter(int recId);
    List<Rate> getRate(int canId, int recId);
    
//    chart
    List<Object[]> rateForChart(int year);
        List<Object[]> rateForChart2(int year, int month);

}
