/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Apply;
import com.qv_ct.pojos.Recruitment;
import com.qv_ct.pojos.User;
import com.qv_ct.service.ApplyService;
import com.qv_ct.service.RecruitmentService;
import com.qv_ct.service.UserService;
import java.security.Principal;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
    
    @GetMapping("/user/{name}/apply")
    public String recruitmentManager(Model model, @PathVariable String name, Principal principal){
        
        model.addAttribute("user", this.userService.getUsers(name).get(0));
        if(principal != null){
            model.addAttribute("currentUser", this.userService.getUsers(principal.getName()).get(0));
            int id = this.userService.getUsers(principal.getName()).get(0).getId();
            model.addAttribute("myApplies", this.applyService.getAppliesByUserId(id));
        }
        
        return "applyManager";
    }
    
    
    @PostMapping("/add/apply")
    public String applyPost(Model model,
            @ModelAttribute(value = "apply") @Valid Apply apply,
            Principal principal,
            BindingResult result){
        if(!result.hasErrors()){
           if(this.applyService.addOrUpdate(apply) == true)
               return "redirect:/";
           else
               model.addAttribute("errMsg", "???? c?? l???i x???y ra trong qu?? tr??nh th??m tin");
        }
        
        return "recruitmentDetail";
    }
  
}
