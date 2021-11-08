/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Interaction;
import com.qv_ct.service.InteractionService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author nct68
 */
@RestController
public class ApiInteractionController {
    @Autowired
    private InteractionService interactionService;
    
    @PostMapping(path = "/api/add-interaction", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Interaction> addInteraction(@RequestBody Map<String, String> params){
        try{
            int type = Integer.parseInt(params.get("type"));
            int userId = Integer.parseInt(params.get("userId"));
            int commentId = Integer.parseInt(params.get("commentId"));
            
            Interaction i = this.interactionService.addOrUpdate(type, userId, commentId);
            return new ResponseEntity<>(i, HttpStatus.CREATED);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @DeleteMapping(path = "/api/delete-interaction")
    public ResponseEntity<Interaction> deleteInteraction(@RequestBody Map<String, String> params){
        try{
            int currentUserId = Integer.parseInt(params.get("currentUserId"));
            int userId = Integer.parseInt(params.get("userId"));
            int interactionId = Integer.parseInt(params.get("interactionId"));
            
            Interaction i = this.interactionService.deleteInteraction(currentUserId, userId, interactionId);
            return new ResponseEntity<>(i, HttpStatus.OK);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
