/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service;

import com.qv_ct.pojos.Interaction;
import com.qv_ct.pojos.Type;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface InteractionService {
    List<Interaction> getInteraction(int userId, int commentId);
    Interaction addOrUpdate(int type, int userId, int commentId);
    Interaction deleteInteraction(int currentUserId, int userId, int commentId);
}
