/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.formatter;

import com.qv_ct.pojos.User;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author nct68
 */
public class UserFormatter implements Formatter<User>{

    @Override
    public String print(User u, Locale locale) {
        return String.valueOf(u.getId());
    }

    @Override
    public User parse(String recruiterId, Locale locale) throws ParseException {
        User u = new User();
        u.setId(Integer.parseInt(recruiterId));
        
        return u;
    }
    
}
