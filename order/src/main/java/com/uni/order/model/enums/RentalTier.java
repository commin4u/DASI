package com.uni.order.model.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import static com.uni.order.model.enums.PriceTier.BASIC;
import static com.uni.order.model.enums.PriceTier.PREMIUM;

@RequiredArgsConstructor
@Getter
public enum RentalTier {
    NEW(1, PREMIUM),
    REGULAR(3, BASIC),
    OLD(5, BASIC);

    //premium for 1 day of rent
    //default price for default numberOfRents
    private final Integer defaultNumberOfDaysOfRent;
    private final PriceTier priceType;

}