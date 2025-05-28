package com.uni.order.api.dto.request;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Builder;

@Builder
public record OrderRequestDto(@NotNull(message = "Number of days for rental shouldn't be null")
                           @Positive(message = "Number of days for rental should be positive")
                           @Min(value = 1, message = "Number of days for rental should be at least 1")
                           Integer numberOfDays,
                              @NotEmpty(message = "Date should be populated") String startDate) {
}
