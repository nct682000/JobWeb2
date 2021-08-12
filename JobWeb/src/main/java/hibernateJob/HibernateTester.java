/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernateJob;

import com.sun.xml.bind.v2.model.annotation.LocatableAnnotation;
import hibernateJob.pojo.Apply;
import hibernateJob.pojo.Benefit;
import hibernateJob.pojo.Career;
import hibernateJob.pojo.Comment;
import hibernateJob.pojo.Form;
import hibernateJob.pojo.Interaction;
import hibernateJob.pojo.Location;
import hibernateJob.pojo.Province;
import hibernateJob.pojo.Rate;
import hibernateJob.pojo.Recruitment;
import hibernateJob.pojo.Role;
import hibernateJob.pojo.Sex;
import hibernateJob.pojo.Tag;
import hibernateJob.pojo.Type;
import hibernateJob.pojo.User;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author nct68
 */
public class HibernateTester {
    public static void main(String[] args) {
        Session session = HibernateUtils.getFACTORY().openSession();
        
        //Create Career
//        Career c = new Career();
//        c.setName("CNTT - Phần cứng");
//        session.save(c);

        //Get List Career
//        Query q = session.createQuery("FROM Career"); //HQL
//        List<Career> career = q.getResultList();       
//        career.forEach(c -> System.out.printf("%d - %s\n", c.getId(), c.getName()));

        //Create Province
//        Province p = new Province();
//        p.setName("Hồ Chí Minh");
//        session.save(p);

        //Create Location
//        Province p =session.get(Province.class, 1);
//        Location l = new Location();
//        l.setAddress("Quận 1");
//        l.setProvince(p);
//        session.save(l);

        //Create Recruitment
//        Location l = session.get(Location.class, 1);
//        User u = new User();
//        u.setUsername("tuong0");
//        u.setPassword("123456");
//        u.setRole(Role.RECRUITER);
//        u.setSex(Sex.MALE);
//        u.setLocation(l);
//        session.save(u);

        //Create Candidate
//        User u = new User("tuong1", "123456", Role.CANDIDATE);
//        session.save(u);

        //Get Location
//        Location l = session.get(Location.class, 1);
//        System.out.printf("%d - %s - %s", l.getId(), l.getAddress(), l.getProvince().getName());

        //Create Apply
//        User u = session.get(User.class, 1);
//        Career c = session.get(Career.class, 1);
//        Recruitment r = new Recruitment("Mobile Developer", Form.INTERN, c, u);
//        session.save(r);
//        User c = session.get(User.class, 2);
//        Recruitment r = session.get(Recruitment.class, 1);
//        Apply a = new Apply("Apply for Mobile Developer", "I want to apply", c, r);
//        session.save(a);

        //Get Apply
//        Apply a = session.get(Apply.class, 1);
//        System.out.printf("%d - %s - %s - %s",
//                a. getId(),
//                a.getTitle(), 
//                a.getCandidate().getUsername(), 
//                a.getRecruitment().getTitle());
        
        //Create tag & benefit
//        Tag t1 = new Tag("Mobile");
//        Tag t2 = new Tag("Thực tập");
//        Benefit b1 = new Benefit("Laptop");
//        Benefit b2 = new Benefit("Đồng phục");
//        session.save(t1);
//        session.save(t2);
//        session.save(b1);
//        session.save(b2);
        
        //add tag & benefit
//        Recruitment r = session.get(Recruitment.class, 1);
//        Set<Tag> tags = new HashSet<>();
//        tags.add(session.get(Tag.class, 1));
//        tags.add(session.get(Tag.class, 2));
//        Set<Benefit> be = new HashSet<>();
//        be.add(session.get(Benefit.class, 1));
//        be.add(session.get(Benefit.class, 2));
//        r.setTags(tags);
//        r.setBenefits(be);
//        session.getTransaction().begin();
//        session.save(r);
//        session.getTransaction().commit();

        //Add rate
//        User c = session.get(User.class, 2);
//        User r = session.get(User.class, 1);
//        Rate rate = new Rate(c, r, 5);
//        session.getTransaction().begin();
//        session.save(rate);
//        session.getTransaction().commit();

        //Test Comment
//        User c = session.get(User.class, 2);
//        User r = session.get(User.class, 1);
//        Comment cmt1 = new Comment("test comment", c, r);
//        Comment cmt2 = new Comment("feedback comment 1", c, r);
//        Comment cmt1 = session.get(Comment.class, 1);
//        Comment cmt2 = session.get(Comment.class, 2);
//        cmt2.setComment(cmt1);
//        session.getTransaction().begin();
//        session.save(cmt2);
//        session.getTransaction().commit();

        //Create Interaction
//        User c = session.get(User.class, 1);
//        Comment cmt = session.get(Comment.class, 1);
//        Interaction i = new Interaction(c, cmt, Type.LIKE);
//        session.getTransaction().begin();
//        session.save(i);
//        session.getTransaction().commit();

        session.close();
    }
}
