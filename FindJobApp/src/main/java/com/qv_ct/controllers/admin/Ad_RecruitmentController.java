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
import org.springframework.web.bind.annotation.PathVariable;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author DELL
 */
@Controller
public class Ad_RecruitmentController {

    @Autowired
    private RecruitmentService recruitmentService;

    @RequestMapping("/admin/recruitment")
    public String getRecruiment_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        boolean active = Boolean.parseBoolean(params.getOrDefault("active", "true"));
        long salaryFrom = Long.parseLong(params.getOrDefault("salaryFrom", "1"));
        long salaryTo = Long.parseLong(params.getOrDefault("salaryTo", "900000000"));

        if (active) {
            model.addAttribute("recruitments", this.recruitmentService.getRecruitments_Admin(page, salaryFrom, salaryTo, active));
            model.addAttribute("counter", this.recruitmentService.countRecruitment_Admin(active));
//            model.addAttribute("type", "cadidates");
            model.addAttribute("status", "active");
        } else {
            model.addAttribute("recruitments", this.recruitmentService.getRecruitments_Admin(page, salaryFrom, salaryTo, active));
            model.addAttribute("counter", this.recruitmentService.countRecruitment_Admin(active));
            model.addAttribute("status", "inactive");
        }

        return "getRecruiment_Admin";
    }

//    @RequestMapping("/admin/recruitment/inactive")
//    public String getRecruiment_Inactive_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
//        int page = Integer.parseInt(params.getOrDefault("page", "1"));
//        model.addAttribute("recruitments", this.recruitmentService.getRecruitmentsAll(page));
//        
//        model.addAttribute("counter", this.recruitmentService.countRecruitment());
//
//        return "ad_recruitment";
//    }
    @RequestMapping("/admin/recruitment/{id}")
    public String getRecruitment(Model model, @PathVariable int id) {

        model.addAttribute("recDetail",
                this.recruitmentService.getRecruitmentById(id));

        return "ad_recruitmentDetail";
    }
}
