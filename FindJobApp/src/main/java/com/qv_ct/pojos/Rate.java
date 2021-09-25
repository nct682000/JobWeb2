/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.pojos;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author nct68
 */
@Entity
@Table(name = "rate")
public class Rate implements Serializable{
    @Id
    @ManyToOne
    @JoinColumn(name = "candidate_id")
    private User candidate;
    
    @Id
    @ManyToOne
    @JoinColumn(name = "recruiter_id")
    private User recruiter;
    
    private int point;
    @Column(name = "created_date")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date createdDate;

    public Rate() {
    }

    public Rate(User candidate, User recruiter, int point) {
        this.candidate = candidate;
        this.recruiter = recruiter;
        this.point = point;
    }

    
    
    /**
     * @return the candidateId
     */
    public User getCandidate() {
        return candidate;
    }

    /**
     * @param candidateId the candidateId to set
     */
    public void setCandidate(User candidate) {
        this.candidate = candidate;
    }

    /**
     * @return the recruiterId
     */
    public User getRecruiter() {
        return recruiter;
    }

    /**
     * @param recruiter the recruiterId to set
     */
    public void setRecruiter(User recruiter) {
        this.recruiter = recruiter;
    }

    /**
     * @return the point
     */
    public int getPoint() {
        return point;
    }

    /**
     * @param point the point to set
     */
    public void setPoint(int point) {
        this.point = point;
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
}
