/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qv_ct.pojos.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import com.qv_ct.pojos.Role;

/**
 *
 * @author nct68
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.qv_ct"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Bean
    public Cloudinary cloudinary() {
        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "nct682000",
                "api_key", "163411336543774",
                "api_secret", "-Ph9MO7WY4PIQeqf01Yj5xUAyTY",
                "secure", true
        ));
        return c;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password");

        http.formLogin().defaultSuccessUrl("/").failureUrl("/login/?error");

        http.logout().logoutSuccessUrl("/login");

        http.exceptionHandling().accessDeniedPage("/login?accessDenied");

        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/admin").access("hasRole('" + Role.ROLE_ADMIN.name() + "')")
                .antMatchers("/admin/employees/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "')")
                .antMatchers("/admin/customers/cadidates/inactive/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "')")
                .antMatchers("/admin/customers/recruiters/inactive/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "')")
                .antMatchers("/admin/customers/cadidates/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_EMPLOYEE.name() + "')")
                .antMatchers("/admin/customers/recruiters/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_EMPLOYEE.name() + "')")
                .antMatchers("/admin/recruitment/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_EMPLOYEE.name() + "')")
                .antMatchers("/admin/applies/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_EMPLOYEE.name() + "')")
                .antMatchers("/admin/others/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_EMPLOYEE.name() + "')");
//                .antMatchers("/recruitment/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "', '" + Role.ROLE_RECRUITER.name() + "')")
//                .antMatchers("/candidate/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "', '" + Role.ROLE_CANDIDATE.name() + "')");

        http.csrf().disable();

    }

}
