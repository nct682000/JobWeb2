/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service.impl;

import com.qv_ct.pojos.Benefit;
import com.qv_ct.repository.BenefitRepository;
import com.qv_ct.service.BenefitService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nct68
 */
@Service
public class BenefitServiceImpl implements BenefitService {

    @Autowired
    private BenefitRepository benefitRepository;

    @Override
    public List<Benefit> getBenefits() {
        return this.benefitRepository.getBenefits();
    }

    @Override
    public boolean addOrUpdate(Benefit b) {
        return this.benefitRepository.addOrUpdate(b);
    }

    @Override
    public boolean deleteBenefit(int id) {
        return this.benefitRepository.deleteBenefit(id);
    }

}
