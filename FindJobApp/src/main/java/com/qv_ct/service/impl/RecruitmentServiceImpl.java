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
    public List<Recruitment> getRecruitments(String kw, int page) {
        return this.recruitmentRepository.getRecruitments(kw, page);
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
    
}
