package com.uni.server.api.dto.response;

import lombok.Builder;

@Builder
public record RentalUserResponse(Long id, String email) implements ResponseDto {
}
