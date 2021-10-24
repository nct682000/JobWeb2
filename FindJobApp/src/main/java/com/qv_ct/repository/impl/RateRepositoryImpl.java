/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Rate;
import com.qv_ct.repository.RateRepository;
import java.text.DecimalFormat;
import java.time.Instant;
import java.util.Date;
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
public class RateRepositoryImpl implements RateRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Rate addOrUpdate(Rate r) {
        Session session = sessionFactory.getObject().getCurrentSession();
        
         try{
            r.setCreatedDate(Date.from(Instant.now()));
            session.saveOrUpdate(r);
            return r;
        }catch (HibernateException ex){
            ex.printStackTrace();
        }
         
         return null;
    }

    @Override
    public long rateCountRecruiter(int recId) {
        Session session = sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<Rate> query = builder.createQuery(Rate.class);
//        Root root = query.from(Rate.class);
//        query = (CriteriaQuery<Rate>) builder.count(builder.equal(root.get("recruiter"), recId));
//        Query q = session.createQuery(query);
        Query q = session.createQuery("Select Count(*) From Rate r Where r.recruiter =:recId");
//        Query q = session.createQuery("Select Sum(r.point) From Rate r Where r.recruiter =:recId");
        q.setInteger("recId", recId);
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public double ratePointRecruiter(int recId) {
        Session session = sessionFactory.getObject().getCurrentSession();    
        Query q = session.createQuery("Select Sum(r.point) From Rate r Where r.recruiter =:recId");
        Query q2 = session.createQuery("Select Count(*) From Rate r Where r.recruiter =:recId");
        q.setInteger("recId", recId);
        q2.setInteger("recId", recId);
        if (q.getSingleResult() != null && q2.getSingleResult() != null)
        {
            double point = Double.parseDouble(q.getSingleResult().toString()) / Integer.parseInt(q2.getSingleResult().toString());
            return point;
        }
        
        return 0;
    }

    @Override
    public List<Rate> getRate(int canId, int recId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Rate> query = builder.createQuery(Rate.class);
        Root root = query.from(Rate.class);
        
        Predicate p1 = builder.equal(root.get("candidate").get("id"), canId);
        Predicate p2 = builder.equal(root.get("recruiter").get("id"), recId);
        
        query = query.where(builder.and(p1, p2));
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }
}
