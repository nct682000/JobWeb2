/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Apply;
import com.qv_ct.repository.ApplyRepository;
import java.sql.Time;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
public class ApplyRepositoryImpl implements ApplyRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Apply> getApplies() {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Apply");

        return q.getResultList();
    }

    @Override
    public Apply getApplyByApplyId(int id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Apply> query = builder.createQuery(Apply.class);
        Root root = query.from(Apply.class);
        query = query.select(root);

        Predicate p = builder.equal(root.get("id"), id);
        query = query.where(p);
        Query q = session.createQuery(query);
        return (Apply) q.getSingleResult();
    }
    
    @Override
    public Apply hiddenApply(Apply a) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            a.setActive(false);
            System.out.println("---------------------Repository--------------------");
            System.out.println(a.getActive());
            session.update(a);
            return a;
        } catch (Exception ex) {
            System.err.println("-------------Hidden Apply Error-----------" + ex.getMessage());
            ex.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean addOrUpdate(Apply a) {
        Session session = sessionFactory.getObject().getCurrentSession();

        try {
            a.setCreatedDate(Time.from(Instant.now()));
            session.save(a);
            return true;
        } catch (Exception ex) {
            System.err.println("-------Add Apply Error-------" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Apply> getAppliesByUserId(int id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Apply> query = builder.createQuery(Apply.class);
        Root root = query.from(Apply.class);
        query = query.select(root);
        
        Predicate p1 = builder.equal(root.get("active"), true);
        Predicate p2 = builder.equal(root.get("candidate"), id);
        Predicate p = builder.and(p1, p2);
        query = query.where(p);
        query = query.orderBy(builder.desc(root.get("id")));
        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public List<Apply> getAppliesByRecruiter(int recId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Apply> query = builder.createQuery(Apply.class);
        Root root = query.from(Apply.class);
        query = query.select(root);

        Predicate p = builder.equal(root.get("recruitment").get("recruiter"), recId);

        query = query.where(p);
        query = query.orderBy(builder.desc(root.get("id")));
        Query q = session.createQuery(query);
        q.setMaxResults(10);

        return q.getResultList();
    }

    //    -------------     admin       --------------
    int maxList = 6;

    @Override
    public List<Apply> getApply_Admin(int page, boolean active, String title, String dateFilter) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Apply> query = builder.createQuery(Apply.class);
        Root root = query.from(Apply.class);
        query = query.select(root);

        Predicate p2 = builder.equal(root.get("active"), active);
        String kw = "%" + title + "%";
        Predicate p1 = builder.like(root.get("title").as(String.class), kw);
        String kw2 = "%" + dateFilter + "%";
        Predicate p3 = builder.like(root.get("createdDate").as(String.class), kw2);

        query.where(builder.and(p1, p2, p3));

        query = query.orderBy(builder.desc(root.get("id")));

        Query q = s.createQuery(query);

        q.setMaxResults(maxList);
        q.setFirstResult((page - 1) * maxList);
        return q.getResultList();
    }

    @Override
    public int countApply_Admin(boolean active, String title, String dateFilter) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Apply> query = builder.createQuery(Apply.class);
        Root root = query.from(Apply.class);
        query = query.select(root);

        Predicate p2 = builder.equal(root.get("active"), active);
        String kw = "%" + title + "%";
        Predicate p1 = builder.like(root.get("title").as(String.class), kw);
        String kw2 = "%" + dateFilter + "%";
        Predicate p3 = builder.like(root.get("createdDate").as(String.class), kw2);

        query.where(builder.and(p1, p2, p3));

        query = query.orderBy(builder.desc(root.get("id")));

        Query q = s.createQuery(query);

        return q.getResultList().size();
    }

//    @Override
//    public long countApply_Admin(boolean active) {
//        Session s = sessionFactory.getObject().getCurrentSession();
//        Query q = s.createQuery("SELECT Count(*) FROM Apply a WHERE a.active =:active");
//        q.setParameter("active", active);
//
//        return Long.parseLong(q.getSingleResult().toString());
//    }
    @Override
    public boolean enableApply(int applyId, boolean active) {
        try {
            Session s = sessionFactory.getObject().getCurrentSession();
            Apply a = s.get(Apply.class, applyId);
            a.setActive(active);
            s.getTransaction().begin();
            s.save(a);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean deleteApply(int applyId) {
        try {
            Session s = sessionFactory.getObject().getCurrentSession();
            Apply a = s.get(Apply.class, applyId);
//            s.getTransaction().begin();
            s.delete(a);
//            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

//  thống kê hoạt động ứng tuyển trong năm
    @Override
    public long countApply_Admin_For_Chart(boolean active, int month, int year) {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Apply a WHERE month(a.createdDate) =:month AND year(a.createdDate) =:year AND a.active=:active");
        q.setParameter("month", month);
        q.setParameter("year", year);
        q.setParameter("active", active);

        return Long.parseLong(q.getSingleResult().toString());
    }

//  thống kê top nhà tuyển dụng được ứng tuyển nhiều trong năm
    int maxTop = 5;

    @Override
    public List<Object[]> countApply_ByCompany_ForChart(int year) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(a.id) AS sl, u.companyName\n"
                + "FROM Apply a\n"
                + "INNER JOIN Recruitment r ON r.id = a.recruitment\n"
                + "INNER JOIN User u ON u.id = r.recruiter\n"
                + "WHERE YEAR(a.createdDate) =:year\n"
                + "GROUP BY a.recruitment ORDER BY sl DESC");
        q.setParameter("year", year);
        q.setMaxResults(maxTop);
        List<Object[]> results = q.getResultList();
//        results.forEach(obj -> System.out.printf("sl: %d; companyName: %s\n", obj[0], obj[1]));

        return results;
    }

    @Override
    public List<Object[]> countApply_ByCompany2_ForChart(int year, int month) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(a.id) AS sl, u.companyName\n"
                + "FROM Apply a\n"
                + "INNER JOIN Recruitment r ON r.id = a.recruitment\n"
                + "INNER JOIN User u ON u.id = r.recruiter\n"
                + "WHERE YEAR(a.createdDate) =:year AND MONTH(a.createdDate) =:month\n"
                + "GROUP BY a.recruitment ORDER BY sl DESC");
        q.setParameter("year", year);
        q.setParameter("month", month);
        q.setMaxResults(maxTop);
        List<Object[]> results = q.getResultList();
//        results.forEach(obj -> System.out.printf("sl: %d; companyName: %s\n", obj[0], obj[1]));

        return results;
    }

    //  thống kê top việc làm được ứng tuyển nhiều trong năm
    @Override
    public List<Object[]> countApply_ByJob_ForChart(int year) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(a.id) AS sl, r.title\n"
                + "FROM Apply a\n"
                + "INNER JOIN Recruitment r ON r.id = a.recruitment\n"
                + "WHERE YEAR(a.createdDate) =:year\n"
                + "GROUP BY a.recruitment ORDER BY sl DESC");
        q.setParameter("year", year);
        q.setMaxResults(maxTop);
        List<Object[]> results = q.getResultList();
//        results.forEach(obj -> System.out.printf("sl: %d; title: %s\n", obj[0], obj[1]));

        return results;
    }

    @Override
    public List<Object[]> countApply_ByJob2_ForChart(int year, int month) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(a.id) AS sl, r.title\n"
                + "FROM Apply a\n"
                + "INNER JOIN Recruitment r ON r.id = a.recruitment\n"
                + "WHERE YEAR(a.createdDate) =:year AND MONTH(a.createdDate) =:month\n"
                + "GROUP BY a.recruitment ORDER BY sl DESC");
        q.setParameter("year", year);
        q.setParameter("month", month);
        q.setMaxResults(maxTop);
        List<Object[]> results = q.getResultList();
//        results.forEach(obj -> System.out.printf("sl: %d; title: %s\n", obj[0], obj[1]));

        return results;
    }

    //  thống kê top thành phố có lượng ứng tuyển nhiều trong năm
    @Override
    public List<Object[]> countApply_ByCity_ForChart(int year) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(a.id) AS sl, p.name\n"
                + "FROM Apply a\n"
                + "INNER JOIN Recruitment r ON r.id = a.recruitment\n"
                + "INNER JOIN User u ON u.id = r.recruiter\n"
                + "INNER JOIN Location l ON l.id = u.location\n"
                + "INNER JOIN Province p ON p.id = l.province\n"
                + "WHERE YEAR(a.createdDate) =:year\n"
                + "GROUP BY p.name ORDER BY sl DESC");
        q.setParameter("year", year);
        q.setMaxResults(maxTop);
        List<Object[]> results = q.getResultList();
//        results.forEach(obj -> System.out.printf("sl: %d; city: %s\n", obj[0], obj[1]));

        return results;
    }

    @Override
    public List<Object[]> countApply_ByCity2_ForChart(int year, int month) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(a.id) AS sl, p.name\n"
                + "FROM Apply a\n"
                + "INNER JOIN User u ON u.id = a.recruitment\n"
                + "INNER JOIN Location l ON l.id = u.location\n"
                + "INNER JOIN Province p ON p.id = l.province\n"
                + "WHERE YEAR(a.createdDate) =:year AND MONTH(a.createdDate) =:month\n"
                + "GROUP BY p.name ORDER BY sl DESC");
        q.setParameter("year", year);
        q.setParameter("month", month);
        q.setMaxResults(maxTop);
        List<Object[]> results = q.getResultList();
//        results.forEach(obj -> System.out.printf("sl: %d; city: %s\n", obj[0], obj[1]));

        return results;
    }

    @Override
    public List<Object[]> getApplyById(int applyId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT a.title, a.content, a.cv, a.createdDate, a.active, r.title AS congviec, u.username, u.id AS userId, r.id AS congviecId\n"
                + "FROM Apply a\n"
                + "INNER JOIN Recruitment r ON r.id = a.recruitment\n"
                + "INNER JOIN User u ON u.id = a.candidate\n"
                + "WHERE a.id =:applyId");
        q.setParameter("applyId", applyId);
        List<Object[]> results = q.getResultList();
        return results;
    }

}
