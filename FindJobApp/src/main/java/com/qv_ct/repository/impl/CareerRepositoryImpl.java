/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Career;
import com.qv_ct.repository.CareerRepository;
import java.util.List;
import javax.persistence.Query;
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
public class CareerRepositoryImpl implements CareerRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Career> getCareers() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Career");

        return q.getResultList();
    }

    @Override
    public boolean deleteCareer(int id) {
        try {
            Session s = sessionFactory.getObject().getCurrentSession();
            Career a = s.get(Career.class, id);
//            s.getTransaction().begin();
            s.delete(a);
//            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

}
