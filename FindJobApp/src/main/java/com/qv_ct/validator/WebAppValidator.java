/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.validator;

import com.qv_ct.pojos.Recruitment;
import com.qv_ct.pojos.User;
import java.util.Set;
import javax.validation.ConstraintViolation;
import org.apache.commons.lang.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author nct68
 */
@Component
public class WebAppValidator implements Validator{
    @Autowired
    private javax.validation.Validator beanValidator;
    
    private Set<Validator> springValidators;

    @Override
    public boolean supports(Class<?> type) {
        return Recruitment.class.isAssignableFrom(type) || User.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Set<ConstraintViolation<Object>> beans = this.beanValidator.validate(o);
        for (ConstraintViolation<Object> obj: beans)
            errors.rejectValue(obj.getPropertyPath().toString(),
                    obj.getMessageTemplate(),
                    obj.getMessage());
        
        for (Validator v: this.springValidators)
            v.validate(o, errors);
    }

    /**
     * @param springValidators the springValidators to set
     */
    public void setSpringValidators(Set<Validator> springValidators) {
        this.springValidators = springValidators;
    }
    
}
