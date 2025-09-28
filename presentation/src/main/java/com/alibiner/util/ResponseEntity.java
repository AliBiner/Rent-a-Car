package com.alibiner.util;

import com.alibiner.enums.errorMessages.ErrorCode;

public class ResponseEntity<T> {
    private String statusCode;
    private String message;
    private T data;

    public ResponseEntity(String statusCode, String message, T data) {
        this.statusCode = statusCode;
        this.message = message;
        this.data = data;
    }

    public ResponseEntity() {
    }

    public ResponseEntity<T> ok(T data){
        this.statusCode = ErrorCode.OK.getCode();
        this.message = ErrorCode.OK.getMessage();
        this.data = data;
        return this;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public String getMessage() {
        return message;
    }

    public T getData() {
        return data;
    }
}
