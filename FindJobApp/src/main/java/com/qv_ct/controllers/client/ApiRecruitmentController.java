/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Recruitment;
import com.qv_ct.service.RecruitmentService;
import java.util.Map;
import org.hibernate.annotations.UpdateTimestamp;
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
public class ApiRecruitmentController {
    @Autowired
    private RecruitmentService recruitmentService;
    
    
    @PostMapping(path = "/api/switch-active-recruitment", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Recruitment> switchActiveRecruitment(@RequestBody Map<String, String> params){
        try{
            int recId = Integer.parseInt(params.get("recId"));
            Recruitment r = this.recruitmentService.switchActiveRecruitment(recId);
            return new ResponseEntity<>(r, HttpStatus.OK);
        }catch(Exception ex){
            System.err.println("------------API SWITCH RECRUITMENT ERROR------------" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
