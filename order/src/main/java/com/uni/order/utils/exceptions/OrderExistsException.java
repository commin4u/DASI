package com.uni.order.utils.exceptions;

public class OrderExistsException extends RuntimeException {

    public OrderExistsException(String message) {
        super(message);
    }
}