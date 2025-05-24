package com.uni.inventory.api.dto.response;

import lombok.Builder;

@Builder
public record VideoGameResponseDto(String title, String videoGameType, Integer pricePerRent, Integer baseRentDays,
                                   Integer pricePerAdditionalRentDay) implements ResponseDto {}
