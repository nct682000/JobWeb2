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
public enum Sex {
    MALE{
        @Override
        public String toString() {
            return "Nam";
        }
        
    }, FEMALE{
        @Override
        public String toString() {
            return "Nữ";
        }
        
    }, NEUTRAL{
        @Override
        public String toString() {
            return "Giới tính khác";
        }
        
    };
}
