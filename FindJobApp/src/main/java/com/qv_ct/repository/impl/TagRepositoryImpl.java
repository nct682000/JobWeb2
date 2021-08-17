/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Tag;
import com.qv_ct.repository.TagRepository;
import java.util.List;
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
public class TagRepositoryImpl implements TagRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Tag> getTags() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Tag");
        
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdate(Tag t) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try{
            session.save(t);
            
            return true;
        }catch (Exception ex){
            System.err.println("-- Add Tag Error --" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }
    
}
