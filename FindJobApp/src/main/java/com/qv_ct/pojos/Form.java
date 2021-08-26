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
public enum Form {
    INTERN{
        @Override
        public String toString() {
            return "Thực tập sinh";
        }
        
    },
    GRADUATED{
        @Override
        public String toString() {
            return "Mới ra trường";
        }
        
    },
    STAFF{
        @Override
        public String toString() {
            return "Nhân viên";
        }
        
    },
    LEADER{
        @Override
        public String toString() {
            return "Trưởng phòng";
        }
  
    },
    MANAGER{
        @Override
        public String toString() {
            return "Quản lý";
        }
        
    },
    SENIOR_MANAGER{
        @Override
        public String toString() {
            return "Quản lý cấp cao";
        }
        
    },
    EXECUTIVES{
        @Override
        public String toString() {
            return "Giám đốc điều hành";
        }
        
    };
    
}
