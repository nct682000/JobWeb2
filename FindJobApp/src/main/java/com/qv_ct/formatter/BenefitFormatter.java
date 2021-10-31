/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.formatter;

import com.qv_ct.pojos.Benefit;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author nct68
 */
public class BenefitFormatter implements Formatter<Benefit>{

    @Override
    public String print(Benefit b, Locale locale) {
        return String.valueOf(b.getId());
    }

    @Override
    public Benefit parse(String bId, Locale locale) throws ParseException {
        Benefit b = new Benefit();
        b.setId(Integer.parseInt(bId));
        
        return b;
    }
    
}
