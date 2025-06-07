package com.uni.order.api.dto.response;

import lombok.Builder;

@Builder
public record OrderResponseDto(Long id,
                               Long videoGameId,
                               Double rentalPrice,
                               String startDate,
                               String endDate,
                               String orderStatus) {
}
