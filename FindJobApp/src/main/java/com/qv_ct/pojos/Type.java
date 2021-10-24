/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qv_ct.pojos;

/**
 *
 * @author nct68
 */
public enum Type {
    LIKE, DISLIKE;
    
    private static Type[] list = Type.values();
    
    public static Type getType(int i ){
        return list[i];
    }
    
}
