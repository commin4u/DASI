package com.uni.server.api.dto.request;

import jakarta.validation.constraints.NotNull;

public record UserRequestDto(@NotNull(message = "Email shouldn't be null") String email,
                             @NotNull(message = "Password shouldn't be null") String password) {
}
