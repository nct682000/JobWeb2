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
    
    @RequestMapping("/cv")
    public String cv(){
        return "cv";
    }
    
    @RequestMapping("/handbook/bqtv-1")
    public String bqtv1(){
        return "bqtv1";
    }
    
    @RequestMapping("/handbook/bqtv-2")
    public String bqtv2(){
        return "bqtv2";
    }
    
    @RequestMapping("/handbook/bqtv-3")
    public String bqtv3(){
        return "bqtv3";
    }
    
    @RequestMapping("/handbook/ttcv-1")
    public String ttcv1(){
        return "ttcv1";
    }
    
    @RequestMapping("/handbook/ttcv-2")
    public String ttcv2(){
        return "ttcv2";
    }
    
    @RequestMapping("/handbook/ttcv-3")
    public String ttcv3(){
        return "ttcv3";
    }
    
}
