package com.exception;

public class UserAccessLimitException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public UserAccessLimitException() {
    }

    public UserAccessLimitException(String message) {
        super(message);
    }
}
