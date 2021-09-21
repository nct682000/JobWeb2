/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Recruitment;
import com.qv_ct.repository.RecruitmentRepository;
import java.util.List;
import java.math.BigDecimal;
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
    public List<Recruitment> searchRecruitment(String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Recruitment> query = builder.createQuery(Recruitment.class);
        Root root = query.from(Recruitment.class);
        query = query.select(root);

        Predicate p = builder.like(root.get("title").as(String.class),
                String.format("%%%s%%", kw));

        query = query.where(p);
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
    int maxList = 6;

    @Override
    public List<Recruitment> getRecruitments_Admin(int page, long salaryFrom, long salaryTo, boolean active) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Recruitment> query = builder.createQuery(Recruitment.class);
        Root root = query.from(Recruitment.class);
        query = query.select(root);

        Predicate p1 = builder.greaterThanOrEqualTo(root.get("salaryFrom").as(BigDecimal.class), new BigDecimal(salaryFrom));
        Predicate p2 = builder.lessThanOrEqualTo(root.get("salaryTo").as(BigDecimal.class), new BigDecimal(salaryTo));
        Predicate p3 = builder.equal(root.get("active"), active);
        query.where(builder.and(p1, p2, p3));

        query = query.orderBy(builder.desc(root.get("id")));

        Query q = s.createQuery(query);

        q.setMaxResults(maxList);
        q.setFirstResult((page - 1) * maxList);
        return q.getResultList();
    }

    @Override
    public long countRecruitment_Admin(boolean active) {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Recruitment r WHERE r.active =:active");
        q.setParameter("active", active);

        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public boolean enableRecruitment(int recId, boolean active) {
        try {
            Session s = sessionFactory.getObject().getCurrentSession();
            Recruitment r = s.get(Recruitment.class, recId);
            r.setActive(active);
            s.getTransaction().begin();
            s.save(r);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean deleteRecruitment(int recId) {
        try {
            Session s = sessionFactory.getObject().getCurrentSession();
            Recruitment r = s.get(Recruitment.class, recId);
//            s.getTransaction().begin();
            s.delete(r);
//            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

}
