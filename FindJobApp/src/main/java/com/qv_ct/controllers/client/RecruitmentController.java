/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qv_ct.pojos.Apply;
import com.qv_ct.pojos.Recruitment;
import com.qv_ct.pojos.Tag;
import com.qv_ct.pojos.User;
import com.qv_ct.service.RecruitmentService;
import com.qv_ct.service.TagService;
import com.qv_ct.service.UserService;
import com.qv_ct.validator.RecruitmentValidator;
import com.qv_ct.validator.WebAppValidator;
import java.io.IOException;
import java.math.BigDecimal;
import java.security.Principal;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @Autowired
    private UserService userService;
    
    @InitBinder
    public void initBinder(WebDataBinder binder){
        binder.setValidator(recruitmentValidator);
    }
    
    
    @RequestMapping("/recruitments")
    public String search(Model model, 
            @RequestParam(required = false) Map<String, String> params){
        
        String kw = params.getOrDefault("kw", "kw");
        String careerId = params.getOrDefault("careerId", "careerId");
        String provinceId = params.getOrDefault("provinceId", "provinceId");
        String form = params.getOrDefault("form", "form");
        String salary = params.getOrDefault("salary", "salary");
        model.addAttribute("recruitments", 
                this.recruitmentService.searchRecruitments(kw,
                        Integer.parseInt(careerId),
                        Integer.parseInt(provinceId),
                        Integer.parseInt(form),
                        Integer.parseInt(salary)));
        
        return "searchRecruitment";
    }
    
    @RequestMapping("/recruitment/{id}")
    public String getRecruitment(Model model, 
            Principal principal,
            @PathVariable int id){
        
        model.addAttribute("recDetail", 
                this.recruitmentService.getRecruitmentById(id));
        model.addAttribute("apply", new Apply());
        if(principal != null)
            model.addAttribute("currentUser", this.userService.getUsers(principal.getName()).get(0));
        
        return "recruitmentDetail";
    }
    
    @GetMapping("/user/{name}/recruitment")
    public String recruitmentManager(Model model, @PathVariable String name, Principal principal){
        
        model.addAttribute("recruitment", new Recruitment());
        model.addAttribute("currentUser", this.userService.getUsers(principal.getName()).get(0));
        int id = this.userService.getUsers(principal.getName()).get(0).getId();
        model.addAttribute("recRecruitments", this.recruitmentService.getRecruitmentByUserId(id));
        
        return "recruitmentManager";
    }
    
    
    @PostMapping("/user/{name}/recruitment")
    public String addRecruitment(Model model, @ModelAttribute(value = "recruitment")
                    @Valid Recruitment recruitment,
                    BindingResult result,
                    Principal principal){
        
        int id = this.userService.getUsers(principal.getName()).get(0).getId();
        model.addAttribute("recRecruitments", this.recruitmentService.getRecruitmentByUserId(id));
        
        if(principal != null)
            model.addAttribute("currentUser", this.userService.getUsers(principal.getName()).get(0));
        
        User u = this.userService.getUsers(principal.getName()).get(0);
        recruitment.setRecruiter(u);
        if(!result.hasErrors()){
            if(this.recruitmentService.addOrUpdate(recruitment) == true)
                return String.format("redirect:/user/%s", principal.getName());
        }
        else
            model.addAttribute("errMsg", "Thêm tin không thành công, kiểm tra lại nhé!");
       
       return "recruitmentManager";
    }
    
}
