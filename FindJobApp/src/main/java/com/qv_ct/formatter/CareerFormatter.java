/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.formatter;

import com.qv_ct.pojos.Career;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;


/**
 *
 * @author nct68
 */
public class CareerFormatter implements Formatter<Career>{

    @Override
    public String print(Career c, Locale locale) {
        return String.valueOf(c.getId());
    }

    @Override
    public Career parse(String careerId, Locale locale) throws ParseException {
        Career c = new Career();
        c.setId(Integer.parseInt(careerId));
        
        return  c;
    }
    
}
