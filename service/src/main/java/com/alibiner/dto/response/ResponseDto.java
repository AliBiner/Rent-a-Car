package com.alibiner.dto.response;

public class ResponseDto implements IResponseDto{
    private final String statusCode;
    private final String message;
    private final boolean isSuccess;
    private final Object body;

    public ResponseDto(String statusCode, String message, boolean isSuccess) {
        this(statusCode,message,isSuccess,null);
    }

    public ResponseDto(String statusCode, String message, boolean isSuccess, Object body) {
        this.statusCode = statusCode;
        this.message = message;
        this.isSuccess = isSuccess;
        this.body = body;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public String getMessage() {
        return message;
    }

    public boolean isSuccess() {
        return isSuccess;
    }

    public Object getBody() {
        return body;
    }

}
