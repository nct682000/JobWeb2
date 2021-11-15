/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Apply;
import com.qv_ct.service.ApplyService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author nct68
 */
@RestController
public class ApiApplyController {
    @Autowired
    private ApplyService applyService;
    
    
    @PostMapping(path = "/api/hidden-apply", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Apply> hiddenApply(@RequestBody Map<String, String> params){
        try{
            int applyId = Integer.parseInt(params.get("applyId"));
            Apply a = this.applyService.hiddenApply(applyId);
            return new ResponseEntity<>(a, HttpStatus.OK);
        }catch(Exception ex){
            System.err.println("------------API SWITCH RECRUITMENT ERROR------------" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
