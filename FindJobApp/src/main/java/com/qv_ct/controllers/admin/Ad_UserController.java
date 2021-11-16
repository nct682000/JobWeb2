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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import javax.validation.Valid;
import org.springframework.validation.BindingResult;
import java.security.Principal;
import java.text.ParseException;

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

//      danh sách ứng viên đã kích hoạt     ------------------------------------------------------------------
    @RequestMapping("/admin/customers/cadidates")
    public String getCadidates_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String email = params.getOrDefault("email", null);

        Role role = Role.ROLE_CANDIDATE;
        model.addAttribute("users", this.userService.getUsers_Admin(page, role, true, email));
        model.addAttribute("counter", this.userService.countUsers_Admin(role, true));
        model.addAttribute("typeUser", "cadidates");
        model.addAttribute("status", "active");

        return "getCadidates_Admin";
    }

//      danh sách ứng viên chưa hoạt động
    @RequestMapping("/admin/customers/cadidates/inactive")
    public String getCadidates_Inactive_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String email = params.getOrDefault("email", null);

        Role role = Role.ROLE_CANDIDATE;
        model.addAttribute("users", this.userService.getUsers_Admin(page, role, false, email));
        model.addAttribute("counter", this.userService.countUsers_Admin(role, false));
        model.addAttribute("typeUser", "cadidates");
        model.addAttribute("status", "inactive");

        return "getCadidates_Inactive_Admin";
    }

//      cập nhập thông tin ứng viên
    @GetMapping("/admin/customers/cadidates/{userId}/edit")
    public String editCadidates_Admin_View(Model model, @PathVariable(value = "userId") int userId) throws ParseException {
        model.addAttribute("user", this.userService.getUserById(userId));
        model.addAttribute("typeUser", "edit-cadidates");

        return "editCadidates_Admin";
    }

    @PostMapping("/admin/customers/cadidates/{userId}/edit")
    public String editCadidates_Admin_Process(Model model,
            @ModelAttribute(value = "user") @Valid User user,
            @PathVariable(value = "userId") int userId,
            BindingResult result) throws ParseException {
        String errorText = "";
        Role role = Role.ROLE_CANDIDATE;

        User root = this.userService.getUserById(userId);
        user.setId(root.getId());
        user.setUsername(root.getUsername());
        user.setPassword(root.getPassword());
        if (user.getFile().isEmpty()) {
            user.setAvatar(root.getAvatar());
        }
        if (user.getAddress().isEmpty()) {
            user.setAddress(root.getAddress());
            user.setProvince(root.getProvince());
        }

        if (!result.hasErrors()) {
            if (this.userService.addOrUpdate(user, role) == true) {
                return "redirect:/admin/customers/cadidates";
            } else {
                errorText = "Xảy ra lỗi, vui lòng thực hiện lại!";
            }

        } else {
            errorText = "Xảy ra lỗi, vui lòng thực hiện lại!";
        }

        model.addAttribute("typeUser", "edit-cadidates");
        model.addAttribute("errorText", errorText);

        return "editCadidates_Admin";
    }

//      tạo mới ứng viên
    @GetMapping("/admin/customers/cadidates/new")
    public String createCadidates_Admin_View(Model model) throws ParseException {
        model.addAttribute("user", new User());
        model.addAttribute("typeUser", "create-cadidates");

        return "createCadidates_Admin";
    }

    @PostMapping("/admin/customers/cadidates/new")
    public String createCadidates_Admin_Process(Model model,
            @ModelAttribute(value = "user") @Valid User user,
            BindingResult result) throws ParseException {
        String errorText = "";
        Role role = Role.ROLE_CANDIDATE;

        if (!result.hasErrors()) {
            if (user.getPassword().trim().equals(user.getConfirmPassword().trim())) {
                if (this.userService.addOrUpdate(user, role) == true) {
                    return "redirect:/admin/customers/cadidates";
                } else {
                    errorText = "Xảy ra lỗi, vui lòng thực hiện lại!";
                }
            } else {
                errorText = "Xác nhận mật khẩu sai!";
            }
        } else {
            errorText = "Bạn phải nhập thông tin đầy đủ các trường,\nTên tài khoản có độ dài từ 8 - 32 kí tự";
        }

        model.addAttribute("typeUser", "create-cadidates");
        model.addAttribute("errorText", errorText);

        return "createCadidates_Admin";
    }

//        danh sánh nhà tuyển dụng đã kích hoạt   ------------------------------------------------------------------
    @RequestMapping("/admin/customers/recruiters")
    public String getRecruiters_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String email = params.getOrDefault("email", null);

        Role role = Role.ROLE_RECRUITER;
        model.addAttribute("users", this.userService.getUsers_Admin(page, role, true, email));
        model.addAttribute("counter", this.userService.countUsers_Admin(role, true));
        model.addAttribute("typeUser", "recruiters");
        model.addAttribute("status", "active");

        return "getRecruiters_Admin";
    }

//        danh sách nhà tuyễn dụng chưa hoạt động
    @RequestMapping("/admin/customers/recruiters/inactive")
    public String getRecruiters_Inactive_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String email = params.getOrDefault("email", null);

        Role role = Role.ROLE_RECRUITER;
        model.addAttribute("users", this.userService.getUsers_Admin(page, role, false, email));
        model.addAttribute("counter", this.userService.countUsers_Admin(role, false));
        model.addAttribute("typeUser", "recruiters");
        model.addAttribute("status", "inactive");

        return "getRecruiters_Inactive_Admin";
    }

//        cập nhập thông tin nhà tuyển dụng
    @GetMapping("/admin/customers/recruiters/{userId}/edit")
    public String editRecruiters_Admin(Model model, @PathVariable(value = "userId") int userId) throws ParseException {
        model.addAttribute("user", this.userService.getUserById(userId));
        model.addAttribute("typeUser", "edit-recruiters");

        return "editRecruiters_Admin";
    }

    @PostMapping("/admin/customers/recruiters/{userId}/edit")
    public String editRecruiters_Admin_Process(Model model,
            @ModelAttribute(value = "user") @Valid User user,
            @PathVariable(value = "userId") int userId,
            BindingResult result) throws ParseException {
        String errorText = "";
        Role role = Role.ROLE_RECRUITER;

        User root = this.userService.getUserById(userId);
        user.setId(root.getId());
        user.setUsername(root.getUsername());
        user.setPassword(root.getPassword());
        if (user.getFile().isEmpty()) {
            user.setAvatar(root.getAvatar());
        }
        if (user.getAddress().isEmpty()) {
            user.setAddress(root.getAddress());
            user.setProvince(root.getProvince());
        }

        if (!result.hasErrors()) {
            if (this.userService.addOrUpdate(user, role) == true) {
                return "redirect:/admin/customers/recruiters";
            } else {
                errorText = "Xảy ra lỗi, vui lòng thực hiện lại!";
            }

        } else {
            errorText = "Xảy ra lỗi, vui lòng thực hiện lại!";
        }

        model.addAttribute("typeUser", "edit-recruiters");
        model.addAttribute("errorText", errorText);

        return "editRecruiters_Admin";
    }

//        tạo mới nhà tuyển dụng
    @GetMapping("/admin/customers/recruiters/new")
    public String createRecruiters_Admin_View(Model model) throws ParseException {
        model.addAttribute("user", new User());
        model.addAttribute("typeUser", "create-recruiters");

        return "createRecruiters_Admin";
    }

    @PostMapping("/admin/customers/recruiters/new")
    public String createRecruiters_Admin_Process(Model model,
            @ModelAttribute(value = "user") @Valid User user,
            BindingResult result) throws ParseException {
        String errorText = "";
        Role role = Role.ROLE_RECRUITER;

        if (!result.hasErrors()) {
            if (user.getPassword().trim().equals(user.getConfirmPassword().trim())) {
                if (this.userService.addOrUpdate(user, role) == true) {
                    return "redirect:/admin/customers/recruiters";
                } else {
                    errorText = "Xảy ra lỗi, vui lòng thực hiện lại!";
                }
            } else {
                errorText = "Xác nhận mật khẩu sai!";
            }
        } else {
            errorText = "Bạn phải nhập thông tin đầy đủ các trường,\nTên tài khoản có độ dài từ 8 - 32 kí tự";
        }
        model.addAttribute("typeUser", "create-recruiters");
        model.addAttribute("errorText", errorText);

        return "createRecruiters_Admin";
    }

//        danh sánh nhân viên   ------------------------------------------------------------------
    @RequestMapping("/admin/employees")
    public String getEmployees_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String email = params.getOrDefault("email", null);

        Role role = Role.ROLE_EMPLOYEE;
        model.addAttribute("users", this.userService.getUsers_Admin(page, role, true, email));
        model.addAttribute("counter", this.userService.countUsers_Admin(role, true));

        return "getEmployees_Admin";
    }

//    tạo nhân viên mới
    @GetMapping("/admin/employees/new")
    public String createEmployee_Admin_View(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        model.addAttribute("user", new User());
        model.addAttribute("typeUser", "create-employee");

        return "createEmployees_Admin";
    }

    @PostMapping("/admin/employees/new")
    public String createEmployee_Admin_Process(Model model,
            @ModelAttribute(value = "user") @Valid User user,
            BindingResult result) throws ParseException {
        String errorText = "";
        Role role = Role.ROLE_EMPLOYEE;

        if (!result.hasErrors()) {
            if (user.getPassword().trim().equals(user.getConfirmPassword().trim())) {
                if (this.userService.addOrUpdate(user, role) == true) {
                    return "redirect:/admin/employees";
                } else {
                    errorText = "Xảy ra lỗi, vui lòng thực hiện lại!";
                }
            } else {
                errorText = "Xác nhận mật khẩu sai!";
            }
        } else {
            errorText = "Bạn phải nhập thông tin đầy đủ các trường,\nTên tài khoản có độ dài từ 8 - 32 kí tự";
        }

        model.addAttribute("typeUser", "create-employee");
        model.addAttribute("errorText", errorText);

        return "createEmployees_Admin";
    }

//   cập nhập thông tin nhân viên
    @GetMapping("/admin/employees/{userId}/edit")
    public String editEmployee_Admin_View(Model model,
            @PathVariable(value = "userId") int userId) throws ParseException {
        model.addAttribute("user", this.userService.getUserById(userId));
        model.addAttribute("typeUser", "edit-employee");

        return "editEmployees_Admin";
    }

    @PostMapping("/admin/employees/{userId}/edit")
    public String editEmployee_Admin_Process(Model model,
            @ModelAttribute(value = "user") @Valid User user,
            @PathVariable(value = "userId") int userId,
            BindingResult result) throws ParseException {
        String errorText = "";
        Role role = Role.ROLE_EMPLOYEE;

        User root = this.userService.getUserById(userId);
        user.setId(root.getId());
        user.setUsername(root.getUsername());
        user.setPassword(root.getPassword());
        if (user.getFile().isEmpty()) {
            user.setAvatar(root.getAvatar());
        }
        if (user.getAddress().isEmpty()) {
            user.setAddress(root.getAddress());
            user.setProvince(root.getProvince());
        }

        if (!result.hasErrors()) {
            if (this.userService.addOrUpdate(user, role) == true) {
                return "redirect:/admin/employees";
            } else {
                errorText = "Xảy ra lỗi, vui lòng thực hiện lại!";
            }

        } else {
            errorText = "Xảy ra lỗi, vui lòng thực hiện lại!";
        }

        model.addAttribute("typeUser", "edit-employee");
        model.addAttribute("errorText", errorText);

        return "editEmployees_Admin";
    }
}
