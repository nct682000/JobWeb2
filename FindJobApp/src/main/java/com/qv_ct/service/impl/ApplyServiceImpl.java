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
public class ApplyServiceImpl implements ApplyService {

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
            if (!a.getFile().isEmpty()) {
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
    public Apply getApplyByApplyId(int id) {
        return this.applyRepository.getApplyByApplyId(id);
    }
    
    @Override
    public Apply hiddenApply(int applyId) {
        System.out.println("---------------------Service--------------------");
        Apply a = this.applyRepository.getApplyByApplyId(applyId);
        return this.applyRepository.hiddenApply(a);
    }
    
    @Override
    public List<Apply> getAppliesByUserId(int id) {
        return this.applyRepository.getAppliesByUserId(id);
    }

    @Override
    public List<Apply> getAppliesByRecruiter(int recId) {
        return this.applyRepository.getAppliesByRecruiter(recId);
    }

    //    -------------     admin       --------------
    @Override
    public List<Apply> getApply_Admin(int page, boolean active, String title, String dateFilter) {
        return this.applyRepository.getApply_Admin(page, active, title, dateFilter);
    }

//    @Override
//    public long countApply_Admin(boolean active) {
//        return this.applyRepository.countApply_Admin(active);
//    }
    @Override
    public int countApply_Admin(boolean active, String title, String dateFilter) {
        return this.applyRepository.countApply_Admin(active, title, dateFilter);
    }

    @Override
    public boolean enableApply(int applyId, boolean active) {
        return this.applyRepository.enableApply(applyId, active);
    }

    @Override
    public boolean deleteApply(int applyId) {
        return this.applyRepository.deleteApply(applyId);
    }

    @Override
    public long countApply_Admin_For_Chart(boolean active, int month, int year) {
        return this.applyRepository.countApply_Admin_For_Chart(active, month, year);
    }

    @Override
    public List<Object[]> countApply_ByCompany_ForChart(int year) {
        return this.applyRepository.countApply_ByCompany_ForChart(year);
    }

    @Override
    public List<Object[]> countApply_ByCompany2_ForChart(int year, int month) {
        return this.applyRepository.countApply_ByCompany2_ForChart(year, month);
    }

    @Override
    public List<Object[]> countApply_ByJob_ForChart(int year) {
        return this.applyRepository.countApply_ByJob_ForChart(year);
    }

    @Override
    public List<Object[]> countApply_ByJob2_ForChart(int year, int month) {
        return this.applyRepository.countApply_ByJob2_ForChart(year, month);
    }

    @Override
    public List<Object[]> countApply_ByCity_ForChart(int year) {
        return this.applyRepository.countApply_ByCity_ForChart(year);
    }

    @Override
    public List<Object[]> countApply_ByCity2_ForChart(int year, int month) {
        return this.applyRepository.countApply_ByCity2_ForChart(year, month);
    }
    
    @Override
    public List<Object[]> getApplyById(int applyId) {
        return this.applyRepository.getApplyById(applyId);
    }
    

}
