package com.exception;

public class EntNotLoginException extends Exception{

    //控制版本是否兼容
    private final static long serialVersionUID = 1L;

    public EntNotLoginException() {
    }

    public EntNotLoginException(String message) {
        super(message);
    }
}
