/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository;

import com.qv_ct.pojos.Recruitment;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface RecruitmentRepository {
    List<Recruitment> getRecruitments(int page);
    List<Recruitment> searchRecruitment(String kw, int careerId, int provinceId,
                                        int form, int salary);
    List<Object[]> getRecruitmentByApply(int num);
    Recruitment getRecruitmentById(int id);
    List<Recruitment> getRecruitmentByUserId(int userId);
    boolean addOrUpdate(Recruitment r);
    long countRecruitment();
    Recruitment hideRecruitment(Recruitment r);
    
    //    -------------     admin       --------------
    List<Recruitment> getRecruitmentsAll();
}
