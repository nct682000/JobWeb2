/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.service.CareerService;
import com.qv_ct.service.RecruitmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nct68
 */
@Controller
public class Index {
    @Autowired
    private CareerService careerService;
    @Autowired
    private RecruitmentService recruitmentService;
    
    @RequestMapping("/a")
    public String index0(Model model) {
       
        return "index";
    }
    
    @RequestMapping("/b")
    public String index(Model model) {
       model.addAttribute("careers", this.careerService.getCareers());
       model.addAttribute("recruitments", this.recruitmentService.getRecruitments(""));
        
        return "index";
    }
    
}
