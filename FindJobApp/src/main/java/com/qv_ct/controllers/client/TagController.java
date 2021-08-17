/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Tag;
import com.qv_ct.service.TagService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
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
public class TagController {
    @Autowired
    private TagService tagService;
    
    @GetMapping("/addtag")
    public String list(Model model){
        model.addAttribute("tag", new Tag());
        
        return "addTag";
    } 
    
     @PostMapping("/addtag")
    public String add(Model model, @ModelAttribute(value = "tag")
                    @Valid Tag tag,
                    BindingResult result){
        if(!result.hasErrors()){
           if(this.tagService.addOrUpdate(tag) == true)
               return "redirect:/";
           else
               model.addAttribute("errMsg", "Something wrong!");
        }
        
        return "addTag";
    }
    
}
