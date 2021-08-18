/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.formatter;

import com.qv_ct.pojos.Recruitment;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author nct68
 */
public class RecruitmentFormatter implements Formatter<Recruitment>{

    @Override
    public String print(Recruitment r, Locale locale) {
        return String.valueOf(r.getId());
    }

    @Override
    public Recruitment parse(String rId, Locale locale) throws ParseException {
        Recruitment r = new Recruitment();
        r.setId(Integer.parseInt(rId));
        
        return r;
    }
    
}
