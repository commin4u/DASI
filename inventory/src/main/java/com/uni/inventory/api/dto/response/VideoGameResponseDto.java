package com.uni.inventory.api.dto.response;

import lombok.Builder;

@Builder
public record VideoGameResponseDto(Long id,
                                   Long addedByUserId,
                                   String title,
                                   String videoGameRentalTier,
                                   Integer pricePerRent,
                                   Integer baseRentDays,
                                   Integer pricePerAdditionalRentDay,
                                   String platform,
                                   String contentType,
                                   String imageBase64) implements ResponseDto {
}
