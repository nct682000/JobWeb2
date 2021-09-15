/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Location;
import com.qv_ct.pojos.Role;
import com.qv_ct.pojos.User;
import com.qv_ct.repository.UserRepository;
import java.util.List;
import org.hibernate.query.Query;
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
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<User> getUsers(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        if (!username.isEmpty()) {
            Predicate p = builder.equal(root.get("username").as(String.class), username);
            query = query.where(p);
        }

        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        Predicate p = builder.equal(root.get("id"), id);

        query = query.where(p);
        Query q = session.createQuery(query);

        return (User) q.getSingleResult();
    }

    @Override
    public List<User> getCadidates() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From User U Where U.role = 2");

        return q.getResultList();
    }

    @Override
    public List<User> getRecruiters() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From User U Where U.role = 1");

        return q.getResultList();
    }

    @Override
    public boolean addOrUpdate(User user, Role role) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Location l = new Location(user.getAddress(), user.getProvince());
            user.setLocation(l);

            session.save(l);
            session.save(user);
            return true;
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

//    ----------------  admin   --------------------
//    danh sách ứng viên
    @Override
    public List<User> getCadidates_Admin(int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From User U Where U.role = 2");

        int max = 6;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);

        return q.getResultList();
    }

    @Override
    public long countCadidates_Admin() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) From User U Where U.role = 2");

        return Long.parseLong(q.getSingleResult().toString());
    }

//    danh sánh nhà ứng tuyển
    @Override
    public List<User> getRecruiters_Admin(int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From User U Where U.role = 1");

        int max = 6;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);

        return q.getResultList();
    }

    @Override
    public long countRecruiters_Admin() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) From User U Where U.role = 1");

        return Long.parseLong(q.getSingleResult().toString());
    }

}
