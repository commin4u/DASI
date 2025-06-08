package com.uni.server.utils.exceptions;

public class MissingRegisteredUserException extends RuntimeException {
    public MissingRegisteredUserException(String message) {
        super(message);
    }
}
