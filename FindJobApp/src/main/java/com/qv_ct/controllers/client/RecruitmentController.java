/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qv_ct.pojos.Recruitment;
import com.qv_ct.pojos.Tag;
import com.qv_ct.service.RecruitmentService;
import com.qv_ct.service.TagService;
import com.qv_ct.service.UserService;
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
    private TagService tagService;
    @Autowired
    private UserService userService;
    
    @InitBinder
    public void initBinder(WebDataBinder binder){
        binder.setValidator(recruitmentValidator);
    }
    
    @GetMapping("/add/recruitment")
    public String list(Model model){
        model.addAttribute("recruitment", new Recruitment());
        model.addAttribute("tags", this.tagService.getTags());
        model.addAttribute("recruiters", this.userService.getRecruiters());
//        model.addAttribute("tag", new Tag());
        return "addRecruitment";
    }
    
    @PostMapping("/add/recruitment")
    public String add(Model model, @ModelAttribute(value = "recruitment")
                    @Valid Recruitment recruitment,
                    BindingResult result){
        model.addAttribute("recruiters", this.userService.getRecruiters());
        
        if(!result.hasErrors()){
           if(this.recruitmentService.addOrUpdate(recruitment) == true)
               return "redirect:/";
           else
               model.addAttribute("errMsg", "Something wrong!");
        }
        
        return "addRecruitment";
    }
    
    @RequestMapping("/recruitments")
    public String searchS(Model model, 
            @RequestParam(required = false) Map<String, String> params){
        
        String s = params.getOrDefault("kw", "kw");
        model.addAttribute("recruitments", 
                this.recruitmentService.searchRecruitments(s));
        
        return "searchRecruitment";
    }
    
//    @PostMapping("/add")
//    public String addTag(Model model, @ModelAttribute(value = "tag")
//                   @Valid Tag tag,
//                   BindingResult result){
//        if(!result.hasErrors()){
//          if(this.tagService.addOrUpdate(tag) == true)@
//              return "redirect:/add";
//          else
//              model.addAttribute("errMsg", "Something wrong!");
//       }
//
//       return "addRecruitment";
//    }
    
}
