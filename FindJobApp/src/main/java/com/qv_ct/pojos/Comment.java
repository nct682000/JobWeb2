/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author nct68
 */
@Entity
@Table(name = "comment")
public class Comment implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String content;
    private String file;
    @Column(name = "created_date")
    private Date createdDate;
    
    @ManyToOne
    @JoinColumn(name = "commenter_id")
    private User commenter;
    
    @ManyToOne
    @JoinColumn(name = "commented_id")
    private User commented;
    
    @OneToMany(mappedBy = "comment")
    private Set<Reply> replys;
    
    @OneToMany(mappedBy = "comment")
    private Set<Interaction> interactions;

    public Comment() {
    }

    public Comment(String content, User commenter, User commented) {
        this.content = content;
        this.commenter = commenter;
        this.commented = commented;
    }

    public Set<Reply> getReplys() {
        return replys;
    }

    public void setReplys(Set<Reply> replys) {
        this.replys = replys;
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
     * @return the file
     */
    public String getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(String file) {
        this.file = file;
    }

    /**
     * @return the createdDate
     */
    public Date getCreatedDate() {
        return createdDate;
    }

    /**
     * @param createdDate the createdDate to set
     */
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    /**
     * @return the commenter
     */
    public User getCommenter() {
        return commenter;
    }

    /**
     * @param commenter the commenter to set
     */
    public void setCommenter(User commenter) {
        this.commenter = commenter;
    }

    /**
     * @return the commented
     */
    public User getCommented() {
        return commented;
    }

    /**
     * @param commented the commented to set
     */
    public void setCommented(User commented) {
        this.commented = commented;
    }

    /**
     * @return the interactions
     */
    public Set<Interaction> getInteractions() {
        return interactions;
    }

    /**
     * @param interactions the interactions to set
     */
    public void setInteractions(Set<Interaction> interactions) {
        this.interactions = interactions;
    }
    
}
