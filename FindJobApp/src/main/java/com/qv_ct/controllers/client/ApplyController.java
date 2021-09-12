/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Apply;
import com.qv_ct.service.ApplyService;
import com.qv_ct.service.RecruitmentService;
import com.qv_ct.service.UserService;
import java.math.BigDecimal;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nct68
 */
@Controller
public class ApplyController {
    @Autowired
    private ApplyService applyService;
    @Autowired
    private UserService userService;
    @Autowired
    private RecruitmentService recruitmentService;
    
    @GetMapping("/add/apply")
    public String apply(Model model){
        model.addAttribute("applies", this.applyService.getApplies());
        model.addAttribute("apply", new Apply());
        model.addAttribute("candidates", this.userService.getCadidates());
        model.addAttribute("recruitments", this.recruitmentService.searchRecruitments("", 0, 0, -1, 0));
        
        return "addApply";
    }
    
    @PostMapping("/add/apply")
    public String applyPost(Model model,
            @ModelAttribute(value = "apply") @Valid Apply apply,
            BindingResult result){
        
        model.addAttribute("candidates", this.userService.getCadidates());
        model.addAttribute("recruitments", this.recruitmentService.searchRecruitments("", 0, 0, -1, 0));
        
        if(!result.hasErrors()){
           if(this.applyService.addOrUpdate(apply) == true)
               return "redirect:/";
           else
               model.addAttribute("errMsg", "Đã có lỗi xảy ra trong quá trình thêm tin");
        }
        
        return "addApply";
    }
  
}
