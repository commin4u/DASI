package com.uni.inventory.model.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import static com.uni.inventory.model.enums.Price.BASIC;
import static com.uni.inventory.model.enums.Price.PREMIUM;

@RequiredArgsConstructor
@Getter
public enum Type {
    NEW(1, PREMIUM),
    REGULAR(3, BASIC),
    OLD(5, BASIC);

    //premium for 1 day of rent
    //default price for default numberOfRents
    private final Integer defaultNumberOfDaysOfRent;
    private final Price priceType;
}