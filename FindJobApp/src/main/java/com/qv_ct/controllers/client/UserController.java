/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Role;
import com.qv_ct.pojos.User;
import com.qv_ct.service.UserService;
import com.qv_ct.validator.UserValidator;
import com.qv_ct.validator.WebAppValidator;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nct68
 */
@Controller
public class UserController {
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private WebAppValidator userValidator;
    
    @InitBinder
    public void initBinder(WebDataBinder binder){
        binder.setValidator(userValidator);
    }
    
    @GetMapping("/login")
    public String login(){
        return "login";
    }
    
    @GetMapping("/register/candidate")
    public String cRegister(Model model) {
        model.addAttribute("user", new User());
       
        return "cRegister";
    }
    
    @PostMapping("/register/candidate")
    public String cRegisterPost(Model model, @ModelAttribute(value = "user")
                            @Valid User user,
                            BindingResult result){
       String errMsg = "";
       Role role = Role.CANDIDATE;
//       if(!result.hasErrors()){
            if(user.getPassword().trim().equals(user.getConfirmPassword().trim())){
                if (this.userDetailsService.addOrUpdate(user, role) == true){
                    return "redirect:/login";
                }
            }else
                errMsg = "Mật khẩu không trùng khớp";
//       }
       
       model.addAttribute("errMsg", errMsg);
       
        return "cRegister";
    }
    
    @GetMapping("/register/recruiter")
    public String rRegister(Model model) {
        model.addAttribute("user", new User());
       
        return "rRegister";
    }
    
    @PostMapping("/register/recruiter")
    public String rRegisterPost(Model model, @ModelAttribute(value = "user")
                            @Valid User user,
                            BindingResult result){
       String errMsg = "";
       Role role = Role.RECRUITER;
//       if(!result.hasErrors()){
            if(user.getPassword().trim().equals(user.getConfirmPassword().trim())){
                if (this.userDetailsService.addOrUpdate(user, role) == true){
                    return "redirect:/login";
                }
            }else
                errMsg = "Mật khẩu không trùng khớp";
//       }
       
       model.addAttribute("errMsg", errMsg);
       
        return "rRegister";
    }
}
