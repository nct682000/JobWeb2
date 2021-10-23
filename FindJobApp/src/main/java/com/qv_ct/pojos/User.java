/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.pojos;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author nct68
 */
@Entity
@Table(name = "user")
public class User implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Size(max = 32, min = 8, message = "{user.username.sizeError}")
    private String username;
//    @Size(max = 32, min = 8, message = "{user.password.sizeError}")
    private String password;
    @Transient
    private String confirmPassword;
    @Column(name = "first_name", nullable = true)
//    @NotEmpty(message = "{user.name.emptyError}")
    private String firstName;
    @Column(name = "last_name", nullable = true)
//    @NotEmpty(message = "{user.name.emptyError}")
    private String lastName;
    @Column(name = "company_name", nullable = true)
    private String companyName;
    @Column(nullable = true)
    private Sex sex;
    @NotEmpty(message = "{user.name.emptyError}")
    private String mail;
    @NotEmpty(message = "{user.name.emptyError}")
    private String phone;
    private String avatar;
    @Column(nullable = true)
    private String introduce;
    private Role role;
    private boolean active = true;
    
    @OneToOne
    @JoinColumn(name = "location_id", nullable = true)
    private Location location;
    
    @OneToMany(mappedBy = "recruiter")
    private Set<Recruitment> recruitments;
    
    @OneToMany(mappedBy = "candidate")
    private Set<Apply> applys;
    
    @OneToMany(mappedBy = "candidate")
    private Set<Rate> candidateRates;
    
    @OneToMany(mappedBy = "recruiter")
    private Set<Rate> recruiterRates;
    
    @OneToMany(mappedBy = "commenter")
    private Set<Comment> commenterComments;
    
    @OneToMany(mappedBy = "commented")
    private Set<Comment> commentedComments;
    
    @OneToMany(mappedBy = "user")
    private Set<Interaction> interactions;
    
    @Transient
    private MultipartFile file;
    
    @Transient
    @NotEmpty(message = "{user.name.emptyError}")
    private String address;
    @Transient
    @NotNull(message = "{user.name.emptyError}")
    private Province province;

    public User() {
    }

    public User(String username, String password, Role role) {
        this.username = username;
        this.password = password;
        this.role = role;
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
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the confirmPassword
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * @param confirmPassword the confirmPassword to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the companyName
     */
    public String getCompanyName() {
        return companyName;
    }

    /**
     * @param companyName the companyName to set
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /**
     * @return the sex
     */
    public Sex getSex() {
        return sex;
    }

    /**
     * @param sex the sex to set
     */
    public void setSex(Sex sex) {
        this.sex = sex;
    }

    /**
     * @return the mail
     */
    public String getMail() {
        return mail;
    }

    /**
     * @param mail the mail to set
     */
    public void setMail(String mail) {
        this.mail = mail;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the avatar
     */
    public String getAvatar() {
        return avatar;
    }

    /**
     * @param avatar the avatar to set
     */
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    /**
     * @return the introduce
     */
    public String getIntroduce() {
        return introduce;
    }

    /**
     * @param introduce the introduce to set
     */
    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    /**
     * @return the role
     */
    public Role getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(Role role) {
        this.role = role;
    }

    /**
     * @return the active
     */
    public boolean isActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(boolean active) {
        this.active = active;
    }

    /**
     * @return the location
     */
    public Location getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(Location location) {
        this.location = location;
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

    /**
     * @return the applys
     */
    public Set<Apply> getApplys() {
        return applys;
    }

    /**
     * @param applys the applys to set
     */
    public void setApplys(Set<Apply> applys) {
        this.applys = applys;
    }

    /**
     * @return the candidateRates
     */
    public Set<Rate> getCandidateRates() {
        return candidateRates;
    }

    /**
     * @param candidateRates the candidateRates to set
     */
    public void setCandidateRates(Set<Rate> candidateRates) {
        this.candidateRates = candidateRates;
    }

    /**
     * @return the recruiterRates
     */
    public Set<Rate> getRecruiterRates() {
        return recruiterRates;
    }

    /**
     * @param recruiterRates the recruiterRates to set
     */
    public void setRecruiterRates(Set<Rate> recruiterRates) {
        this.recruiterRates = recruiterRates;
    }

    /**
     * @return the commenterComments
     */
    public Set<Comment> getCommenterComments() {
        return commenterComments;
    }

    /**
     * @param commenterComments the commenterComments to set
     */
    public void setCommenterComments(Set<Comment> commenterComments) {
        this.commenterComments = commenterComments;
    }

    /**
     * @return the commentedComments
     */
    public Set<Comment> getCommentedComments() {
        return commentedComments;
    }

    /**
     * @param commentedComments the commentedComments to set
     */
    public void setCommentedComments(Set<Comment> commentedComments) {
        this.commentedComments = commentedComments;
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

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the province
     */
    public Province getProvince() {
        return province;
    }

    /**
     * @param province the province to set
     */
    public void setProvince(Province province) {
        this.province = province;
    }
    
}