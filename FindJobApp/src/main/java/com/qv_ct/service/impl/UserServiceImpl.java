/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qv_ct.pojos.Role;
import com.qv_ct.pojos.User;
import com.qv_ct.repository.UserRepository;
import com.qv_ct.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author nct68
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<User> getUsers(String username) {
        return this.userRepository.getUsers(username);
    }

    @Override
    public List<User> getCadidates() {
        return this.userRepository.getCadidates();
    }

    @Override
    public List<User> getRecruiters() {
        return this.userRepository.getRecruiters();
    }

    @Override
    public boolean addOrUpdate(User user, Role role) {
        try {
            if (!user.getFile().isEmpty()) {
                Map map = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));

                user.setAvatar((String) map.get("secure_url"));
            }
            String pass = user.getPassword();
            if(pass.length() <= 32)
                user.setPassword(this.passwordEncoder.encode(pass));
            
            return this.userRepository.addOrUpdate(user, role);

        } catch (IOException ex) {
            System.err.println("-----Add Error-----" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public User getUserById(int id) {
        return this.userRepository.getUserbyId(id);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUsers(username);
        if (users.isEmpty()) {
            throw new UsernameNotFoundException("T??i kho???n kh??ng t???n t???i");
        }

        User user = users.get(0);

        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getRole().toString()));

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), auth);

    }

    @Override
    public List<Object[]> getTopRecruiter(int num) {
        return this.userRepository.getTopRecruiter(num);
    }

//    ----------------  admin   --------------------
//    danh s??ch ng?????i d??ng theo role
    @Override
    public List<User> getUsers_Admin(int page, Role role, boolean active, String email) {
        return this.userRepository.getUsers_Admin(page, role, active, email);
    }

    @Override
    public long countUsers_Admin(Role role, boolean active) {
        return this.userRepository.countUsers_Admin(role, active);

    }

    @Override
    public boolean enableUser(int userId, boolean active) {
        return this.userRepository.enableUser(userId, active);
    }

    @Override
    public boolean deleteUser(int userId) {
        return this.userRepository.deleteUser(userId);
    }
   
}
