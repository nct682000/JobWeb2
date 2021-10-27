/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository;

import com.qv_ct.pojos.Apply;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface ApplyRepository {

    List<Apply> getApplies();

    List<Apply> getAppliesByUserId(int id);

    List<Apply> getAppliesByRecruiter(int recId);

    boolean addOrUpdate(Apply a);

    //    -------------     admin       --------------
    List<Apply> getApply_Admin(int page, boolean active, String title);

    long countApply_Admin(boolean active);

    boolean enableApply(int applyId, boolean active);

    boolean deleteApply(int applyId);

    long countApply_Admin_For_Chart(boolean active, int month, int year);

    List<Object[]> countApply_ByCompany_ForChart(int year);

    List<Object[]> countApply_ByCompany2_ForChart(int year, int month);

    List<Object[]> countApply_ByJob_ForChart(int year);
    
    List<Object[]> countApply_ByJob2_ForChart(int year, int month);

    List<Object[]> countApply_ByCity_ForChart(int year);
    
    List<Object[]> countApply_ByCity2_ForChart(int year, int month);

}
