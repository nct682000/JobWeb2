/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Apply;
import com.qv_ct.repository.ApplyRepository;
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
            session.save(a);

            return true;
        } catch (Exception ex) {
            System.err.println("-- Add Tag Error --" + ex.getMessage());
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
        Query q = session.createQuery(query);

        return q.getResultList();
    }

//    admin
    @Override
    public List<Apply> getApplyAll(int page) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Apply");

        int max = 6;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);

        return q.getResultList();
    }

    @Override
    public long countApplies() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) From Apply");

        return Long.parseLong(q.getSingleResult().toString());
    }

}
