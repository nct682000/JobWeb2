/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Benefit;
import com.qv_ct.pojos.Tag;
import com.qv_ct.service.BenefitService;
import com.qv_ct.service.TagService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author nct68
 */
@Controller
public class TagController {
    @Autowired
    private TagService tagService;
    @Autowired
    private BenefitService benefitService;
    
    @GetMapping("/add/tag")
    public String list(Model model){
        model.addAttribute("tag", new Tag());
        model.addAttribute("tags", this.tagService.getTags());
        model.addAttribute("benefits", this.benefitService.getBenefits());
        model.addAttribute("benefit", new Benefit());
        
        return "addTag";
    } 
    
    @PostMapping("/add/tag")
    public String add(Model model, @ModelAttribute(value = "tag")
                    @Valid Tag tag,
                    BindingResult result){
        model.addAttribute("tags", this.tagService.getTags());
        model.addAttribute("benefits", this.benefitService.getBenefits());
        
        if(!result.hasErrors()){
           if(this.tagService.addOrUpdate(tag) == true)
               return "redirect:/addtag";
           else
               model.addAttribute("errMsg", "Something wrong!");
        }
        
        return "addTag";
    }
    
//    @PostMapping("/addtag")
//    public String addBenefit(Model model, @ModelAttribute(value = "benefit")
//                    @Valid Benefit benefit,
//                    BindingResult result){
//        model.addAttribute("tags", this.tagService.getTags());
//        model.addAttribute("benefits", this.benefitService.getBenefits());
//        
//        if(!result.hasErrors()){
//           if(this.benefitService.addOrUpdate(benefit) == true)
//               return "redirect:/addtag";
//           else
//               model.addAttribute("errMsg", "Something wrong!");
//        }
//        
//        return "addTag";
//    }
    
}
