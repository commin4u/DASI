package com.uni.order.api.dto.exchange;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
public class ErrorResponse {

    private String message;
    private Integer code;
}
