package com.pojo;

public class APIResult {

    //状态码
    private final static int successCode = 200;
    private final static int errorCode = 400;
    private int code;
    private String message;
    private Object data;

    public APIResult() {

    }

    public APIResult(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static APIResult success(String message, Object data) {
        return new APIResult(successCode, message, data);
    }

    public static APIResult success(String message) {
        return new APIResult(successCode, message, null);
    }

    public static APIResult success(Object data) {
        return new APIResult(successCode, null, data);
    }

    public static APIResult error(String message, Object data) {
        return new APIResult(errorCode, message, data);
    }

    public static APIResult error(String message) {
        return new APIResult(errorCode, message, null);
    }

    public static APIResult error(Object data) {
        return new APIResult(errorCode, null, data);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
