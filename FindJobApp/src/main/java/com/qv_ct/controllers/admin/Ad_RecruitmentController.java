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
    public String index(Model model,
            @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("recruitments", this.recruitmentService.getRecruitmentsAll(page));
        model.addAttribute("counter", this.recruitmentService.countRecruitment());

        return "ad_recruitment";
    }

    @RequestMapping("/admin/recruitment/{id}")
    public String getRecruitment(Model model, @PathVariable int id) {

        model.addAttribute("recDetail",
                this.recruitmentService.getRecruitmentById(id));

        return "ad_recruitmentDetail";
    }
}
