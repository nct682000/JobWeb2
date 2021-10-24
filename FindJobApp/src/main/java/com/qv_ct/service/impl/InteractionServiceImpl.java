/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service.impl;

import com.qv_ct.pojos.Comment;
import com.qv_ct.pojos.Interaction;
import com.qv_ct.pojos.Type;
import com.qv_ct.pojos.User;
import com.qv_ct.repository.InteractionRepository;
import com.qv_ct.service.CommentService;
import com.qv_ct.service.InteractionService;
import com.qv_ct.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nct68
 */
@Service
public class InteractionServiceImpl implements InteractionService{
    @Autowired
    private InteractionRepository interactionRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

    @Override
    public List<Interaction> getInteraction(int userId, int commentId) {
        return this.interactionRepository.getInteraction(userId, commentId);
    }
    
    @Override
    public Interaction addOrUpdate(int type, int userId, int commentId) {
        Type t = Type.getType(type);
        User u = this.userService.getUserById(userId);
        Comment c = this.commentService.getCommentById(commentId);
        
        if(!this.interactionRepository.getInteraction(userId, commentId).isEmpty()){
            Interaction i = this.interactionRepository.getInteraction(userId, commentId).get(0);
            i.setType(t);
            return this.interactionRepository.addOrUpdate(i);
        }
        
        Interaction i = new Interaction();
        i.setType(t);
        i.setUser(u);
        i.setComment(c);
        
        return this.interactionRepository.addOrUpdate(i);
    }

    @Override
    public Interaction deleteInteraction(int currentUserId, int userId, int commentId) {
        Interaction i = this.interactionRepository.getInteraction(userId, commentId).get(0);
        
        if(currentUserId == userId)
            return this.interactionRepository.deleteInteraction(i);
        
        return null;
    }
    
    
    
}
