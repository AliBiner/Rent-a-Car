package com.alibiner.exceptions;

import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.enums.errorMessages.IErrorCode;

import java.util.*;

public class ValidationException extends Exception implements IErrorCode {

    private final ErrorCode errorCode;
    private final List<String> messages;
    private final String message;

    public ValidationException(ErrorCode errorCode, List<String> errorMessages) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
        this.messages = errorMessages;
        this.message = "";
    }

    public ValidationException(ErrorCode errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
        this.message = message;
        this.messages = List.of();
    }



    public List<String> getErrorMessages(){
        return this.messages;
    }

    @Override
    public String getErrorCode() {
        return errorCode.getCode();
    }
}
