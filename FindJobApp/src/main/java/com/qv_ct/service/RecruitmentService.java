/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service;

import com.qv_ct.pojos.Recruitment;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface RecruitmentService {

    List<Recruitment> getRecruitments(int page);

    List<Recruitment> searchRecruitments(String kw, int careerId, int provinceId,
            int form, int salary);

    List<Object[]> getRecruitmentByApply(int num);

    Recruitment getRecruitmentById(int id);

    boolean addOrUpdate(Recruitment r);

    long countRecruitment();

    List<Recruitment> getRecruitmentByUserId(int userId);

    Recruitment switchActiveRecruitment(int recruitmentId);
    List<Object[]> recruitmentStats(int userId, Date from, Date to);

    //    --------------    admin   -------------------
    List<Recruitment> getRecruitments_Admin(int page, long salaryFrom, long salaryTo, boolean active, String title, int caseSearch);

    int countRecruitment_Admin(long salaryFrom, long salaryTo, boolean active, String title, int caseSearch);

    boolean enableRecruitment(int recId, boolean active);

    boolean deleteRecruitment(int recId);
}
