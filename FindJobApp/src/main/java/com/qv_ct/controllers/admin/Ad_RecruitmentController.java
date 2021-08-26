/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.qv_ct.service.RecruitmentService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

/**
 *
 * @author DELL
 */
@Controller
public class Ad_RecruitmentController {
    @Autowired 
    private RecruitmentService recruitmentService;
    
    @RequestMapping("/admin/recruitment")
    public String index(Model model) {
        model.addAttribute("recruitments", this.recruitmentService.getRecruitmentsAll());

        return "ad_recruitment";
    }
}
