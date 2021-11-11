/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Benefit;
import com.qv_ct.repository.BenefitRepository;
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
public class BenefitRepositoryImpl implements BenefitRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Benefit> getBenefits() {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Benefit");
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdate(Benefit b) {
        Session session = sessionFactory.getObject().getCurrentSession();

        try {
            session.save(b);

            return true;
        } catch (Exception ex) {
            System.err.println("-- Add Tag Error --" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteBenefit(int id) {
        try {
            Session s = sessionFactory.getObject().getCurrentSession();
            Benefit a = s.get(Benefit.class, id);
//            s.getTransaction().begin();
            s.delete(a);
//            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

}
