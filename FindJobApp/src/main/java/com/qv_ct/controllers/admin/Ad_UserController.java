/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.qv_ct.pojos.User;
import com.qv_ct.service.UserService;
import com.qv_ct.service.ApplyService;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
//import javax.validation.Valid;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author DELL
 */
@Controller
public class Ad_UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private ApplyService applyService;

    @RequestMapping("/admin/customers")
    public String index(Model model,
            @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("users", this.userService.getUserAll(page));
        model.addAttribute("counter", this.userService.countUser());

        return "user";
    }

    @RequestMapping("/admin/customers/cadidates")
    public String getCadidates_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("users", this.userService.getCadidates_Admin(page));
        model.addAttribute("counter", this.userService.countCadidates_Admin());
        model.addAttribute("typeUser", "cadidates");

        return "getCadidates_Admin";
    }

    @RequestMapping("/admin/customers/recruiters")
    public String getRecruiters_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("users", this.userService.getRecruiters_Admin(page));
        model.addAttribute("counter", this.userService.countRecruiters_Admin());
        model.addAttribute("typeUser", "recruiters");

        return "getRecruiters_Admin";
    }

    @RequestMapping("/admin/customers/add-user")
    public String editUser() {

        return "edit-user";
    }

    @RequestMapping("/admin/customers/{name}")
    public String userDetail(Model model, @PathVariable String name) {
        model.addAttribute("user", this.userService.getUsers(name));
        User u = this.userService.getUsers(name).get(0);
        int id = u.getId();
        System.out.println(id);
        model.addAttribute("applies", this.applyService.getAppliesByUserId(id));

        return "ad_userDetail";
    }

}
