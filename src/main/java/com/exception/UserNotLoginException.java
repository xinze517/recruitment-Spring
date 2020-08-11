package com.exception;

public class UserNotLoginException extends Exception{
    //控制版本是否兼容
    private final static long serialVersionUID = 1L;

    public UserNotLoginException() {
    }

    public UserNotLoginException(String message) {
        super(message);
    }
}
