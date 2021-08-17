/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qv_ct.pojos.Recruitment;
import com.qv_ct.service.RecruitmentService;
import com.qv_ct.validator.RecruitmentSalaryFromValidator;
import com.qv_ct.validator.WebAppValidator;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author nct68
 */
@Controller
public class RecruitmentController {
//    @Autowired
//    private Cloudinary cloudinary;
    @Autowired
    private WebAppValidator recruitmentValidator;
    @Autowired
    private RecruitmentService recruitmentService;
    
    @InitBinder
    public void initBinder(WebDataBinder binder){
        binder.setValidator(recruitmentValidator);
    }
    
    @GetMapping("/add")
    public String list(Model model){
        model.addAttribute("recruitment", new Recruitment());
        
        return "addRecruitment";
    }
    
    @PostMapping("/add")
    public String add(Model model, @ModelAttribute(value = "recruitment")
                    @Valid Recruitment recruitment,
                    BindingResult result){
        if(!result.hasErrors()){
           if(this.recruitmentService.addOrUpdate(recruitment) == true)
               return "redirect:/";
           else
               model.addAttribute("errMsg", "Something wrong!");
        }
        
        return "addRecruitment";
    }
    
}
