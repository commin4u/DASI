package com.uni.server.api.dto.response;

public record TokenResponse(String accessToken, Integer expires_in) {
}
