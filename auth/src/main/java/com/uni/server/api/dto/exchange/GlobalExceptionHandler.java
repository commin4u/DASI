package com.uni.server.api.dto.exchange;

import com.uni.server.utils.exceptions.AuthenticationException;
import com.uni.server.utils.exceptions.MissingRegisteredUserException;
import com.uni.server.utils.exceptions.UserNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import static org.springframework.http.HttpStatus.BAD_REQUEST;
import static org.springframework.http.HttpStatus.INTERNAL_SERVER_ERROR;
import static org.springframework.http.HttpStatus.NOT_FOUND;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(value = {AuthenticationException.class})
    public ResponseEntity<Object> handleBadRequest(RuntimeException ex) {
        ErrorResponse response = new ErrorResponse(ex.getMessage(), BAD_REQUEST.value());
        return ResponseEntity.status(BAD_REQUEST).body(response);
    }

    @ExceptionHandler(value = {UserNotFoundException.class, MissingRegisteredUserException.class})
    public ResponseEntity<Object> handleNotFound(RuntimeException ex) {
        ErrorResponse response = new ErrorResponse(ex.getMessage(), NOT_FOUND.value());
        return ResponseEntity.status(NOT_FOUND).body(response);
    }

    @ExceptionHandler(value = {Exception.class})
    public ResponseEntity<Object> handleInternalException(Exception ex) {
        ErrorResponse response = new ErrorResponse(ex.getMessage(), INTERNAL_SERVER_ERROR.value());
        return ResponseEntity.status(INTERNAL_SERVER_ERROR).body(response);
    }
}
