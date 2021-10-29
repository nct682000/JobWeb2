/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.qv_ct.service.RecruitmentService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author DELL
 */
@Controller
public class Ad_RecruitmentController {

    @Autowired
    private RecruitmentService recruitmentService;

//    tìm kiếm mặc định
    @RequestMapping("/admin/recruitment")
    public String getRecruiment_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int caseSearch = -1;

        model.addAttribute("recruitments", this.recruitmentService.getRecruitments_Admin(page, -1, -1, true, null, caseSearch));
        model.addAttribute("counter", this.recruitmentService.countRecruitment_Admin(-1, -1, true, null, caseSearch));
        model.addAttribute("status", "active");
        model.addAttribute("status2", "number");

        return "getRecruiment_Admin";
    }

//    lương thỏa thuận
    @RequestMapping("/admin/recruitment/search-title")
    public String getRecruiment_Search2_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String title = params.getOrDefault("title", "");
        int caseSearch = 4;

        model.addAttribute("recruitments", this.recruitmentService.getRecruitments_Admin(page, -1, -1, true, title, caseSearch));
        model.addAttribute("counter", this.recruitmentService.countRecruitment_Admin(-1, -1, true, title, caseSearch));
        model.addAttribute("status", "active");
        model.addAttribute("status2", "text");

        return "getRecruiment_Admin";
    }

//    tìm theo lương 4 trường hợp:      case
    @RequestMapping("/admin/recruitment/search-salary")
    public String getRecruiment_Search1_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String title = params.getOrDefault("title", "");
        long salaryFrom = 0;
        long salaryTo = 0;

        int caseSearch = -1;

        String kwSa1 = params.getOrDefault("salaryFrom", "");
        String kwSa2 = params.getOrDefault("salaryTo", "");

        if (kwSa1 != "" && kwSa2 != "") {
            caseSearch = 0;     // tìm kiếm có from và to
            salaryFrom = Long.parseLong(params.get("salaryFrom"));
            salaryTo = Long.parseLong(params.get("salaryTo"));
        }
        if (kwSa1 != "" && kwSa2 == "") {
            caseSearch = 1;     // tìm kiếm có from
            salaryFrom = Long.parseLong(params.get("salaryFrom"));
        }
        if (kwSa1 == "" && kwSa2 != "") {
            caseSearch = 2;     // tìm kiếm có to
            salaryFrom = Long.parseLong(params.getOrDefault("salaryTo", "1"));
            salaryTo = Long.parseLong(params.get("salaryTo"));
        }
        if (kwSa1 == "" && kwSa2 == "") {
            caseSearch = 3;     // tìm kiếm không có from và to
        }

        model.addAttribute("recruitments", this.recruitmentService.getRecruitments_Admin(page, salaryFrom, salaryTo, true, title, caseSearch));
        model.addAttribute("counter", this.recruitmentService.countRecruitment_Admin(salaryFrom, salaryTo, false, title, caseSearch));
        model.addAttribute("status", "active");
        model.addAttribute("status2", "number");

        return "getRecruiment_Admin";
    }

    //    bài viết bị khóa
    @RequestMapping("/admin/recruitment/inactive")
    public String getRecruiment_Inactive_Admin(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String title = params.getOrDefault("title", "");
        int caseSearch = 5;

        model.addAttribute("recruitments", this.recruitmentService.getRecruitments_Admin(page, -1, -1, false, title, caseSearch));
        model.addAttribute("counter", this.recruitmentService.countRecruitment_Admin(-1, -1, false, title, caseSearch));
        model.addAttribute("status", "inactive");

        return "getRecruiment_Admin";
    }

}

//các trường hợp tìm kiếm     : case
//0   :      from    to
//1   :      from    -
//2   :      -       to
//3   :      -       -
//4   :      lương thỏa thuận   -   chỉ tìm kiếm theo title
//5   :      inactive   -   chỉ tìm kiếm theo title
//-1  :   tìm kiếm mặc định theo active
