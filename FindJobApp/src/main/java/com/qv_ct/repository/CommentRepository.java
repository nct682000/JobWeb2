/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository;

import com.qv_ct.pojos.Comment;
import java.util.List;
import java.util.Set;

/**
 *
 * @author nct68
 */
public interface CommentRepository {
    List<Comment> getCommentByRecruiterId(int id);
}
