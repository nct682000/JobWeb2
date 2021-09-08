/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.service.impl;

import com.qv_ct.pojos.Tag;
import com.qv_ct.repository.TagRepository;
import com.qv_ct.service.TagService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nct68
 */
@Service
public class TagServiceImpl implements TagService{
    @Autowired
    private TagRepository tagRepository;

    @Override
    public List<Tag> getTags() {
        return this.tagRepository.getTags();
    }

    @Override
    public boolean addOrUpdate(Tag t) {
        return this.tagRepository.addOrUpdate(t);
    }
    
}
