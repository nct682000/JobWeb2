/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Apply;
import com.qv_ct.pojos.Location;
import com.qv_ct.pojos.Recruitment;
import com.qv_ct.pojos.Role;
import com.qv_ct.pojos.User;
import com.qv_ct.repository.UserRepository;
import com.qv_ct.service.RecruitmentService;
import java.util.ArrayList;
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
//        
        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public User getUserbyId(int id) {
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
            user.setRole(role);
            session.saveOrUpdate(l);
            session.saveOrUpdate(user);
            return true;
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

//    admin
    @Override
//    @Transactional      // giao tác từng phần
    public List<User> getUserAll() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From User");
        return q.getResultList();
    }

    @Override
    public List<Object[]> getTopRecruiter(int num) {
        Session session = sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootU = query.from(User.class);
        Root rootR = query.from(Recruitment.class);
        Root rootA = query.from(Apply.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootA.get("recruitment"), rootR.get("id")));
        predicates.add(builder.equal(rootR.get("recruiter"), rootU.get("id")));

        query.multiselect(rootU.get("id"),
                rootU.get("companyName"),
                rootU.get("avatar"),
                builder.count(rootU.get("id")));
        
        query.where(predicates.toArray(new Predicate[] {}));
        
        query = query.groupBy(rootU.get("id"));
        query = query.orderBy(builder.desc(builder.count(rootU.get("id"))));

        Query q = session.createQuery(query);
        q.setMaxResults(num);

        return q.getResultList();
    }

//    ----------------  admin   --------------------
    int maxList = 6;

//    danh sách người dùng theo role
    @Override
    public List<User> getUsers_Admin(int page, Role role, boolean active, String email) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        Predicate p1 = builder.equal(root.get("role"), role);
        Predicate p2 = builder.equal(root.get("active"), active);
        if (email == null) {
            query = query.where(builder.and(p1, p2));
        } else {
            String kw = "%" + email + "%";
            Predicate p3 = builder.like(root.get("mail").as(String.class), kw);
            query = query.where(builder.and(p1, p2, p3));
        }
        query = query.orderBy(builder.desc(root.get("id")));

        Query q = s.createQuery(query);

        q.setMaxResults(maxList);
        q.setFirstResult((page - 1) * maxList);
        return q.getResultList();

    }

    @Override
    public long countUsers_Admin(Role role, boolean active) {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM User U WHERE U.role = :role AND U.active =:active");
        q.setParameter("role", role);
        q.setParameter("active", active);

        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public boolean enableUser(int userId, boolean active) {
        try {
            Session s = sessionFactory.getObject().getCurrentSession();
            User u = s.get(User.class, userId);
            u.setActive(active);
            s.getTransaction().begin();
            s.save(u);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean deleteUser(int userId) {
        try {
            Session s = sessionFactory.getObject().getCurrentSession();
            User u = s.get(User.class, userId);
//            s.getTransaction().begin();
            s.delete(u);
//            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean addEmployee(User user, Role role) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            user.setRole(role);
            session.save(user);
            return true;
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }
}