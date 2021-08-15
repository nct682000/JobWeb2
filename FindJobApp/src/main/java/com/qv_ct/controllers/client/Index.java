/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.service.CareerService;
import com.qv_ct.service.ProvinceService;
import com.qv_ct.service.RecruitmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nct68
 */
@Controller
@ControllerAdvice
public class Index {
    @Autowired
    private CareerService careerService;
    @Autowired
    private RecruitmentService recruitmentService;
    @Autowired
    private ProvinceService provinceService;
    
    @ModelAttribute
    public void commonAttr(Model model){
        model.addAttribute("careers", this.careerService.getCareers());
    }
    
    @RequestMapping("/")
    public String index0(Model model) {
       
        return "index";
    }
    
    @RequestMapping("/home")
    public String index(Model model) {
       model.addAttribute("recruitments", this.recruitmentService.getRecruitments(""));
       model.addAttribute("provinces", this.provinceService.getProvinces());
        
        return "index";
    }
    
    @RequestMapping("/login")
    public String login(Model model) {
       
        return "login";
    }
    
    @RequestMapping("/register")
    public String register(Model model) {
       
        return "register";
    }
    
    @RequestMapping("/user")
    public String user(Model model) {
       
        return "user";
    }
    
}
