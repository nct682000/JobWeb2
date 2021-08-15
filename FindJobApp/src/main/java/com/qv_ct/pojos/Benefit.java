/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.pojos;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 *
 * @author nct68
 */
@Entity
@Table(name = "benefit")
public class Benefit implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    
    @ManyToMany(mappedBy = "benefits")
    private Set<Recruitment> recruitments;

    public Benefit() {
    }

    public Benefit(String name) {
        this.name = name;
    }
    
    

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the recruitments
     */
    public Set<Recruitment> getRecruitments() {
        return recruitments;
    }

    /**
     * @param recruitments the recruitments to set
     */
    public void setRecruitments(Set<Recruitment> recruitments) {
        this.recruitments = recruitments;
    }
}
