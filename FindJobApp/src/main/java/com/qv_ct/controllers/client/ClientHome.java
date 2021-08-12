/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author DELL
 */
@Controller
public class ClientHome {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @RequestMapping("/")
    public String index(Model model) {
        Session s = sessionFactory.getObject().openSession();
        Query q = s.createQuery("From Apply");
        model.addAttribute("apply", q.getResultList());
        s.close();
        return "clienttest";
    }
}
