/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository;

import com.qv_ct.pojos.Apply;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface ApplyRepository {
    List<Apply> getApplies();   
    List<Apply> getAppliesByUserId(int id);
    boolean addOrUpdate(Apply a);
    
//    admin
    List<Apply> getApplyAll(int page);
    long countApplies();
}
