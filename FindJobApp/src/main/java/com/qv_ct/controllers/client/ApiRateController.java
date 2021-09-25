
package com.qv_ct.controllers.client;

import com.qv_ct.pojos.Rate;
import com.qv_ct.service.RateService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author nct68
 */
@RestController
public class ApiRateController {
    @Autowired
    private RateService rateService;
    
    @PostMapping(path = "/api/add-rate", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Rate> addRate(@RequestBody Map<String, String> params){
        try{
            String point = params.get("point");
            int canId = Integer.parseInt(params.get("canId"));
            int recId = Integer.parseInt(params.get("recId"));
            
            Rate r = this.rateService.addOrUpdate(point, canId, recId);
            return new ResponseEntity<>(r, HttpStatus.CREATED);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
