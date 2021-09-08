/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.service.CareerService;
import com.qv_ct.service.ProvinceService;
import com.qv_ct.service.RecruitmentService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
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
    
    @ModelAttribute
    public void commonAttr(Model model){
        model.addAttribute("careers", this.careerService.getCareers());
        model.addAttribute("provinces", this.provinceService.getProvinces());
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
    
}
