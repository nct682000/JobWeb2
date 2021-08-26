/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.validator;

import com.qv_ct.pojos.User;
import com.qv_ct.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author nct68
 */
@Component
public class UserValidator implements Validator{
//    @Autowired
//    private UserService userService;

    @Override
    public boolean supports(Class<?> type) {
        return User.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User u = (User) o;
        
        //Unique
        if(!u.getUsername().isEmpty()){
             errors.rejectValue("username", "user.unique.myError");
        }
        
    }
    
}
