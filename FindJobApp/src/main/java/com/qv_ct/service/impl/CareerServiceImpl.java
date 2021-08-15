package com.qv_ct.service.impl;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.qv_ct.pojos.Career;
import com.qv_ct.repository.CareerRepository;
import com.qv_ct.service.CareerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nct68
 */
@Service
public class CareerServiceImpl implements CareerService{
    @Autowired
    private CareerRepository careerRepository;

    @Override
    public List<Career> getCareers() {
        return this.careerRepository.getCareers();
    }
    
}
