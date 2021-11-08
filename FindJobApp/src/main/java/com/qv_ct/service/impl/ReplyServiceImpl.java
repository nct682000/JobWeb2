/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service.impl;

import com.qv_ct.pojos.Comment;
import com.qv_ct.pojos.Reply;
import com.qv_ct.pojos.User;
import com.qv_ct.repository.ReplyRepository;
import com.qv_ct.service.CommentService;
import com.qv_ct.service.ReplyService;
import com.qv_ct.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nct68
 */
@Service
public class ReplyServiceImpl implements ReplyService{
    @Autowired
    private ReplyRepository replyRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

    @Override
    public Reply getReplyById(int id) {
        return this.replyRepository.getReplyById(id);
    }
    
    @Override
    public List<Reply> getReplyByCommentId(int id) {
        return this.replyRepository.getReplyByCommentId(id);
    }

    @Override
    public Reply addReply(String content, int replyerId, int commentId) {
        if (content.trim() == "")
            return null;
        User u = this.userService.getUserById(replyerId);
        Comment c = this.commentService.getCommentById(commentId);
        Reply r = new Reply();
        r.setContent(content);
        r.setReplyer(u);
        r.setComment(c);
        
        return this.replyRepository.addReply(r);
    }

    @Override
    public Reply deleteReply(int userId, int id) {
        User u = this.userService.getUserById(userId);
        Reply r = this.replyRepository.getReplyById(id);
        if(u.getId() == r.getReplyer().getId())
            return this.replyRepository.deleteReply(r);
        
        return null;
    }
    
    
    
}
