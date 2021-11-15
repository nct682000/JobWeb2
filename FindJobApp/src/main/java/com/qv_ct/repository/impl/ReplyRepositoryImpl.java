/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Reply;
import com.qv_ct.repository.ReplyRepository;
import java.sql.Time;
import java.time.Instant;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
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
public class ReplyRepositoryImpl implements ReplyRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Reply getReplyById(int id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Reply> query = builder.createQuery(Reply.class);
        Root root = query.from(Reply.class);
        query = query.select(root);
        
        query = query.where(builder.equal(root.get("id"), id));
        Query q = session.createQuery(query);
        
        return (Reply) q.getSingleResult();
    }
    
    @Override
    public List<Reply> getReplyByCommentId(int id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Reply> query = builder.createQuery(Reply.class);
        Root root = query.from(Reply.class);
        query = query.select(root);
        
        Predicate p = builder.equal(root.get("comment"), id);
        query = query.where(p);
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public Reply addReply(Reply r) {
        Session session = sessionFactory.getObject().getCurrentSession();
        
        try{
            r.setCreatedDate(Time.from(Instant.now()));
            session.save(r);
            return r;
        }catch (HibernateException ex){
            ex.printStackTrace();
        }
        
        return null;
    }

    @Override
    public Reply deleteReply(Reply r) {
        Session session = sessionFactory.getObject().getCurrentSession();
        
        try{
            session.delete(r);
            return r;
        }catch (HibernateException ex){
            ex.printStackTrace();
        }
        
        return null;
    }
    
    
    
}
