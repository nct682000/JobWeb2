/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.formatter;

import com.qv_ct.pojos.Tag;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author nct68
 */
public class TagFormatter implements Formatter<Tag>{

    @Override
    public String print(Tag t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Tag parse(String tId, Locale locale) throws ParseException {
        Tag t = new Tag();
        t.setId(Integer.parseInt(tId));
        
        return t;
    }
    
    
}
