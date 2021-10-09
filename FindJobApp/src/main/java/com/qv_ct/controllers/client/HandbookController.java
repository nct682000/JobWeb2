/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nct68
 */
@Controller
public class HandbookController {
    
    @RequestMapping("/handbook")
    public String handdbook(){
        return "handbook";
    }
}
