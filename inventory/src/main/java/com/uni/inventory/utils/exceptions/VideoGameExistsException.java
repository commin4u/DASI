package com.uni.inventory.utils.exceptions;

public class VideoGameExistsException extends RuntimeException {

    public VideoGameExistsException(String message) {
        super(message);
    }
}