/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.admin;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import com.qv_ct.service.ApplyService;
import com.qv_ct.pojos.User;
import java.util.Map;

/**
 *
 * @author DELL
 */
@Controller
public class Ad_ApplyController {

    @Autowired
    private ApplyService applyService;

    @RequestMapping("/admin/applies")
    public String getApply_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        boolean active = Boolean.parseBoolean(params.getOrDefault("active", "true"));
        String title = params.getOrDefault("title", "");
        String dateFilter = params.getOrDefault("dateFilter", "");

        if (active) {
            model.addAttribute("applys", this.applyService.getApply_Admin(page, active, title, dateFilter));
            model.addAttribute("counter", this.applyService.countApply_Admin(active, title, dateFilter));
            model.addAttribute("status", "active");
        } else {
            model.addAttribute("applys", this.applyService.getApply_Admin(page, active, title, dateFilter));
            model.addAttribute("counter", this.applyService.countApply_Admin(active, title, dateFilter));
            model.addAttribute("status", "inactive");
        }

        return "getApply_Admin";
    }

    @RequestMapping("/admin/applies/{applyId}/detail")
    public String getApplyById_Admin(Model model, @PathVariable(value = "applyId") int applyId) {
        model.addAttribute("apply", this.applyService.getApplyById(applyId));

        return "getApplyById_Admin";
    }
}
