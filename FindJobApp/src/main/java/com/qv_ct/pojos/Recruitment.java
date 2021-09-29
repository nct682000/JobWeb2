/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.pojos;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import net.bytebuddy.agent.builder.AgentBuilder;
import org.hibernate.engine.spi.IdentifierValue;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author nct68
 */
@Entity
@Table(name = "recruitment")
public class Recruitment implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Size(min = 5, max = 50, message = "{recruitment.title.sizeError}")
    private String title;
    @Column(name = "salary_from")
    @Min(value = 1000000, message = "{recruitment.salary.minError}")
    private BigDecimal salaryFrom;
    @Column(name = "salary_to")
    @Min(value = 1000000, message = "{recruitment.salary.minError}")
    private BigDecimal salaryTo;
    @NotNull(message = "{recruitment.form.nullError}")
    private Form form;
    private String description;
    @Column(name = "created_date")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date createdDate;
    @Column(name = "updated_date")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date updatedDate;
    private Boolean active = true;
    
    @ManyToOne
    @JoinColumn(name = "career_id")
    @NotNull(message = "{recruitment.career.nullError}")
    private Career career;
    
    @ManyToOne
    @JoinColumn(name = "recruiter_id")
    private User recruiter;
    
    @OneToMany(mappedBy = "recruitment")
    private Set<Apply> applies;
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "recruitment_tag",
            joinColumns = {
                @JoinColumn(name = "recruitment_id")
            },
            inverseJoinColumns = {
                @JoinColumn(name = "tag_id")
            }
    )
    private Set<Tag> tags;
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "recruitment_benefit",
            joinColumns = {
                @JoinColumn(name = "recruitment_id")
            },
            inverseJoinColumns = {
                @JoinColumn(name = "benefit_id")
            }
    )
    private Set<Benefit> benefits;
    
//    @Transient
//    private MultipartFile file;

    public Recruitment(String title, Form form, Career career, User recruiter) {
        this.title = title;
        this.form = form;
        this.career = career;
        this.recruiter = recruiter;
    }

    public Recruitment() {
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
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the salaryFrom
     */
    public BigDecimal getSalaryFrom() {
        return salaryFrom;
    }

    /**
     * @param salaryFrom the salaryFrom to set
     */
    public void setSalaryFrom(BigDecimal salaryFrom) {
        this.salaryFrom = salaryFrom;
    }

    /**
     * @return the salaryTo
     */
    public BigDecimal getSalaryTo() {
        return salaryTo;
    }

    /**
     * @param salaryTo the salaryTo to set
     */
    public void setSalaryTo(BigDecimal salaryTo) {
        this.salaryTo = salaryTo;
    }

    /**
     * @return the form
     */
    public Form getForm() {
        return form;
    }

    /**
     * @param form the form to set
     */
    public void setForm(Form form) {
        this.form = form;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
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
     * @return the updatedDate
     */
    public Date getUpdatedDate() {
        return updatedDate;
    }

    /**
     * @param updatedDate the updatedDate to set
     */
    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    /**
     * @return the active
     */
    public Boolean getActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(Boolean active) {
        this.active = active;
    }

    /**
     * @return the career
     */
    public Career getCareer() {
        return career;
    }

    /**
     * @param career the career to set
     */
    public void setCareer(Career career) {
        this.career = career;
    }

    /**
     * @return the recruiter
     */
    public User getRecruiter() {
        return recruiter;
    }

    /**
     * @param recruiter the recruiter to set
     */
    public void setRecruiter(User recruiter) {
        this.recruiter = recruiter;
    }

    /**
     * @return the applies
     */
    public Set<Apply> getApplies() {
        return applies;
    }

    /**
     * @param applies the applies to set
     */
    public void setApplies(Set<Apply> applies) {
        this.applies = applies;
    }

    /**
     * @return the tags
     */
    public Set<Tag> getTags() {
        return tags;
    }

    /**
     * @param tags the tags to set
     */
    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }

    /**
     * @return the benefits
     */
    public Set<Benefit> getBenefits() {
        return benefits;
    }

    /**
     * @param benefits the benefits to set
     */
    public void setBenefits(Set<Benefit> benefits) {
        this.benefits = benefits;
    }
    
}
