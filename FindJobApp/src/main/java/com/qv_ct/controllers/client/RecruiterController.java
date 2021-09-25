/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.service.ApplyService;
import com.qv_ct.service.CommentService;
import com.qv_ct.service.RateService;
import com.qv_ct.service.RecruitmentService;
import com.qv_ct.service.UserService;
import java.security.Principal;
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
public class RecruiterController {
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private RecruitmentService recruitmentService;
    @Autowired
    private RateService rateService;
    
    @RequestMapping("/recruiter/{id}")
    public String recruiter(Model model, @PathVariable int id,
            Principal principal){
        
        model.addAttribute("ru", this.userService.getUserById(id));
        model.addAttribute("recRecruitments", this.recruitmentService.getRecruitmentByUserId(id));
        
        model.addAttribute("comments", this.commentService.getCommentByRecruiterId(id));
        if(principal != null)
            model.addAttribute("currentUser", this.userService.getUsers(principal.getName()).get(0));
        
        model.addAttribute("rateCountRecruiter", this.rateService.rateCountRecruiter(id));
        model.addAttribute("ratePointRecruiter", this.rateService.ratePointRecruiter(id));
        return "recruiter";
    }
}
