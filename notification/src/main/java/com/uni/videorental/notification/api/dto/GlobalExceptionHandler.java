package com.uni.videorental.notification.api.dto;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import static org.springframework.http.HttpStatus.INTERNAL_SERVER_ERROR;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(value = {Exception.class})
    public ResponseEntity<Object> handleInternalException(Exception ex) {
        ErrorResponse response = new ErrorResponse(ex.getMessage(), INTERNAL_SERVER_ERROR.value());
        log.error(ex.getMessage(), ex);
        return ResponseEntity.status(INTERNAL_SERVER_ERROR).body(response);
    }
}