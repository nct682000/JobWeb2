/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service.impl;

import com.qv_ct.pojos.Comment;
import com.qv_ct.pojos.User;
import com.qv_ct.repository.CommentRepository;
import com.qv_ct.service.CommentService;
import com.qv_ct.service.RecruitmentService;
import com.qv_ct.service.UserService;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nct68
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private UserService userService;

    @Override
    public List<Comment> getCommentByRecruiterId(int id) {
        return this.commentRepository.getCommentByRecruiterId(id);
    }
    
    @Override
    public Comment getCommentById(int id) {
        return this.commentRepository.getCommentById(id);
    }

    @Override
    public Comment addComment(String content, int commenterId, int commentedId) {
        if (content.trim() == "")
            return null;
        User u1 = this.userService.getUserById(commenterId);
        User u2 = this.userService.getUserById(commentedId);
        Comment c = new Comment();
        c.setCommenter(u1);
        c.setCommented(u2);
        c.setContent(content);
        return this.commentRepository.addComment(c);
    }

    @Override
    public Comment deleteComment(int userId, int id) {
        User u = this.userService.getUserById(userId);
        Comment c = this.commentRepository.getCommentById(id);
        
        if(u.getId() == c.getCommenter().getId())
            return this.commentRepository.deleteComment(c);
        
        return null;
    }
    
}
