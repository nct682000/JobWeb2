/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository;

import com.qv_ct.pojos.Role;
import com.qv_ct.pojos.User;
import java.util.List;

/**
 *
 * @author nct68
 */
public interface UserRepository {

    List<User> getCadidates();

    List<User> getRecruiters();

    List<User> getUsers(String username);

    boolean addOrUpdate(User user, Role role);

    User getUserById(int id);

//    ----------------  admin   --------------------
//    danh sách người dùng theo role
    List<User> getUsers_Admin(int page, Role role, boolean active, String email);

    long countUsers_Admin(Role role, boolean active);

}
