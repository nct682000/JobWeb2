/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Province;
import com.qv_ct.repository.ProvinceRepository;
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
public class ProvinceRepositoryImpl implements ProvinceRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Province> getProvinces() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Province");
        
        return q.getResultList();
    
    }
}
