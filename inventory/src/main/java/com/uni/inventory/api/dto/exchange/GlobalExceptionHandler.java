package com.uni.inventory.api.dto.exchange;

import com.uni.inventory.utils.exceptions.IllegalOperationException;
import com.uni.inventory.utils.exceptions.RecordNotFoundException;
import com.uni.inventory.utils.exceptions.VideoGameExistsException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import static org.springframework.http.HttpStatus.BAD_REQUEST;
import static org.springframework.http.HttpStatus.INTERNAL_SERVER_ERROR;
import static org.springframework.http.HttpStatus.NOT_FOUND;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(value = {VideoGameExistsException.class})
    public ResponseEntity<Object> handleBadRequest(RuntimeException ex) {
        ErrorResponse response = new ErrorResponse(ex.getMessage(), BAD_REQUEST.value());
        log.error(ex.getMessage(), ex);
        return ResponseEntity.status(BAD_REQUEST).body(response);
    }

    @ExceptionHandler(value = {RecordNotFoundException.class, IllegalOperationException.class})
    public ResponseEntity<Object> handleNotFound(RuntimeException ex) {
        ErrorResponse response = new ErrorResponse(ex.getMessage(), NOT_FOUND.value());
        log.error(ex.getMessage(), ex);
        return ResponseEntity.status(NOT_FOUND).body(response);
    }

    @ExceptionHandler(value = {Exception.class})
    public ResponseEntity<Object> handleInternalException(Exception ex) {
        ErrorResponse response = new ErrorResponse(ex.getMessage(), INTERNAL_SERVER_ERROR.value());
        log.error(ex.getMessage(), ex);
        return ResponseEntity.status(INTERNAL_SERVER_ERROR).body(response);
    }
}