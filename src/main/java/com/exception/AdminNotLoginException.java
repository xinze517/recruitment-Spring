package com.exception;

public class AdminNotLoginException extends Exception{

    private static final long serialVersionUID = 1L;

    public AdminNotLoginException() {
    }

    public AdminNotLoginException(String message) {
        super(message);
    }
}
