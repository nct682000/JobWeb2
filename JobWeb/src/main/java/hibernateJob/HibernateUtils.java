/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernateJob;

import hibernateJob.pojo.Apply;
import hibernateJob.pojo.Benefit;
import hibernateJob.pojo.Career;
import hibernateJob.pojo.Comment;
import hibernateJob.pojo.Interaction;
import hibernateJob.pojo.Location;
import hibernateJob.pojo.Province;
import hibernateJob.pojo.Rate;
import hibernateJob.pojo.Recruitment;
import hibernateJob.pojo.Tag;
import hibernateJob.pojo.User;
import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;



/**
 *
 * @author nct68
 */
public class HibernateUtils {
    private static final SessionFactory FACTORY;
    
    static{
        Configuration conf = new Configuration();
        
        conf.configure("hibernate.cfg.xml");
        
        //JAVA CODE CONFIG
//        Properties props = new Properties();
//        props.put(Environment.DIALECT, "org.hibernate.dialect.MySQLDialect");
//        props.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
//        props.put(Environment.URL, "jdbc:mysql://localhost/jobdb2");
//        props.put(Environment.USER, "root");
//        props.put(Environment.PASS, "123456");
//        props.put(Environment.SHOW_SQL, "true");
//        
//        conf.setProperties(props);
        conf.addAnnotatedClass(Career.class);
        conf.addAnnotatedClass(Province.class);
        conf.addAnnotatedClass(User.class);
        conf.addAnnotatedClass(Location.class);
        conf.addAnnotatedClass(Recruitment.class);
        conf.addAnnotatedClass(Apply.class);
        conf.addAnnotatedClass(Tag.class);
        conf.addAnnotatedClass(Benefit.class);
        conf.addAnnotatedClass(Rate.class);
        conf.addAnnotatedClass(Comment.class);
        conf.addAnnotatedClass(Interaction.class);
        
        ServiceRegistry registry = new StandardServiceRegistryBuilder()
                .applySettings(conf.getProperties()).build();
        
        FACTORY = conf.buildSessionFactory(registry);
    }

    /**
     * @return the FACTORY
     */
    public static SessionFactory getFACTORY() {
        return FACTORY;
    }
}
