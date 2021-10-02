/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.admin;

import com.qv_ct.service.UserService;
import com.qv_ct.service.RecruitmentService;
import com.qv_ct.service.ApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.DeleteMapping;

/**
 *
 * @author DELL
 */
@RestController
@RequestMapping("/api")
public class Ad_API_Controller {

    @Autowired
    private UserService userService;
    @Autowired
    private RecruitmentService recruitmentService;
    @Autowired
    private ApplyService applyService;

//    ------------------ user -------------------------------
    @GetMapping("/admin/customers/cadidates/{userId}")
    @ResponseStatus(HttpStatus.OK)
    public void disableUser_Cadidates(@PathVariable(name = "userId") int userId) {
        this.userService.enableUser(userId, false);
    }

    @GetMapping("/admin/customers/cadidates/inactive/{userId}")
    @ResponseStatus(HttpStatus.OK)
    public void enableUser_Cadidates(@PathVariable(name = "userId") int userId) {
        this.userService.enableUser(userId, true);
    }

    @GetMapping("/admin/customers/recruiters/{userId}")
    @ResponseStatus(HttpStatus.OK)
    public void disableUser_Recruiters(@PathVariable(name = "userId") int userId) {
        this.userService.enableUser(userId, false);
    }

    @GetMapping("/admin/customers/recruiters/inactive/{userId}")
    @ResponseStatus(HttpStatus.OK)
    public void enableUser_Recruiters(@PathVariable(name = "userId") int userId) {
        this.userService.enableUser(userId, true);
    }

    @DeleteMapping("/admin/customers/{userId}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteUser(@PathVariable(name = "userId") int userId) {
        this.userService.deleteUser(userId);
    }

    //    ------------------ recruitment -------------------------------
    @GetMapping("/admin/recruitment/active/{recId}")
    @ResponseStatus(HttpStatus.OK)
    public void enableRecruitment(@PathVariable(name = "recId") int recId) {
        this.recruitmentService.enableRecruitment(recId, true);
    }

    @GetMapping("/admin/recruitment/inactive/{recId}")
    @ResponseStatus(HttpStatus.OK)
    public void disableRecruitment(@PathVariable(name = "recId") int recId) {
        this.recruitmentService.enableRecruitment(recId, false);
    }

    @DeleteMapping("/admin/recruitment/{recId}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteRecruitment(@PathVariable(name = "recId") int recId) {
        this.recruitmentService.deleteRecruitment(recId);
    }

    //    ------------------ apply -------------------------------
    @GetMapping("/admin/apply/active/{applyId}")
    @ResponseStatus(HttpStatus.OK)
    public void enableApply(@PathVariable(name = "applyId") int applyId) {
        this.applyService.enableApply(applyId, true);
    }

    @GetMapping("/admin/apply/inactive/{applyId}")
    @ResponseStatus(HttpStatus.OK)
    public void disableApply(@PathVariable(name = "applyId") int applyId) {
        this.applyService.enableApply(applyId, false);
    }

    @DeleteMapping("/admin/apply/{applyId}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteApply(@PathVariable(name = "applyId") int applyId) {
        this.applyService.deleteApply(applyId);
    }
}
