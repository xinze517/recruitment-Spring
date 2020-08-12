package com.exception;

public class EntAccessLimitException extends RuntimeException {

    //控制版本是否兼容
    private final static long serialVersionUID = 1L;

    public EntAccessLimitException() {
    }

    public EntAccessLimitException(String message) {
        super(message);
    }
}
