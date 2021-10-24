/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service;

import com.qv_ct.pojos.Reply;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface ReplyService {
    Reply getReplyById(int id);
    List<Reply> getReplyByCommentId(int id);
    Reply addReply(String content, int commenterId, int commentId);
    Reply deleteReply(int userId, int id);
}
