/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Location;
import com.qv_ct.pojos.Province;
import com.qv_ct.pojos.Recruitment;
import com.qv_ct.repository.RecruitmentRepository;
import java.math.BigDecimal;
import java.util.ArrayList;
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
public class RecruitmentRepositoryImpl implements RecruitmentRepository {

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
    public List<Recruitment> searchRecruitment(String kw, int careerId, int provinceId,
                                        int form, int salary) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Recruitment> query = builder.createQuery(Recruitment.class);
        Root root = query.from(Recruitment.class);
        query = query.select(root);
        
        Predicate p1 = builder.equal(root, root);
        Predicate p2 = builder.equal(root, root);
        Predicate p3 = builder.equal(root, root);
        Predicate p4 = builder.equal(root, root);
        Predicate p5 = builder.equal(root, root);
        
        if (!kw.isBlank()){
            p1 = builder.like(root.get("title").as(String.class),
                    String.format("%%%s%%", kw));
        }
        
        if (careerId != 0)
            p2 = builder.equal(root.get("career"), careerId);
        
        if (provinceId != 0)
            p3 = builder.equal(root.get("recruiter").get("location").get("province"), provinceId);
        
        if (form != -1)
            p4 = builder.equal(root.get("form"), form);
        
        if (salary != 0){
            Predicate p51 = builder.ge(root.get("salaryFrom"), salary);
            Predicate p52 = builder.ge(root.get("salaryTo"), salary);
            p5 = builder.or(p51, p52);
        }
        
        query = query.where(builder.and(p1, p2, p3, p4, p5));
        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public boolean addOrUpdate(Recruitment r) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(r);

            return true;
        } catch (Exception ex) {
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

    //    ------------------    admin   --------------------
    @Override
    public List<Recruitment> getRecruitmentsAll() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Recruitment");
        return q.getResultList();
    }
}
