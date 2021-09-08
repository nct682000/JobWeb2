/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author DELL
 */
@Controller
public class AdminHome {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @GetMapping("/admin")
    public String index() {
        return "admin";
    }
    
    @RequestMapping("/admin/test")
    public String test() {
        return "test";
    }
}
