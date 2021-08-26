/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.formatter;

import com.qv_ct.pojos.Location;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author nct68
 */
public class LocationFormatter implements Formatter<Location>{

    @Override
    public String print(Location l, Locale locale) {
        return String.valueOf(l.getId());
    }

    @Override
    public Location parse(String id, Locale locale) throws ParseException {
        Location l = new Location();
        l.setId(Integer.parseInt(id));
        
        return l;
    }
    
}
