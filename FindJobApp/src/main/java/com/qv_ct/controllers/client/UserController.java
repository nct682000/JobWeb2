/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Recruitment;
import com.qv_ct.pojos.Role;
import com.qv_ct.pojos.User;
import com.qv_ct.service.ApplyService;
import com.qv_ct.service.RecruitmentService;
import com.qv_ct.service.UserService;
import com.qv_ct.validator.RecruitmentValidator;
import com.qv_ct.validator.WebAppValidator;
import java.security.Principal;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
//    @Autowired
//    private WebAppValidator recruitmentValidator;
    @Autowired
    private ApplyService applyService;
     @Autowired
    private RecruitmentService recruitmentService;
    
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
       if(!result.hasErrors()){
            if(user.getPassword().trim().equals(user.getConfirmPassword().trim())){
                if (this.userDetailsService.addOrUpdate(user, role) == true){
                    return "redirect:/login";
                }
            }else
                errMsg = "Mật khẩu không trùng khớp";
       }
       
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
    
    @GetMapping("/user/{name}")
    public String userPage(Model model, @PathVariable String name) {
       model.addAttribute("user", this.userDetailsService.getUsers(name));
       model.addAttribute("userUpdate", new User());
       model.addAttribute("recruitment", new Recruitment());
       User u = this.userDetailsService.getUsers(name).get(0);
       model.addAttribute("recruiters", this.userDetailsService.getRecruiters());
       int id = u.getId();
       model.addAttribute("applies", this.applyService.getAppliesByUserId(id));
       model.addAttribute("recPost", this.recruitmentService.getRecruitmentByUserId(id));
       
       return "userpage";
    }
    
    @PostMapping("/user/{name}")
    public String addRecruitment(Model model, @ModelAttribute(value = "userUpdate")
                            @Valid User user,
                            @ModelAttribute(value = "recruitment")
                            @Valid Recruitment recruitment,
                            BindingResult result,
                            Principal principal) {
        
        User u = this.userDetailsService.getUsers(principal.getName()).get(0);
//        if(user != null){
//            System.out.println("-------------------------------Post-----------------------------------");
//            System.out.println(u.getId());
//
//            user.setId(u.getId());
//            user.setUsername(u.getUsername());
//            user.setPassword(u.getPassword());
//
//            Role role = u.getRole();
//
//            System.out.println("-------------------------------Not error-----------------------------------");
//
//            if(this.userDetailsService.addOrUpdate(user, role) == true)
//                 return String.format("redirect:/user/%s", principal.getName());
//
//             model.addAttribute("errMsg", "Something wrong!");
//        }
        
        if(!recruitment.getTitle().isEmpty()){
            recruitment.setRecruiter(u);
            if(!result.hasErrors()){
                System.out.println("-------------------------------Not error-----------------------------------");
                if(this.recruitmentService.addOrUpdate(recruitment) == true)
                return String.format("redirect:/user/%s", principal.getName());
             else
                 model.addAttribute("errMsg", "Something wrong!");
             }
             System.out.println("-------------------------------Error-----------------------------------");
       }
       return "userpage";
    }
    
}
