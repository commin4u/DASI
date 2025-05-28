package com.uni.order.service;

import org.springframework.stereotype.Component;

@Component
public class PriceCalculator {

    Double calculatePrice(final Integer defaultPrice, final Integer requestedNoOfDays) {
        return (double) (defaultPrice * requestedNoOfDays);
    }
}
