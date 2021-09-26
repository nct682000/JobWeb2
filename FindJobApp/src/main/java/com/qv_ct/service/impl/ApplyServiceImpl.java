/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qv_ct.pojos.Apply;
import com.qv_ct.repository.ApplyRepository;
import com.qv_ct.service.ApplyService;
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
public class ApplyServiceImpl implements ApplyService{
    @Autowired
    private ApplyRepository applyRepository;
    
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Apply> getApplies() {
        return this.applyRepository.getApplies();
    }

    @Override
    public boolean addOrUpdate(Apply a) {
        try {
            if(!a.getFile().isEmpty()){
                Map map = this.cloudinary.uploader().upload(a.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));

                a.setCv((String) map.get("secure_url"));
            }
            return this.applyRepository.addOrUpdate(a);

        } catch (IOException ex) {
            System.err.println("-----Add Error-----" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<Apply> getAppliesByUserId(int id) {
        return this.applyRepository.getAppliesByUserId(id);
    }
    
}
