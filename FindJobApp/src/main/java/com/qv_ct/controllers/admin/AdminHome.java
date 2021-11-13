/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.admin;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.qv_ct.service.ApplyService;
import com.qv_ct.service.RateService;
import com.qv_ct.service.BenefitService;
import com.qv_ct.service.CareerService;
import com.qv_ct.service.TagService;
import java.time.LocalDate;
import com.qv_ct.pojos.Benefit;
import com.qv_ct.pojos.Career;
import com.qv_ct.pojos.Tag;
import javax.validation.Valid;
import org.springframework.validation.BindingResult;
import java.text.ParseException;

/**
 *
 * @author DELL
 */
@Controller
public class AdminHome {

    @Autowired
    private ApplyService applyService;
    @Autowired
    private RateService rateService;
    @Autowired
    private BenefitService benefitService;
    @Autowired
    private CareerService careerService;
    @Autowired
    private TagService tagService;

    @RequestMapping("/admin")
    public String dashboard(Model model, @RequestParam(required = false) Map<String, String> params) {
        boolean active = Boolean.parseBoolean(params.getOrDefault("active", "true"));
        int year = Integer.parseInt(params.getOrDefault("year", "2021"));
        String sort = params.getOrDefault("sort", "thang");

        LocalDate current = java.time.LocalDate.now();
        int month = Integer.parseInt(current.toString().substring(5, 7));
        int sortMonth = Integer.parseInt(params.getOrDefault("sortMonth", String.valueOf(month)));
        String sort2 = params.getOrDefault("sort2", "nam");

        if (sort2.equals("nam")) {
            model.addAttribute("rateChart", this.rateService.rateForChart(year));
            model.addAttribute("countApplyByCompany", this.applyService.countApply_ByCompany_ForChart(year));
            model.addAttribute("countApplyByJob", this.applyService.countApply_ByJob_ForChart(year));
            model.addAttribute("countApplyByCity", this.applyService.countApply_ByCity_ForChart(year));
            model.addAttribute("sortBy2", "nam");
        } else {
            model.addAttribute("rateChart", this.rateService.rateForChart2(year, sortMonth));
            model.addAttribute("countApplyByCompany", this.applyService.countApply_ByCompany2_ForChart(year, sortMonth));
            model.addAttribute("countApplyByJob", this.applyService.countApply_ByJob2_ForChart(year, sortMonth));
            model.addAttribute("countApplyByCity", this.applyService.countApply_ByCity2_ForChart(year, sortMonth));
            model.addAttribute("sortBy2", "thang");
            model.addAttribute("month", sortMonth);

        }

        double avg = 0;
        int total = 0;
        if (sort.equals("thang")) {
            long[] data = new long[12];
            for (int i = 1; i <= 12; i++) {
                data[i - 1] = this.applyService.countApply_Admin_For_Chart(active, i, year);
                total += (int) data[i - 1];
            }
            avg = total / 12.0;
            model.addAttribute("counterApples", data);
            model.addAttribute("sortBy", "thang");
            model.addAttribute("year", year);
            model.addAttribute("total", total);
            model.addAttribute("avg", avg);
        } else {
            long[] data = new long[4];
            for (int i = 1; i <= 4; i++) {
                for (int j = 1; j <= 3; j++) {
                    int flag = j + (3 * (i - 1));
                    data[i - 1] += this.applyService.countApply_Admin_For_Chart(active, flag, year);
                }
                total += (int) data[i - 1];
            }
            avg = total / 4.0;
            model.addAttribute("counterApples", data);
            model.addAttribute("sortBy", "quy");
            model.addAttribute("year", year);
            model.addAttribute("total", total);
            model.addAttribute("avg", avg);
        }

        return "dashboard";
    }

    @RequestMapping("/admin/others")
    public String getOthers_Admin(Model model) {
//        model.addAttribute("benefit", new Benefit());
//        model.addAttribute("career", new Career());
//        model.addAttribute("tag", new Tag());

        model.addAttribute("benefits", this.benefitService.getBenefits());
        model.addAttribute("careers", this.careerService.getCareers());
        model.addAttribute("tags", this.tagService.getTags());

        return "getOthers_Admin";
    }

    @GetMapping("/admin/others/benefit/new")
    public String createBenefit_Admin_View(Model model) {
        model.addAttribute("benefit", new Benefit());

        model.addAttribute("benefits", this.benefitService.getBenefits());
        model.addAttribute("careers", this.careerService.getCareers());
        model.addAttribute("tags", this.tagService.getTags());
        model.addAttribute("type", "createBenefit");

        return "getOthers_Admin";
    }

    @GetMapping("/admin/others/career/new")
    public String createCareer_Admin_View(Model model) {
        model.addAttribute("career", new Career());

        model.addAttribute("benefits", this.benefitService.getBenefits());
        model.addAttribute("careers", this.careerService.getCareers());
        model.addAttribute("tags", this.tagService.getTags());
        model.addAttribute("type", "createCareer");

        return "getOthers_Admin";
    }

    @GetMapping("/admin/others/tag/new")
    public String createTag_Admin_View(Model model) {
        model.addAttribute("tag", new Tag());

        model.addAttribute("benefits", this.benefitService.getBenefits());
        model.addAttribute("careers", this.careerService.getCareers());
        model.addAttribute("tags", this.tagService.getTags());
        model.addAttribute("type", "createTag");

        return "getOthers_Admin";
    }

    @PostMapping("/admin/others/benefit/new")
    public String createBenefit_Admin_Process(Model model,
            @ModelAttribute(value = "benefit") @Valid Benefit benefit,
            BindingResult result) throws ParseException {
        String errorBenefit = "";

        if (!result.hasErrors()) {
            if (this.benefitService.addOrUpdate(benefit) == true) {
                return "redirect:/admin/others";
            } else {
                errorBenefit = "Xảy ra lỗi, vui lòng thực hiện lại!";
            }

        } else {
            errorBenefit = "Tên phúc lợi phải có độ dài từ 5 - 30 kí tự";
        }

        model.addAttribute("type", "createBenefit");
        model.addAttribute("errorBenefit", errorBenefit);

        return "getOthers_Admin";
    }

    @PostMapping("/admin/others/career/new")
    public String createCareer_Admin_Process(Model model,
            @ModelAttribute(value = "career") @Valid Career career,
            BindingResult result) throws ParseException {
        String errorCareer = "";

        if (career.getName().length() < 5 || career.getName().length() > 30) {
            errorCareer = "Tên nghề nghiệp phải có độ dài từ 5 - 30 kí tự";
        } else {
            if (!result.hasErrors()) {
                if (this.careerService.addOrUpdate(career) == true) {
                    return "redirect:/admin/others";
                } else {
                    errorCareer = "Xảy ra lỗi, vui lòng thực hiện lại!";
                }

            } else {
                errorCareer = "Tên nghề nghiệp có độ dài không hợp lệ";
            }
        }

        model.addAttribute("type", "createCareer");
        model.addAttribute("errorCareer", errorCareer);

        return "getOthers_Admin";
    }

    @PostMapping("/admin/others/tag/new")
    public String createTag_Admin_Process(Model model,
            @ModelAttribute(value = "tag") @Valid Tag tag,
            BindingResult result) throws ParseException {
        String errorTag = "";

        if (!result.hasErrors()) {
            if (this.tagService.addOrUpdate(tag) == true) {
                return "redirect:/admin/others";
            } else {
                errorTag = "Xảy ra lỗi, vui lòng thực hiện lại!";
            }

        } else {
            errorTag = "Tên tài khoản có độ dài từ 2 - 20 kí tự";
        }

        model.addAttribute("type", "createTag");
        model.addAttribute("errorTag", errorTag);

        return "getOthers_Admin";
    }
}
