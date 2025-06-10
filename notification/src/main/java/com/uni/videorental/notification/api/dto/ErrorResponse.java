package com.uni.videorental.notification.api.dto;

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
