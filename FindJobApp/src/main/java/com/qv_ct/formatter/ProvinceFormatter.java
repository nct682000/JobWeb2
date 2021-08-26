/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.formatter;

import com.qv_ct.pojos.Province;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author nct68
 */
public class ProvinceFormatter implements Formatter<Province>{

    @Override
    public String print(Province p, Locale locale) {
        return String.valueOf(p.getId());
    }

    @Override
    public Province parse(String id, Locale locale) throws ParseException {
        Province p = new Province();
        p.setId(Integer.parseInt(id));
        
        return p;
    }
    
}
