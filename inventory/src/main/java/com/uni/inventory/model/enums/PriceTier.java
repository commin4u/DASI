package com.uni.inventory.model.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public enum PriceTier {
    BASIC(30),
    PREMIUM(40);

    private final Integer priceValue;
}