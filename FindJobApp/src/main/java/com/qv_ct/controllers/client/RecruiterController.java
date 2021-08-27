/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.service.CommentService;
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
public class RecruiterController {
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    
    @RequestMapping("/recruiter/{id}")
    public String recruiter(Model model, @PathVariable int id){
        
        model.addAttribute("ru", this.userService.getUserById(id));
//        model.addAttribute("comments", this.commentService.getCommentByRecruiterId(id));
        
        return "recruiter";
    }
}
