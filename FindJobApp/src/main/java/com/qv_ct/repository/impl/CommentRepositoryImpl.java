/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Comment;
import com.qv_ct.pojos.User;
import com.qv_ct.repository.CommentRepository;
import java.sql.Time;
import java.time.Instant;
import java.util.List;
import java.util.Set;
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
public class CommentRepositoryImpl implements CommentRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Comment> getCommentByRecruiterId(int id) {
        
        Session session = sessionFactory.getObject().getCurrentSession();
        
//        Query q = session.createQuery("From Comment");
        
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Comment> query = builder.createQuery(Comment.class);
        Root root = query.from(Comment.class);
        query = query.select(root);
        
        Predicate p =builder.equal(root.get("commented"), id);
        
        query = query.where(p);
        query = query.orderBy(builder.desc(root.get("id")));
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }
    
    @Override
    public Comment getCommentById(int id){
        Session session = sessionFactory.getObject().getCurrentSession();
        
//        Query q = session.createQuery("From Comment");
        
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Comment> query = builder.createQuery(Comment.class);
        Root root = query.from(Comment.class);
        query = query.select(root);
        
        query = query.where(builder.equal(root.get("id"), id));
        Query q = session.createQuery(query);
        
        return (Comment) q.getSingleResult();
    }

    @Override
    public Comment addComment(Comment c) {
        Session session = sessionFactory.getObject().getCurrentSession();
        
        try{
            c.setCreatedDate(Time.from(Instant.now()));
            session.save(c);
            return c;
        }catch (HibernateException ex){
            ex.printStackTrace();
        }
        
        return null;
    }

    @Override
    public Comment deleteComment(Comment c) {
       Session session = sessionFactory.getObject().getCurrentSession();
       
        try {
            session.delete(c);
        } catch (HibernateException ex){
            ex.printStackTrace();
        }
        
        return null;
    }
    
}
