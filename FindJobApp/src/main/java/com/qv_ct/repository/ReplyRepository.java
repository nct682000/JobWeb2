/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository;

import com.qv_ct.pojos.Reply;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface ReplyRepository {
    Reply getReplyById(int id);
    List<Reply> getReplyByCommentId(int id);
    Reply addReply(Reply r);
    Reply deleteReply(Reply r);
}
