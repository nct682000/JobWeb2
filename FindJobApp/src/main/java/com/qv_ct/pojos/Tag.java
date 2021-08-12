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
@Table(name = "tag")
public class Tag implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String content;
    
    @ManyToMany(mappedBy = "tags")
    private Set<Recruitment> recruitments;

    public Tag() {
    }

    public Tag(String content) {
        this.content = content;
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
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
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
