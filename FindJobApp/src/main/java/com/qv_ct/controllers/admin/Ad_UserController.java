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
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author DELL
 */
@Controller
public class Ad_UserController {
    @Autowired     
    private UserService userService;

    @RequestMapping("/admin/customers")
    public String index(Model model) {
        model.addAttribute("users", this.userService.getUsers());

        return "user";
    }
    
    @RequestMapping("/admin/customers/add-user")
    public String editUser() {

        return "edit-user";
    }
    
}
