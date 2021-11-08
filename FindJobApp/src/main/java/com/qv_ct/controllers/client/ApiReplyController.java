/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Reply;
import com.qv_ct.service.ReplyService;
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
public class ApiReplyController {
    @Autowired
    private ReplyService replyService;
    
    @PostMapping(path = "/api/add-reply", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Reply> addReply(@RequestBody Map<String, String> params){
        try{
            String content = params.get("content");
            int replyerId = Integer.parseInt(params.get("replyerId"));
            int commentId = Integer.parseInt(params.get("commentId"));
            
            Reply r = this.replyService.addReply(content, replyerId, commentId);
            return new ResponseEntity<>(r, HttpStatus.CREATED);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @DeleteMapping(path = "/api/delete-reply")
    public ResponseEntity<Reply> deleteReply(@RequestBody Map<String, String> params){
        try{
            int userId = Integer.parseInt(params.get("userId"));
            int replyId = Integer.parseInt(params.get("replyId"));
            
            Reply r = this.replyService.deleteReply(userId, replyId);
            return new ResponseEntity<>(r, HttpStatus.OK);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}