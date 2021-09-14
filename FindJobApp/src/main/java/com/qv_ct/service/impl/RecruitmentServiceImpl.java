/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qv_ct.pojos.Recruitment;
import com.qv_ct.repository.RecruitmentRepository;
import com.qv_ct.service.RecruitmentService;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
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
//    @Autowired
//    private Cloudinary cloudinary;
    
    @Override
    public List<Recruitment> getRecruitments(int page) {
        return this.recruitmentRepository.getRecruitments(page);
    }
    
    @Override
    public Recruitment getRecruitmentById(int id) {
        return this.recruitmentRepository.getRecruitmentById(id);
    }
    
    @Override
    public List<Recruitment> searchRecruitments(String kw, int careerId, int provinceId,
                                        int form, int salary) {
        return this.recruitmentRepository.searchRecruitment(kw, careerId, provinceId, form, salary);
    }

    @Override
    public boolean addOrUpdate(Recruitment r) {
        
        try {
//            Map map = this.cloudinary.uploader().upload(r.getFile().getBytes(),
//                    ObjectUtils.asMap("resource_type", "auto"));
//            String img = (String) map.get("secure_url");
            return this.recruitmentRepository.addOrUpdate(r);

        } catch (Exception ex) {
            System.err.println("-----Add Error-----" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public long countRecruitment() {
        return this.recruitmentRepository.countRecruitment();
    }
    
    //    -----------   admin   ------------------
    @Override
    public List<Recruitment> getRecruitmentsAll() {
        return this.recruitmentRepository.getRecruitmentsAll();
    }

    @Override
    public List<Object[]> getRecruitmentByComment(int num) {
        return this.recruitmentRepository.getRecruitmentByComment(num);
    }
    
    
    
}
