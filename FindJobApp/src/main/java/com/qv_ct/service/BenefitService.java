/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service;

import com.qv_ct.pojos.Benefit;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface BenefitService {

    List<Benefit> getBenefits();

    boolean addOrUpdate(Benefit b);

    boolean deleteBenefit(int id);
}
