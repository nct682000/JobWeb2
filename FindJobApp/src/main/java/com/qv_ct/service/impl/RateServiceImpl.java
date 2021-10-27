package com.qv_ct.service.impl;

import com.qv_ct.pojos.Rate;
import com.qv_ct.pojos.User;
import com.qv_ct.repository.RateRepository;
import com.qv_ct.service.RateService;
import com.qv_ct.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nct68
 */
@Service
public class RateServiceImpl implements RateService {

    @Autowired
    private RateRepository rateRepository;
    @Autowired
    private UserService userService;

    @Override
    public Rate addOrUpdate(String point, int canId, int recId) {
        User can = this.userService.getUserById(canId);
        User rec = this.userService.getUserById(recId);
        if (!this.rateRepository.getRate(canId, recId).isEmpty()) {
            System.out.println(this.rateRepository.getRate(canId, recId));
            Rate r = this.rateRepository.getRate(canId, recId).get(0);
            r.setPoint(Integer.parseInt(point));
            System.out.println("-------------Update-----------------");
            return this.rateRepository.addOrUpdate(r);
        }

        Rate r = new Rate();
        r.setPoint(Integer.parseInt(point));
        r.setCandidate(can);
        r.setRecruiter(rec);
        System.out.println("-------------Create-----------------");
        return this.rateRepository.addOrUpdate(r);
    }

    @Override
    public long rateCountRecruiter(int recId) {
        return this.rateRepository.rateCountRecruiter(recId);
    }

    @Override
    public double ratePointRecruiter(int recId) {
        return this.rateRepository.ratePointRecruiter(recId);
    }

    @Override
    public List<Rate> getRate(int canId, int recId) {
        return this.rateRepository.getRate(canId, recId);
    }

//    chart
    @Override
    public List<Object[]> rateForChart(int year) {
        return this.rateRepository.rateForChart(year);
    }

    @Override
    public List<Object[]> rateForChart2(int year, int month) {
        return this.rateRepository.rateForChart2(year, month);
    }
}
