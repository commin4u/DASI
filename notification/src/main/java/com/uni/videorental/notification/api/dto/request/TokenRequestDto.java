package com.uni.videorental.notification.api.dto.request;

import jakarta.validation.constraints.NotEmpty;

public record TokenRequestDto(@NotEmpty String token) {
}
