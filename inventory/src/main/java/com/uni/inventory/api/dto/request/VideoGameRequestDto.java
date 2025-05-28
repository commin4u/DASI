package com.uni.inventory.api.dto.request;

import com.uni.inventory.model.enums.Platform;
import com.uni.inventory.model.enums.RentalTier;
import jakarta.validation.constraints.NotNull;

public record VideoGameRequestDto(
        @NotNull(message = "Title shouldn't be null") String title,
        @NotNull(message = "Rental tier shouldn't be null") RentalTier rentalTier,
        @NotNull(message = "Platform shouldn't be null") Platform platform) {
}
