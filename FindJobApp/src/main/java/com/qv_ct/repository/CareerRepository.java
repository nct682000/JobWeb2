/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository;

import com.qv_ct.pojos.Career;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface CareerRepository {

    List<Career> getCareers();

    boolean addOrUpdate(Career c);

    boolean deleteCareer(int id);
}
