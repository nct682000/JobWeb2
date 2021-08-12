/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernateJob.pojo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

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
    public User getCandidateId() {
        return candidate;
    }

    /**
     * @param candidateId the candidateId to set
     */
    public void setCandidateId(User candidateId) {
        this.candidate = candidateId;
    }

    /**
     * @return the recruiterId
     */
    public User getRecruiterId() {
        return recruiter;
    }

    /**
     * @param recruiterId the recruiterId to set
     */
    public void setRecruiterId(User recruiterId) {
        this.recruiter = recruiterId;
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
}
