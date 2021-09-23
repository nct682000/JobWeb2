/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.admin;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.qv_ct.service.ApplyService;
import java.util.Map;

/**
 *
 * @author DELL
 */
@Controller
public class AdminHome {

    @Autowired
    private ApplyService applyService;

    @RequestMapping("/admin")
    public String dashboard(Model model, @RequestParam(required = false) Map<String, String> params) {
        boolean active = Boolean.parseBoolean(params.getOrDefault("active", "true"));
        int year = Integer.parseInt(params.getOrDefault("year", "2021"));
        String sort = params.getOrDefault("sort", "thang");
        double avg = 0;
        int total = 0;

        if (sort.equals("thang")) {
            long[] data = new long[12];
            for (int i = 1; i <= 12; i++) {
                data[i - 1] = this.applyService.countApply_Admin_For_Chart(active, i, year);
                total += (int) data[i - 1];
            }
            avg = total / 12.0;
            model.addAttribute("counterApples", data);
            model.addAttribute("sortBy", "thang");
            model.addAttribute("year", year);
            model.addAttribute("total", total);
            model.addAttribute("avg", avg);
        } else {
            long[] data = new long[4];
            for (int i = 1; i <= 4; i++) {
                for (int j = 1; j <= 3; j++) {
                    int flag = j + (3 * (i - 1));
                    data[i - 1] += this.applyService.countApply_Admin_For_Chart(active, flag, year);
                }
                total += (int) data[i - 1];
            }
            avg = total / 4.0;
            model.addAttribute("counterApples", data);
            model.addAttribute("sortBy", "quy");
            model.addAttribute("year", year);
            model.addAttribute("total", total);
            model.addAttribute("avg", avg);
        }
        return "dashboard";
    }

}
