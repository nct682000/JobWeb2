/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service;

import com.qv_ct.pojos.User;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface UserService {
    List<User> getUsers();
    List<User> getCadidates();
    List<User> getRecruiters();
}
