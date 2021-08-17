/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.User;
import com.qv_ct.repository.UserRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author nct68
 */
@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<User> getUsers() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<User> query = builder.createQuery(User.class);
//        Root root = query.from(User.class);
//        query = query.select(root);
//        
//        Query q = session.createQuery(query);

        Query q = session.createQuery("From User U Where U.role = 1");
        
        return q.getResultList();
    }
    
}
