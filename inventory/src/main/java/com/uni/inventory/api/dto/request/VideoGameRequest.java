package com.uni.inventory.api.dto.request;

import com.uni.inventory.model.enums.Platform;
import com.uni.inventory.model.enums.Type;
import jakarta.validation.constraints.NotNull;

public record VideoGameRequest(
        @NotNull(message = "Title shouldn't be null") String title,
        @NotNull(message = "Type shouldn't be null") Type type,
        @NotNull(message = "Platform shouldn't be null") Platform platform) {
}
