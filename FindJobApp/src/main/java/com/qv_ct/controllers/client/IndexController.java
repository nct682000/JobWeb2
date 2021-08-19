/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.service.CareerService;
import com.qv_ct.service.ProvinceService;
import com.qv_ct.service.RecruitmentService;
import com.qv_ct.service.UserService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author nct68
 */
@Controller
@ControllerAdvice
public class IndexController {
    @Autowired
    private CareerService careerService;
    @Autowired
    private RecruitmentService recruitmentService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private UserService userService;
    
    @ModelAttribute
    public void commonAttr(Model model){
        model.addAttribute("careers", this.careerService.getCareers());
        model.addAttribute("provinces", this.provinceService.getProvinces());
        model.addAttribute("users", this.userService.getUsers());
    }
    
    @RequestMapping("/")
    public String index(Model model, 
            @RequestParam(required = false) Map<String, String> params){
        
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("recruitments", 
                this.recruitmentService.getRecruitments(page));
        model.addAttribute("countR", this.recruitmentService.countRecruitment());
        
        return "index";
    }
    
    @RequestMapping("/login")
    public String login(Model model) {
       
        return "login";
    }
    
    @RequestMapping("/register/candidate")
    public String cRegister(Model model) {
       
        return "cRegister";
    }
    
    @RequestMapping("/register/recruiter")
    public String rRegister(Model model) {
       
        return "rRegister";
    }
    
    @RequestMapping("/user")
    public String user(Model model) {
       
        return "user";
    }
    
}
