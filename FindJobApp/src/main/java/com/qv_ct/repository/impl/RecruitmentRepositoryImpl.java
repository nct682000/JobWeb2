/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.repository.impl;

import com.qv_ct.pojos.Apply;
import com.qv_ct.pojos.Recruitment;
import com.qv_ct.repository.RecruitmentRepository;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.math.BigDecimal;
import java.util.ArrayList;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.math.BigDecimal;

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
        query = query.where(builder.equal(root.get("active"), true));
        query = query.orderBy(builder.desc(root.get("id")));
        Query q = session.createQuery(query);

        int max = 10;
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

        if (!kw.isBlank()) {
            p1 = builder.like(root.get("title").as(String.class),
                    String.format("%%%s%%", kw));
        }

        if (careerId != 0) {
            p2 = builder.equal(root.get("career"), careerId);
        }

        if (provinceId != 0) {
            p3 = builder.equal(root.get("recruiter").get("location").get("province"), provinceId);
        }

        if (form != -1) {
            p4 = builder.equal(root.get("form"), form);
        }

        if (salary != 0) {
            Predicate p51 = builder.ge(root.get("salaryFrom"), salary);
            Predicate p52 = builder.ge(root.get("salaryTo"), salary);
            p5 = builder.or(p51, p52);
        }

        query = query.where(builder.and(p1, p2, p3, p4, p5));
        query = query.orderBy(builder.desc(root.get("id")));
        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public boolean addOrUpdate(Recruitment r) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            r.setCreatedDate(Date.from(Instant.now()));
            r.setUpdatedDate(Date.from(Instant.now()));
            session.saveOrUpdate(r);

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
        Query q = session.createQuery("Select Count(*) From Recruitment R Where R.active = true");

        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public List<Object[]> getRecruitmentByApply(int num) {
        Session session = sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootR = query.from(Recruitment.class);
        Root rootA = query.from(Apply.class);

        query = query.where(builder.equal(rootA.get("recruitment"), rootR.get("id")));
        query.multiselect(rootR.get("id"), // 0
                rootR.get("title"), // 1
                rootR.get("recruiter").get("companyName"), // 2
                rootR.get("recruiter").get("avatar"), // 3
                builder.count(rootR.get("id")), // 4
                rootR.get("form"), // 5
                rootR.get("salaryFrom"), // 6
                rootR.get("salaryTo"), // 7
                rootR.get("updatedDate"), // 8
                rootR.get("recruiter").get("location").get("province").get("name"), // 9
                rootR.get("recruiter").get("id"));  // 10

        query = query.groupBy(rootR.get("id"));
        query = query.orderBy(builder.desc(builder.count(rootR.get("id"))));

        Query q = session.createQuery(query);
        q.setMaxResults(num);

        return q.getResultList();
    }

    @Override
    public List<Recruitment> getRecruitmentByUserId(int userId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Recruitment> query = builder.createQuery(Recruitment.class);
        Root root = query.from(Recruitment.class);
        query = query.select(root);

        Predicate p = builder.equal(root.get("recruiter"), userId);

        query = query.where(p);
        query = query.orderBy(builder.desc(root.get("id")));
        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public Recruitment switchActiveRecruitment(Recruitment r) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            r.setActive(!r.getActive());
            session.update(r);
            return r;
        } catch (Exception ex) {
            System.err.println("-------------Active Recruitment Error-----------" + ex.getMessage());
            ex.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Object[]> recruitmentStats(int userId, Date from, Date to) {
        Session session = sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootR = query.from(Recruitment.class);
        Root rootA = query.from(Apply.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootR.get("recruiter"), userId));
        predicates.add(builder.equal(rootA.get("recruitment"), rootR.get("id")));
        
        if(from != null)
            predicates.add(builder.greaterThanOrEqualTo(rootA.get("createdDate"), from));
        if(to != null)
            predicates.add(builder.lessThanOrEqualTo(rootA.get("createdDate"), to));
        
        query.multiselect(rootR.get("id"), // 0
                rootR.get("title"), // 1
                builder.count(rootR.get("id")), // 2
                rootR.get("updatedDate")); // 3

        
        query.where(predicates.toArray(new Predicate[] {}));
        
        query = query.groupBy(rootR.get("id"));
        query = query.orderBy(builder.desc(rootR.get("id")));

        Query q = session.createQuery(query);

        return q.getResultList();
    }
    
    

    //    ------------------    admin   --------------------
    int maxList = 6;

//    @Override
//    public List<Recruitment> getRecruitments_Admin(int page, long salaryFrom, long salaryTo, boolean active) {
//        Session s = this.sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = s.getCriteriaBuilder();
//        CriteriaQuery<Recruitment> query = builder.createQuery(Recruitment.class);
//        Root root = query.from(Recruitment.class);
//        query = query.select(root);
//
//        Predicate p1 = builder.greaterThanOrEqualTo(root.get("salaryFrom").as(BigDecimal.class), new BigDecimal(salaryFrom));
//        Predicate p2 = builder.lessThanOrEqualTo(root.get("salaryTo").as(BigDecimal.class), new BigDecimal(salaryTo));
//        Predicate p3 = builder.equal(root.get("active"), active);
//        query.where(builder.and(p1, p2, p3));
//
//        query = query.orderBy(builder.desc(root.get("id")));
//
//        Query q = s.createQuery(query);
//
//        q.setMaxResults(maxList);
//        q.setFirstResult((page - 1) * maxList);
//        return q.getResultList();
//    }
    @Override
    public List<Recruitment> getRecruitments_Admin(int page, long salaryFrom, long salaryTo, boolean active, String title, int caseSearch) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String kw = "'%" + title + "%'";

//        t??m ki???m m???c ?????nh
        if (caseSearch == -1) {
            Query q = session.createQuery("FROM Recruitment r\n"
                    + "WHERE r.active =:active ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);
            q.setMaxResults(maxList);
            q.setFirstResult((page - 1) * maxList);
            return q.getResultList();
        }

//        l????ng th???a thu???n
        if (caseSearch == 4) {
            Query q = session.createQuery("FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "AND r.salaryFrom is null AND r.salaryTo is null\n"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);
            q.setMaxResults(maxList);
            q.setFirstResult((page - 1) * maxList);
            return q.getResultList();
        }

//        b??i vi???t b??? kh??a
        if (caseSearch == 5) {
            Query q = session.createQuery("FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);
            q.setMaxResults(maxList);
            q.setFirstResult((page - 1) * maxList);
            return q.getResultList();
        }

//        l????ng t??? - ?????n
        if (caseSearch == 0) {
            Query q = session.createQuery("FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "AND (r.salaryFrom >=:salaryFrom AND r.salaryTo <=:salaryTo)\n"
                    + "AND (r.salaryFrom IS NOT NULL OR r.salaryTo IS NOT NULL)"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);
            q.setParameter("salaryFrom", new BigDecimal(salaryFrom));
            q.setParameter("salaryTo", new BigDecimal(salaryTo));
            q.setMaxResults(maxList);
            q.setFirstResult((page - 1) * maxList);
            return q.getResultList();
        }

//        l????ng t???
        if (caseSearch == 1) {
            Query q = session.createQuery("FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "AND (r.salaryFrom >=:salaryFrom)\n"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);
            q.setParameter("salaryFrom", new BigDecimal(salaryFrom));
            q.setMaxResults(maxList);
            q.setFirstResult((page - 1) * maxList);
            return q.getResultList();
        }

//        l????ng ?????n
        if (caseSearch == 2) {
            Query q = session.createQuery("FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "AND (r.salaryTo <=:salaryTo)\n"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);
            q.setParameter("salaryTo", new BigDecimal(salaryTo));
            q.setMaxResults(maxList);
            q.setFirstResult((page - 1) * maxList);
            return q.getResultList();
        }

//        kh??ng t??m theo l????ng
        if (caseSearch == 3) {
            Query q = session.createQuery("FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "AND (r.salaryFrom IS NOT NULL OR r.salaryTo IS NOT NULL)"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);
            q.setMaxResults(maxList);
            q.setFirstResult((page - 1) * maxList);
            return q.getResultList();
        }
        return null;
    }

    @Override
    public int countRecruitment_Admin(long salaryFrom, long salaryTo, boolean active, String title, int caseSearch) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String kw = "'%" + title + "%'";

//        t??m ki???m m???c ?????nh
        if (caseSearch == -1) {
            Query q = session.createQuery("SELECT COUNT(*) FROM Recruitment r\n"
                    + "WHERE r.active =:active ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);

            return Integer.parseInt(q.getSingleResult().toString());
        }

//        l????ng th???a thu???n
        if (caseSearch == 4) {
            Query q = session.createQuery("SELECT COUNT(*) FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "AND r.salaryFrom is null AND r.salaryTo is null\n"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);

            return Integer.parseInt(q.getSingleResult().toString());
        }

//        b??i vi???t b??? kh??a
        if (caseSearch == 5) {
            Query q = session.createQuery("SELECT COUNT(*) FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);

            return Integer.parseInt(q.getSingleResult().toString());
        }

//        l????ng t??? - ?????n
        if (caseSearch == 0) {
            Query q = session.createQuery("SELECT COUNT(*) FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "AND (r.salaryFrom >=:salaryFrom AND r.salaryTo <=:salaryTo)\n"
                    + "AND (r.salaryFrom IS NOT NULL OR r.salaryTo IS NOT NULL)"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);
            q.setParameter("salaryFrom", new BigDecimal(salaryFrom));
            q.setParameter("salaryTo", new BigDecimal(salaryTo));

            return Integer.parseInt(q.getSingleResult().toString());
        }

//        l????ng t???
        if (caseSearch == 1) {
            Query q = session.createQuery("SELECT COUNT(*) FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "AND (r.salaryFrom >=:salaryFrom)\n"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);
            q.setParameter("salaryFrom", new BigDecimal(salaryFrom));

            return Integer.parseInt(q.getSingleResult().toString());
        }

//        l????ng ?????n
        if (caseSearch == 2) {
            Query q = session.createQuery("SELECT COUNT(*) FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "AND (r.salaryTo <=:salaryTo)\n"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);
            q.setParameter("salaryTo", new BigDecimal(salaryTo));

            System.out.printf("-------- result -----------:", q.getSingleResult().toString());

            return Integer.parseInt(q.getSingleResult().toString());
        }

//        kh??ng t??m theo l????ng
        if (caseSearch == 3) {
            Query q = session.createQuery("SELECT COUNT(*) FROM Recruitment r\n"
                    + "WHERE r.active =:active "
                    + "AND r.title like " + kw + "\n"
                    + "AND (r.salaryFrom IS NOT NULL OR r.salaryTo IS NOT NULL)"
                    + "ORDER BY r.updatedDate DESC");
            q.setParameter("active", active);

            return Integer.parseInt(q.getSingleResult().toString());
        }
        return 1;
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
