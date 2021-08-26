/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.validator;

import com.qv_ct.pojos.Recruitment;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author nct68
 */
@Component
public class RecruitmentSalaryFromValidator implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return  Recruitment.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Recruitment r = (Recruitment) o;
        if (r.getSalaryFrom() != null && r.getSalaryTo() != null){
             if(r.getSalaryFrom().compareTo(r.getSalaryTo()) == 1){
                errors.rejectValue("salaryFrom", "recruitment.salaryForm.myError");
            }
        }
            
    }
    
}
