package com.uni.order.api.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;

public record InventoryServiceApiResponse(
        @JsonProperty("data") VideoGameResponse data,
        @JsonProperty("error") String error) implements ApiResponseDto<VideoGameResponse> {
}