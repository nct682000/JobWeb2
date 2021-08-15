/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service.impl;

import com.qv_ct.pojos.Recruitment;
import com.qv_ct.repository.RecruitmentRepository;
import com.qv_ct.service.RecruitmentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nct68
 */
@Service
public class RecruitmentServiceImpl implements RecruitmentService{
    @Autowired
    private RecruitmentRepository recruitmentRepository;
    
    @Override
    public List<Recruitment> getRecruitments(String kw) {
        return this.recruitmentRepository.getRecruitments(kw);
    }
    
}
