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
import com.qv_ct.service.ApplyService;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String index(Model model,
            @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("applys", this.applyService.getApplyAll(page));
        model.addAttribute("counter", this.applyService.countApplies());

        return "ad_apply";
    }
}
