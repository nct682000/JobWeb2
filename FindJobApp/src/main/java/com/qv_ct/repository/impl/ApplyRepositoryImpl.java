/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Apply;
import com.qv_ct.repository.ApplyRepository;
import java.sql.Time;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class ApplyRepositoryImpl implements ApplyRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Apply> getApplies() {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Apply");

        return q.getResultList();
    }

    @Override
    public boolean addOrUpdate(Apply a) {
        Session session = sessionFactory.getObject().getCurrentSession();

        try {
            a.setCreatedDate(Time.from(Instant.now()));
            session.save(a);
            return true;
        } catch (Exception ex) {
            System.err.println("-------Add Apply Error-------" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Apply> getAppliesByUserId(int id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Apply> query = builder.createQuery(Apply.class);
        Root root = query.from(Apply.class);
        query = query.select(root);

        Predicate p = builder.equal(root.get("candidate"), id);

        query = query.where(p);
        query = query.orderBy(builder.desc(root.get("id")));
        Query q = session.createQuery(query);

        return q.getResultList();
    }
    
    @Override
    public List<Apply> getAppliesByRecruiter(int recId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Apply> query = builder.createQuery(Apply.class);
        Root root = query.from(Apply.class);
        query = query.select(root);
        
        Predicate p =builder.equal(root.get("recruitment").get("recruiter"), recId);
        
        query = query.where(p);
        query = query.orderBy(builder.desc(root.get("id")));
        Query q = session.createQuery(query);
        q.setMaxResults(10);
        
        return q.getResultList();
    }
    

    //    -------------     admin       --------------
    int maxList = 6;

    @Override
    public List<Apply> getApply_Admin(int page, boolean active, String title) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Apply> query = builder.createQuery(Apply.class);
        Root root = query.from(Apply.class);
        query = query.select(root);

        Predicate p2 = builder.equal(root.get("active"), active);
        String kw = "%" + title + "%";
        Predicate p1 = builder.like(root.get("title").as(String.class), kw);
        query.where(builder.and(p1, p2));

        query = query.orderBy(builder.desc(root.get("id")));

        Query q = s.createQuery(query);

        q.setMaxResults(maxList);
        q.setFirstResult((page - 1) * maxList);
        return q.getResultList();
    }

    @Override
    public long countApply_Admin(boolean active) {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Apply a WHERE a.active =:active");
        q.setParameter("active", active);

        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public boolean enableApply(int applyId, boolean active) {
        try {
            Session s = sessionFactory.getObject().getCurrentSession();
            Apply a = s.get(Apply.class, applyId);
            a.setActive(active);
            s.getTransaction().begin();
            s.save(a);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean deleteApply(int applyId) {
        try {
            Session s = sessionFactory.getObject().getCurrentSession();
            Apply a = s.get(Apply.class, applyId);
//            s.getTransaction().begin();
            s.delete(a);
//            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public long countApply_Admin_For_Chart(boolean active, int month, int year) {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Apply a WHERE month(a.createdDate) =:month AND year(a.createdDate) =:year AND a.active=:active");
        q.setParameter("month", month);
        q.setParameter("year", year);
        q.setParameter("active", active);

        return Long.parseLong(q.getSingleResult().toString());
    }

}
