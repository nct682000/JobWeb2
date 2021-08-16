/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qv_ct.pojos.Recruitment;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author nct68
 */
@Controller
public class RecruitmentController {
    @Autowired
    private Cloudinary cloudinary;
    
    @GetMapping("/uploadtest")
    public String list(Model model){
        model.addAttribute("recruitment", new Recruitment());
        
        return "uploadtest";
    }
    
    @PostMapping("/uploadtest")
    public String add(@ModelAttribute(value = "recruitment")
                    @Valid Recruitment recruitment,
                    BindingResult result){
        if(!result.hasErrors()){
            try {
                Map r = this.cloudinary.uploader().upload(recruitment.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                String img = (String) r.get("secure_url");
                
                return "redirect:/";
            } catch (IOException ex) {
                System.err.println("-----Add Error-----" + ex.getMessage());
            }
        }
        
        return "uploadtest";
    }
    
}
