/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.User;
import com.qv_ct.service.ApplyService;
import com.qv_ct.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nct68
 */
@Controller
public class CandidateController {
    @Autowired
    private UserService userService;
    @Autowired
    private ApplyService applyService;
    
    @RequestMapping("/candidate/{name}")
    public String candidate(Model model, @PathVariable String name) {
       model.addAttribute("user", this.userService.getUsers(name));
       User u = this.userService.getUsers(name).get(0);
       int id = u.getId();
       System.out.println(id);
       model.addAttribute("applies", this.applyService.getAppliesByUserId(id));
        
       return "candidate";
    }
}
