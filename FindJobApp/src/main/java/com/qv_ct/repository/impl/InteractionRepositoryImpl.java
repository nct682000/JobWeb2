/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Comment;
import com.qv_ct.pojos.Interaction;
import com.qv_ct.repository.InteractionRepository;
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
public class InteractionRepositoryImpl implements InteractionRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Interaction> getInteraction(int userId, int commentId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Interaction> query = builder.createQuery(Interaction.class);
        Root root = query.from(Interaction.class);
        
        Predicate p1 = builder.equal(root.get("user").get("id"), userId);
        Predicate p2 = builder.equal(root.get("comment").get("id"), commentId);
        
        query = query.where(builder.and(p1, p2));
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }
    
    @Override
    public Interaction addOrUpdate(Interaction i) {
        Session session = sessionFactory.getObject().getCurrentSession();
        
        try{
            session.saveOrUpdate(i);
            return i;
        }catch (HibernateException ex){
            ex.printStackTrace();
        }
        
        return null;
    }

    @Override
    public Interaction deleteInteraction(Interaction i) {
        Session session = sessionFactory.getObject().getCurrentSession();
        
        try{
            session.delete(i);
            return i;
        }catch (HibernateException ex){
            ex.printStackTrace();
        }
        
        return null;
    }
    
    
    
}
