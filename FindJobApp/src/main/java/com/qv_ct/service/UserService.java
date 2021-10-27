/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service;

import com.qv_ct.pojos.Role;
import com.qv_ct.pojos.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author nct68
 */
public interface UserService extends UserDetailsService {

    List<User> getCadidates();

    List<User> getRecruiters();

    List<User> getUsers(String username);

    boolean addOrUpdate(User user, Role role);

    User getUserById(int id);

    List<Object[]> getTopRecruiter(int num);

//    ----------------  admin   --------------------
//    danh sách người dùng theo role
    List<User> getUsers_Admin(int page, Role role, boolean active, String email);

    long countUsers_Admin(Role role, boolean active);

    boolean enableUser(int userId, boolean active);

    boolean deleteUser(int userId);

    boolean addEmployee(User user, Role role);
    
    boolean addOrUpdate2(User user);
}
