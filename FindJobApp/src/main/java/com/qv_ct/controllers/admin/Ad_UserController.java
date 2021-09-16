/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.qv_ct.pojos.User;
import com.qv_ct.pojos.Role;
import com.qv_ct.service.UserService;
import com.qv_ct.service.ApplyService;
import com.qv_ct.service.CareerService;
import com.qv_ct.service.ProvinceService;
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
    @Autowired
    private CareerService careerService;
    @Autowired
    private ProvinceService provinceService;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("careers", this.careerService.getCareers());
        model.addAttribute("provinces", this.provinceService.getProvinces());
    }

    //    danh sách ứng viên đã kích hoạt     ------------------------------------------------------------------
    @RequestMapping("/admin/customers/cadidates")
    public String getCadidates_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String email = params.getOrDefault("email", null);

        Role role = Role.CANDIDATE;
        model.addAttribute("users", this.userService.getUsers_Admin(page, role, true, email));
        model.addAttribute("counter", this.userService.countUsers_Admin(role, true));
        model.addAttribute("typeUser", "cadidates");
        model.addAttribute("status", "active");

        return "getCadidates_Admin";
    }

//    danh sách ứng viên đã chưa hoạt động
    @RequestMapping("/admin/customers/cadidates/inactive")
    public String getCadidates_Inactive_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String email = params.getOrDefault("email", null);

        Role role = Role.CANDIDATE;
        model.addAttribute("users", this.userService.getUsers_Admin(page, role, false, email));
        model.addAttribute("counter", this.userService.countUsers_Admin(role, false));
        model.addAttribute("typeUser", "cadidates");
        model.addAttribute("status", "inactive");

        return "getCadidates_Inactive_Admin";
    }

//    xem thông tin chi tiết ứng viên
    @RequestMapping("/admin/customers/cadidates/{userId}/edit")
    public String editCadidates_Admin(Model model, @PathVariable(value = "userId") int userId) {
        model.addAttribute("user", this.userService.getUserById(userId));
        model.addAttribute("typeUser", "edit-cadidates");

        return "editCadidates_Admin";
    }

    //    tạo mới ứng viên
    @RequestMapping("/admin/customers/cadidates/new")
    public String createCadidates_Admin(Model model) {
        model.addAttribute("typeUser", "create-cadidates");

        return "createCadidates_Admin";
    }

    //    danh sánh nhà ứng tuyển đã kích hoạt   ------------------------------------------------------------------
    @RequestMapping("/admin/customers/recruiters")
    public String getRecruiters_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String email = params.getOrDefault("email", null);

        Role role = Role.RECRUITER;
        model.addAttribute("users", this.userService.getUsers_Admin(page, role, true, email));
        model.addAttribute("counter", this.userService.countUsers_Admin(role, true));
        model.addAttribute("typeUser", "recruiters");
        model.addAttribute("status", "active");

        return "getRecruiters_Admin";
    }

    //    danh sách ứng viên đã chưa hoạt động
    @RequestMapping("/admin/customers/recruiters/inactive")
    public String getRecruiters_Inactive_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String email = params.getOrDefault("email", null);

        Role role = Role.RECRUITER;
        model.addAttribute("users", this.userService.getUsers_Admin(page, role, false, email));
        model.addAttribute("counter", this.userService.countUsers_Admin(role, false));
        model.addAttribute("typeUser", "recruiters");
        model.addAttribute("status", "inactive");

        return "getRecruiters_Inactive_Admin";
    }

    //    xem thông tin chi nhà tuyển dụng
    @RequestMapping("/admin/customers/recruiters/{userId}/edit")
    public String editRecruiters_Admin(Model model, @PathVariable(value = "userId") int userId) {
        model.addAttribute("user", this.userService.getUserById(userId));
        model.addAttribute("typeUser", "edit-recruiters");

        return "editRecruiters_Admin";
    }

    //    tạo mới ứng viên
    @RequestMapping("/admin/customers/recruiters/new")
    public String createRecruiters_Admin(Model model) {
        model.addAttribute("typeUser", "create-recruiters");

        return "createRecruiters_Admin";
    }

   
}
