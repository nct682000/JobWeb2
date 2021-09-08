/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service;

import com.qv_ct.pojos.Recruitment;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface RecruitmentService {
    List<Recruitment> getRecruitments(int page);
    List<Recruitment> searchRecruitments(String kw);
    Recruitment getRecruitmentById(int id);
    boolean addOrUpdate(Recruitment r);
    long countRecruitment();
    
    //    --------------    admin   -------------------
    List<Recruitment> getRecruitmentsAll();
}
