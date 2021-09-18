
import com.qv_ct.pojos.Form;
import com.qv_ct.pojos.Role;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author nct68
 */
public class Tester{
    public static void main(String[] args) {
        Form f = Form.INTERN;
        System.out.println(f);
        
        Role r = Role.ADMIN;
        if (r.ordinal() == 0)
            System.out.println(1);
    }
}
