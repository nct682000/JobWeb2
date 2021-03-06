/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.pojos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;

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
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date createdDate;
    
    @ManyToOne
    @JsonIgnore
    @JoinColumn(name = "commenter_id")
    private User commenter;
    
    @ManyToOne
    @JoinColumn(name = "commented_id")
    @JsonIgnore
    private User commented;
    
    @OneToMany(mappedBy = "comment", fetch = FetchType.EAGER)
    private Set<Reply> replies;
    
    @OneToMany(mappedBy = "comment", fetch = FetchType.EAGER)
    private Set<Interaction> interactions;

    public Comment() {
    }

    public Comment(String content, User commenter, User commented) {
        this.content = content;
        this.commenter = commenter;
        this.commented = commented;
    }
    
    public int countInteractions(int type){
        Type t = Type.getType(type);
        Set<Interaction> interactions = this.getInteractions();
        Set<Interaction> in = new HashSet<>();
        
        interactions.forEach(i ->{
            if(i.getType() == t)
                in.add(i);
        });
        
        return in.size();
    }

    public Set<Reply> getReplies() {
        return replies;
    }

    public void setReplies(Set<Reply> replies) {
        this.replies = replies;
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
