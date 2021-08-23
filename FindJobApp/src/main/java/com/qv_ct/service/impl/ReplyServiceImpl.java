/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service.impl;

import com.qv_ct.pojos.Reply;
import com.qv_ct.repository.ReplyRepository;
import com.qv_ct.service.ReplyService;
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

    @Override
    public List<Reply> getReplyByCommentId(int id) {
        return this.replyRepository.getReplyByCommentId(id);
    }
    
}
