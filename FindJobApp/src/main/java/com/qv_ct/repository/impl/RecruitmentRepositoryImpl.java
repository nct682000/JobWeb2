/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Recruitment;
import com.qv_ct.repository.RecruitmentRepository;
import java.time.Instant;
import java.util.Date;
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
public class RecruitmentRepositoryImpl implements RecruitmentRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Recruitment> getRecruitments(int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Recruitment> query = builder.createQuery(Recruitment.class);
        Root root = query.from(Recruitment.class);
        query = query.select(root);
        
        Query q = session.createQuery(query);
        
        int max = 4;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        
        return q.getResultList();
    }
    
    @Override
    public Recruitment getRecruitmentById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
//        Query q = session.createQuery("From Recruitment R Where R.id = id");

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Recruitment> query = builder.createQuery(Recruitment.class);
        Root root = query.from(Recruitment.class);
        query = query.select(root);
        
        Predicate p = builder.equal(root.get("id"), id);
        
        query = query.where(p);
        Query q = session.createQuery(query);
        
        return (Recruitment) q.getSingleResult();
    }

    
     @Override
    public List<Recruitment> searchRecruitment(String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Recruitment> query = builder.createQuery(Recruitment.class);
        Root root = query.from(Recruitment.class);
        query = query.select(root);
        

        Predicate p = builder.like(root.get("title").as(String.class)
                ,String.format("%%%s%%", kw));
        
        query = query.where(p);
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdate(Recruitment r) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            r.setCreatedDate(Date.from(Instant.now()));
            r.setUpdatedDate(Date.from(Instant.now()));
            session.save(r);
            
            return true;
        }catch (Exception ex){
            System.err.println("-- Add Recruitment Error --" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public long countRecruitment() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Recruitment");
        
        return Long.parseLong(q.getSingleResult().toString());
    }
        
}
